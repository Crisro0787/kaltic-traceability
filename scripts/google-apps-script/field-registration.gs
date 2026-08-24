const SCRIPT_VERSION = "FIELD_REGISTRATION_IPFS_V1";

const PINATA_GATEWAY =
  "https://cyan-biological-bobolink-587.mypinata.cloud/ipfs/";


/* =========================================================
   CONFIGURACIÓN PRIVADA
   ========================================================= */

function getConfig() {

  const properties =
    PropertiesService.getScriptProperties();

  const googleMapsApiKey =
    properties.getProperty("GOOGLE_MAPS_API_KEY");

  const pinataJwt =
    properties.getProperty("PINATA_JWT");

  if (!googleMapsApiKey) {
    throw new Error(
      "Falta GOOGLE_MAPS_API_KEY en Script Properties"
    );
  }

  if (!pinataJwt) {
    throw new Error(
      "Falta PINATA_JWT en Script Properties"
    );
  }

  return {
    googleMapsApiKey: googleMapsApiKey,
    pinataJwt: pinataJwt
  };
}


/* =========================================================
   GET - TEST DEL WEB APP
   ========================================================= */

function doGet(e) {

  return ContentService
    .createTextOutput(JSON.stringify({
      status: "ok",
      script: SCRIPT_VERSION
    }))
    .setMimeType(ContentService.MimeType.JSON);

}


/* =========================================================
   POST PRINCIPAL
   ========================================================= */

function doPost(e) {

  const lock = LockService.getScriptLock();

  lock.waitLock(30000);

  const sheet =
    SpreadsheetApp
      .getActiveSpreadsheet()
      .getActiveSheet();

  try {

    if (!e || !e.postData || !e.postData.contents) {
      throw new Error("No se recibió postData");
    }

    /* -----------------------------------------
       LEER JSON RECIBIDO DESDE JOGET
       ----------------------------------------- */

    const datos =
      JSON.parse(e.postData.contents);

    const geojsonText = datos.geojson;

    const fieldName =
      datos.fieldName || "field";

    const farm =
      datos.Farm;


    /* -----------------------------------------
       VALIDACIONES
       ----------------------------------------- */

    if (!geojsonText) {
      throw new Error("No se recibió geojson");
    }

    if (!farm) {
      throw new Error("No se recibió Farm");
    }


    /* -----------------------------------------
       CONVERTIR GEOJSON
       ----------------------------------------- */

    const geojsonObject =
      typeof geojsonText === "string"
        ? JSON.parse(geojsonText)
        : geojsonText;


    /* -----------------------------------------
       HASH SHA-256 DEL GEOJSON
       ----------------------------------------- */

    const canonicalGeojson =
      canonicalize(geojsonObject);

    const geojsonHash =
      sha256(canonicalGeojson);


    /* -----------------------------------------
       CALCULAR ÁREA EN HECTÁREAS
       ----------------------------------------- */

    const areaHa =
      calculateAreaHaFromGeojson(
        geojsonObject
      );


    /* -----------------------------------------
       GENERAR idObject

       Ejemplo:

       FIELD-000001
       FIELD-000002
       FIELD-000003
       ----------------------------------------- */

    const idObject =
      generateFieldId(sheet);


    /* -----------------------------------------
       NOMBRE DE LA IMAGEN
       ----------------------------------------- */

    const imageFilename =
      idObject +
      "_" +
      sanitizeFileName(fieldName) +
      ".png";


    /* -----------------------------------------
       CREAR IMAGEN SATELITAL
       ----------------------------------------- */

    const imageBlob =
      generateSatellitePlotImageBlob(
        geojsonObject,
        imageFilename
      );


    /* -----------------------------------------
       SUBIR IMAGEN A PINATA / IPFS
       ----------------------------------------- */

    const pinataResult =
      uploadBlobToPinata(
        imageBlob,
        imageFilename,
        {
          id_object: idObject,
          Farm: String(farm),
          fieldName: String(fieldName),
          geojson_hash: geojsonHash,
          area_ha: String(areaHa),
          type: "field_satellite_image"
        }
      );


    /* -----------------------------------------
       URL IPFS
       ----------------------------------------- */

    const imageUrl =
      PINATA_GATEWAY +
      pinataResult.cid;


    /* -----------------------------------------
       GUARDAR EN GOOGLE SHEETS

       Columnas:

       A = versión
       B = fecha
       C = id_object
       D = Farm
       E = GeoJSON
       F = GeoJSON Hash
       G = nombre imagen
       H = CID
       I = URL
       J = hectáreas
       K = estado
       ----------------------------------------- */

    sheet.appendRow([
      SCRIPT_VERSION,
      new Date(),
      idObject,
      farm,
      typeof geojsonText === "string"
        ? geojsonText
        : JSON.stringify(geojsonText),
      geojsonHash,
      imageFilename,
      pinataResult.cid,
      imageUrl,
      areaHa,
      "OK"
    ]);


    /* -----------------------------------------
       RESPUESTA A JOGET

       Devuelvo id_object.
       ----------------------------------------- */

    return ContentService
      .createTextOutput(
        JSON.stringify({
          status: "success",
          version: SCRIPT_VERSION,

          id_object: idObject,

          Farm: farm,

          fieldName: fieldName,

          geojson_hash: geojsonHash,

          image_filename:
            imageFilename,

          image_cid:
            pinataResult.cid,

          image_url:
            imageUrl,

          area_ha:
            areaHa
        })
      )
      .setMimeType(
        ContentService.MimeType.JSON
      );


  } catch (error) {


    /* -----------------------------------------
       REGISTRAR ERROR EN GOOGLE SHEETS
       ----------------------------------------- */

    sheet.appendRow([
      SCRIPT_VERSION,
      new Date(),
      "",
      "",
      e && e.postData
        ? e.postData.contents
        : "",
      "",
      "",
      "",
      "",
      "",
      "ERROR: " + error.toString()
    ]);


    /* -----------------------------------------
       RESPUESTA ERROR
       ----------------------------------------- */

    return ContentService
      .createTextOutput(
        JSON.stringify({
          status: "error",
          version: SCRIPT_VERSION,
          message: error.toString()
        })
      )
      .setMimeType(
        ContentService.MimeType.JSON
      );


  } finally {

    lock.releaseLock();

  }

}


