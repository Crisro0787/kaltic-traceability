const SCRIPT_VERSION = "HARVESTING_V1";

function doGet(e) {
  return ContentService
    .createTextOutput(JSON.stringify({
      status: "ok",
      script: SCRIPT_VERSION
    }))
    .setMimeType(ContentService.MimeType.JSON);
}

function doPost(e) {

  const lock = LockService.getScriptLock();
  lock.waitLock(30000);

  const sheet = SpreadsheetApp
    .getActiveSpreadsheet()
    .getActiveSheet();

  try {

    if (!e || !e.postData || !e.postData.contents) {
      throw new Error("No se recibió postData");
    }

    const datos = JSON.parse(e.postData.contents);


    /* 1. GENERAR HARVEST ID */

    const harvestId = generateHarvestId();


    /* 2. CREAR JSON HARVESTING */

    const harvestJson = {

      immediate_subsequent_recipient: {
        business_name: datos.cooler_name,
        phone: datos.cooler_phone,
        street: datos.cooler_street,
        city: datos.cooler_city,
        state: datos.cooler_state,
        postal_code: datos.cooler_postal_code,
        country: datos.cooler_country
      },

      commodity: datos.Commodity,
      variety: datos.Variety,

      quantity: datos.Quantity,
      unit_of_measure: datos.Unit_of_Measure,

      farm: {
        business_name: datos.farm_name,
        phone: datos.farm_phone,
        street: datos.farm_street,
        city: datos.farm_city,
        state: datos.farm_state,
        postal_code: datos.farm_postal_code,
        country: datos.farm_country
      },

      growing_area: datos.fieldName,

      harvest_start: datos.Harvest_start,
      harvest_end: datos.Harvest_end,

      reference_document_type:
        datos.reference_document_type,

      reference_document_number:
        harvestId
    };


    /* 3. JSON CANÓNICO */

    const canonicalJson =
      canonicalize(harvestJson);


    /* 4. HASH SHA-256 */

    const jsonHash =
      sha256(canonicalJson);

    const jsonHash1 =
      jsonHash.substring(0, 32);

    const jsonHash2 =
      jsonHash.substring(32, 64);


    /* 5. REGISTRAR EN GOOGLE SHEETS */

    sheet.appendRow([
      SCRIPT_VERSION,
      new Date(),
      harvestId,
      canonicalJson,
      jsonHash,
      jsonHash1,
      jsonHash2,
      e.postData.contents,
      "OK"
    ]);


    /* 6. RESPUESTA A JOGET */

    return ContentService
      .createTextOutput(
        JSON.stringify({

          status: "success",

          harvest_id:
            harvestId,

          harvesting_json:
            canonicalJson,

          harvesting_json_hash:
            jsonHash,

          harvesting_json_hash_1:
            jsonHash1,

          harvesting_json_hash_2:
            jsonHash2

        })
      )
      .setMimeType(
        ContentService.MimeType.JSON
      );


  } catch (error) {

    sheet.appendRow([
      SCRIPT_VERSION,
      new Date(),
      "",
      "",
      "",
      "",
      "",
      e && e.postData
        ? e.postData.contents
        : "",
      "ERROR: " + error.toString()
    ]);

    return ContentService
      .createTextOutput(
        JSON.stringify({
          status: "error",
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


/* GENERAR HARVEST ID */

function generateHarvestId() {

  const properties =
    PropertiesService.getScriptProperties();

  const current =
    Number(
      properties.getProperty(
        "HARVEST_SEQUENCE"
      ) || 0
    );

  const next = current + 1;

  properties.setProperty(
    "HARVEST_SEQUENCE",
    String(next)
  );

  return (
    "HARVEST-" +
    String(next).padStart(6, "0")
  );
}


/* SHA-256 */

function sha256(text) {

  const rawHash =
    Utilities.computeDigest(
      Utilities.DigestAlgorithm.SHA_256,
      text,
      Utilities.Charset.UTF_8
    );

  return rawHash
    .map(function(byte) {

      return (
        "0" +
        (byte & 0xff).toString(16)
      ).slice(-2);

    })
    .join("");
}


/* CANONICAL JSON */

function canonicalize(obj) {

  if (Array.isArray(obj)) {

    return (
      "[" +
      obj.map(canonicalize).join(",") +
      "]"
    );
  }

  if (
    obj !== null &&
    typeof obj === "object"
  ) {

    return (
      "{" +
      Object.keys(obj)
        .sort()
        .map(function(key) {

          return (
            JSON.stringify(key) +
            ":" +
            canonicalize(obj[key])
          );

        })
        .join(",") +
      "}"
    );
  }

  return JSON.stringify(obj);
}
