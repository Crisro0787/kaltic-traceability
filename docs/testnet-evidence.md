# Cardano Preprod Evidence

This document provides representative public on-chain evidence from the Kaltic agricultural traceability prototype validated under Project Catalyst Fund 11.

The final pilot architecture does **not** place every operational record on-chain. Operational records such as crop and cut-level data remain in the application layer. Selected critical records — including field identity and pilot-specific downstream events — are linked to Cardano Preprod transactions.

The four examples below represent the principal traceability patterns exercised during final validation.

---

## 1. Field / origin evidence

**Kaltic record:** `FIELD-000024`  
**Network:** Cardano Preprod  
**Transaction ID:**

`efcfe3f904ba84d0f6d14dcc1dbd303e9b689f8fbfa261a05238b846dd4ab683`

**Explorer:**

https://preprod.cardanoscan.io/transaction/efcfe3f904ba84d0f6d14dcc1dbd303e9b689f8fbfa261a05238b846dd4ab683

### What it demonstrates

This record represents agricultural field identity in the prototype and shows how an application-level origin object can be associated with persistent Cardano evidence.

---

## 2. Blueberry first-mile delivery

**Pilot:** Blue Berry Trade and Company  
**Kaltic record:** `DEL-000001`  
**Validated endpoint:** Delivery  
**Network:** Cardano Preprod  
**Transaction ID:**

`23cb018a0ff96f9c08ed6a56744618be47c0d6dbf3af49fa4aad16c95c205556`

**Explorer:**

https://preprod.cardanoscan.io/transaction/23cb018a0ff96f9c08ed6a56744618be47c0d6dbf3af49fa4aad16c95c205556

### What it demonstrates

The blueberry pilot tested preservation of producer and plot origin through operational cuts, inventory and first-mile delivery.

Cut-level data remained part of the operational application context. The downstream delivery record is the selected event represented here with independently inspectable Cardano evidence.

---

## 3. Coffee transformation

**Pilot:** Cafe Chichini  
**Kaltic record:** `PERG-000002`  
**Validated endpoint:** Wet-milling / parchment transformation  
**Network:** Cardano Preprod  
**Transaction ID:**

`264ad0ff1b38382b363279160811cbc18db2a38b3668f1b215783cd069dcd197`

**Explorer:**

https://preprod.cardanoscan.io/transaction/264ad0ff1b38382b363279160811cbc18db2a38b3668f1b215783cd069dcd197

### What it demonstrates

The coffee pilot tested whether origin relationships remained visible when product changed form through wet milling.

The transformation record links the resulting parchment-coffee object to its upstream operational context and provides Cardano Preprod evidence for the selected event.

---

## 4. Malanga multi-source aggregation

**Pilot:** Empacadora El Remolino de Santa Rosa  
**Kaltic record:** `AGG-MAL-000002`  
**Validated endpoint:** Aggregated harvest lot  
**Network:** Cardano Preprod  
**Transaction ID:**

`49aeb09beabbde293da540314f97f6c789aa3a971cbb32a07e47f24f42e49726`

**Explorer:**

https://preprod.cardanoscan.io/transaction/49aeb09beabbde293da540314f97f6c789aa3a971cbb32a07e47f24f42e49726

### What it demonstrates

The malanga pilot tested preservation of multiple producer and field origins when several operational cut records were combined into one aggregated lot.

The final aggregation record was generated after correcting required-source selection and payload issues discovered during testing.

---

## Validation totals

Across all three final pilot evidence sets:

- **18 blockchain confirmations** were reported.
- **17 transaction IDs** were individually enumerated.
- The Pilot 3 source summary reports one additional confirmation for which no transaction ID is listed in the source transaction table.

That discrepancy is intentionally preserved. This repository does not invent or infer the missing identifier.

## Scope and limitations

These transactions demonstrate that selected Kaltic traceability records reached Cardano Preprod and can be independently inspected.

They do not, by themselves, prove:

- the truthfulness of source data entered by a participant;
- physical possession or ownership of a commodity;
- regulatory compliance;
- production readiness;
- full farm-to-consumer coverage;
- cryptographic accountability of the agricultural organization represented in the record.

The project uses Cardano as an evidence layer within a broader traceability system. The operational meaning of each transaction depends on the application records and the explicit relationships preserved by Kaltic.

See also:

- [`architecture.md`](architecture.md)
- [`pilot-workflows.md`](pilot-workflows.md)