/* =========================================================
   GENERAR IDENTIFICADOR

   FIELD-000001
   FIELD-000002
   FIELD-000003

   Busca identificadores existentes
   en la columna C.
   ========================================================= */

function generateFieldId(sheet) {

  const prefix = "FIELD-";

  const lastRow =
    sheet.getLastRow();

  let maxSequence = 0;


  if (lastRow >= 2) {

    const existingIds =
      sheet
        .getRange(
          2,
          3,
          lastRow - 1,
          1
        )
        .getValues()
        .flat();


    existingIds.forEach(
      function(id) {

        if (
          typeof id === "string" &&
          id.startsWith(prefix)
        ) {

          const sequenceText =
            id.substring(
              prefix.length
            );

          const sequence =
            parseInt(
              sequenceText,
              10
            );


          if (
            !isNaN(sequence) &&
            sequence > maxSequence
          ) {

            maxSequence =
              sequence;

          }

        }

      }
    );

  }


  return (
    prefix +
    String(
      maxSequence + 1
    ).padStart(6, "0")
  );

}


/* =========================================================
   CALCULAR ÁREA DEL GEOJSON
   ========================================================= */

function calculateAreaHaFromGeojson(
  geojson
) {

  if (
    !geojson ||
    !geojson.geometry ||
    !geojson.geometry.coordinates
  ) {

    throw new Error(
      "GeoJSON inválido: no contiene geometry.coordinates"
    );

  }


  if (
    geojson.geometry.type !==
    "Polygon"
  ) {

    throw new Error(
      "Actualmente solo se admite GeoJSON tipo Polygon"
    );

  }


  const coords =
    geojson.geometry.coordinates[0];


  if (
    !coords ||
    coords.length < 4
  ) {

    throw new Error(
      "El polígono no contiene suficientes coordenadas"
    );

  }


  let area = 0;

  const earthRadius =
    6378137;


  for (
    let i = 0;
    i < coords.length - 1;
    i++
  ) {

    const lon1 =
      degreesToRadians(
        coords[i][0]
      );

    const lat1 =
      degreesToRadians(
        coords[i][1]
      );

    const lon2 =
      degreesToRadians(
        coords[i + 1][0]
      );

    const lat2 =
      degreesToRadians(
        coords[i + 1][1]
      );


    area +=
      (lon2 - lon1) *
      (
        2 +
        Math.sin(lat1) +
        Math.sin(lat2)
      );

  }


  const areaM2 =
    Math.abs(
      area *
      earthRadius *
      earthRadius /
      2
    );


  const areaHa =
    areaM2 / 10000;


  return Number(
    areaHa.toFixed(4)
  );

}


/* =========================================================
   CREAR IMAGEN SATELITAL
   ========================================================= */

function generateSatellitePlotImageBlob(geojson, fileName) {
  const config = getConfig();

  const coords = geojson.geometry.coordinates[0];

  const pathPoints = coords.map(function(point) {
    const lng = point[0];
    const lat = point[1];
    return lat + "," + lng;
  });

  const center = getCenter(coords);
  const zoom = getZoom(coords);

  const path =
    "color:0xff0000ff|weight:5|fillcolor:0xff000033|" +
    pathPoints.join("|");

  const staticMapUrl =
    "https://maps.googleapis.com/maps/api/staticmap" +
    "?center=" + center.lat + "," + center.lng +
    "&zoom=" + zoom +
    "&size=800x800" +
    "&scale=2" +
    "&maptype=satellite" +
    "&path=" + encodeURIComponent(path) +
    "&key=" + config.googleMapsApiKey;

  const response = UrlFetchApp.fetch(staticMapUrl, {
    muteHttpExceptions: true
  });

  if (response.getResponseCode() !== 200) {
    throw new Error(
      "Google Maps API respondió " +
      response.getResponseCode() +
      ": " +
      response.getContentText()
    );
  }

  return response.getBlob().setName(fileName);
}


/* =========================================================
   SUBIR ARCHIVO A PINATA / IPFS
   ========================================================= */

function uploadBlobToPinata(
  blob,
  fileName,
  metadata
) {

  const config =
    getConfig();


  const url =
    "https://api.pinata.cloud/pinning/pinFileToIPFS";


  const payload = {

    file:
      blob.setName(fileName),

    pinataMetadata:
      JSON.stringify({
        name: fileName,
        keyvalues:
          metadata || {}
      })

  };


  const options = {

    method: "post",

    headers: {
      Authorization:
        "Bearer " +
        config.pinataJwt
    },

    payload:
      payload,

    muteHttpExceptions:
      true

  };


  const response =
    UrlFetchApp.fetch(
      url,
      options
    );


  const code =
    response.getResponseCode();

  const text =
    response.getContentText();


  if (
    code < 200 ||
    code >= 300
  ) {

    throw new Error(
      "Pinata respondió " +
      code +
      ": " +
      text
    );

  }


  const result =
    JSON.parse(text);


  if (!result.IpfsHash) {

    throw new Error(
      "Pinata no devolvió IpfsHash"
    );

  }


  return {

    cid:
      result.IpfsHash,

    raw:
      result

  };

}


/* =========================================================
   OBTENER CENTRO DEL POLÍGONO
   ========================================================= */

function getCenter(coords) {

  let minLat = 90;
  let maxLat = -90;

  let minLng = 180;
  let maxLng = -180;


  coords.forEach(
    function(point) {

      const lng =
        point[0];

      const lat =
        point[1];


      minLat =
        Math.min(
          minLat,
          lat
        );

      maxLat =
        Math.max(
          maxLat,
          lat
        );

      minLng =
        Math.min(
          minLng,
          lng
        );

      maxLng =
        Math.max(
          maxLng,
          lng
        );

    }
  );


  return {

    lat:
      (minLat + maxLat) /
      2,

    lng:
      (minLng + maxLng) /
      2

  };

}


/* =========================================================
   CALCULAR ZOOM APROXIMADO
   ========================================================= */

function getZoom(coords) {

  let minLat = 90;
  let maxLat = -90;

  let minLng = 180;
  let maxLng = -180;


  coords.forEach(
    function(point) {

      const lng =
        point[0];

      const lat =
        point[1];


      minLat =
        Math.min(
          minLat,
          lat
        );

      maxLat =
        Math.max(
          maxLat,
          lat
        );

      minLng =
        Math.min(
          minLng,
          lng
        );

      maxLng =
        Math.max(
          maxLng,
          lng
        );

    }
  );


  const maxDiff =
    Math.max(
      maxLat - minLat,
      maxLng - minLng
    );


  if (maxDiff > 0.05)
    return 13;

  if (maxDiff > 0.02)
    return 14;

  if (maxDiff > 0.01)
    return 15;

  if (maxDiff > 0.005)
    return 16;

  if (maxDiff > 0.002)
    return 17;


  return 18;

}


/* =========================================================
   SHA-256
   ========================================================= */

function sha256(text) {

  const rawHash =
    Utilities.computeDigest(
      Utilities.DigestAlgorithm.SHA_256,
      text,
      Utilities.Charset.UTF_8
    );


  return rawHash
    .map(
      function(byte) {

        return (
          "0" +
          (
            byte & 0xff
          ).toString(16)
        ).slice(-2);

      }
    )
    .join("");

}


/* =========================================================
   CANONICALIZAR JSON
   ========================================================= */

function canonicalize(obj) {

  if (
    Array.isArray(obj)
  ) {

    return (
      "[" +
      obj
        .map(canonicalize)
        .join(",") +
      "]"
    );

  }


  if (
    obj !== null &&
    typeof obj === "object"
  ) {

    return (
      "{" +
      Object
        .keys(obj)
        .sort()
        .map(
          function(key) {

            return (
              JSON.stringify(key) +
              ":" +
              canonicalize(
                obj[key]
              )
            );

          }
        )
        .join(",") +
      "}"
    );

  }


  return JSON.stringify(obj);

}


/* =========================================================
   GRADOS A RADIANES
   ========================================================= */

function degreesToRadians(
  degrees
) {

  return (
    degrees *
    Math.PI /
    180
  );

}


/* =========================================================
   LIMPIAR NOMBRE DE ARCHIVO
   ========================================================= */

function sanitizeFileName(name) {

  return name
    .toString()
    .trim()
    .normalize("NFD")
    .replace(
      /[\u0300-\u036f]/g,
      ""
    )
    .replace(
      /ñ/g,
      "n"
    )
    .replace(
      /Ñ/g,
      "N"
    )
    .replace(
      /[^a-zA-Z0-9-_]/g,
      "_"
    )
    .replace(
      /_+/g,
      "_"
    );

}


/* =========================================================
   AUTORIZAR UrlFetchApp
   Ejecutar manualmente una vez si es necesario
   ========================================================= */

function authorizeAll() {

  UrlFetchApp.fetch(
    "https://www.google.com"
  );

}


/* =========================================================
   TEST DE CONFIGURACIÓN

   Puedes ejecutar esta función manualmente.
   NO muestra las claves.
   ========================================================= */

function testConfig() {

  const config =
    getConfig();


  Logger.log(
    "GOOGLE_MAPS_API_KEY configurada: " +
    Boolean(
      config.googleMapsApiKey
    )
  );


  Logger.log(
    "PINATA_JWT configurado: " +
    Boolean(
      config.pinataJwt
    )
  );

}
