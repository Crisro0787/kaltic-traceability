# Cardano Preprod Evidence

This document provides public on-chain evidence of the current Kaltic agricultural traceability MVP interacting with the Cardano Preprod network.

These transactions were created by the existing prototype before the proposed CIP-0170 organizational identity integration.

They demonstrate the current technical foundation of Kaltic: agricultural objects and traceability events can be created in the application and linked to public Cardano transactions.

---

## 1. Agricultural Field Registration and NFT Minting

**Kaltic workflow:** Agricultural Field / Plot Registration  
**Network:** Cardano Preprod  
**Transaction ID:**

`8c7e02a0c3056d33587999337def2e03828510f993a92f70d671b8fac3a17292`

**Cardanoscan:**

https://preprod.cardanoscan.io/transaction/8c7e02a0c3056d33587999337def2e03828510f993a92f70d671b8fac3a17292

### What it demonstrates

This transaction corresponds to the registration of an agricultural field in the Kaltic MVP and the minting of its blockchain asset.

The current application captures information about the field, including its agricultural organization, field name, geographic area and a hash of its geographic information.

Kaltic then uses Cardano to mint an NFT representing the registered field and stores the resulting transaction information in the application.

This provides a persistent on-chain identifier that can be referenced by subsequent traceability events.

---

## 2. Harvesting Traceability Event

**Kaltic workflow:** Harvesting Critical Tracking Event (CTE)  
**Network:** Cardano Preprod  
**Transaction ID:**

`2a42fb79867b948d5990dd564abee307b404de54cdcdd6d78dea84a4039b472b`

**Cardanoscan metadata:**

https://preprod.cardanoscan.io/transaction/2a42fb79867b948d5990dd564abee307b404de54cdcdd6d78dea84a4039b472b?tab=metadata

### What it demonstrates

This transaction corresponds to a harvesting traceability event generated through Kaltic.

The MVP creates a structured harvesting record containing traceability information such as the event type, harvest identifier, commodity, variety, farm, field, harvest dates and cryptographic hashes associated with the structured record.

The transaction anchors selected evidence from the event on Cardano while the complete operational record remains in the Kaltic application layer.

The resulting transaction ID is linked back to the traceability record and can be independently inspected through a Cardano explorer.

---

## Current Architecture Limitation

The current MVP uses a Kaltic-controlled administrative wallet to submit the blockchain transactions.

This is sufficient for the current prototype to demonstrate:

- creation of agricultural traceability records;
- cryptographic integrity of records;
- public Cardano anchoring;
- linkage between agricultural objects and traceability events;
- independent inspection of blockchain transactions.

However, the blockchain transaction itself does not yet provide cryptographic evidence that the agricultural organization represented in the record was the organization that made the claim.

This is the identity gap addressed by the proposed CIP-0170 integration.

---

## Proposed CIP-0170 Extension

The proposed next stage introduces verifiable organizational identity and organizational attestations.

Current model:

Agricultural event  
→ Kaltic structured record  
→ cryptographic evidence  
→ Kaltic administrative wallet  
→ Cardano Preprod

Proposed model:

Organization  
→ KERI AID  
→ agricultural traceability event  
→ canonical record digest  
→ CIP-0170 attestation  
→ organization's external wallet  
→ Cardano Mainnet  
→ verification in Kaltic

This extends Kaltic from proving that a traceability record was anchored and has not been silently modified to also enabling verification of which organization is cryptographically accountable for the claim.

The transactions above represent the existing technical foundation. CIP-0170 organizational identity attestations are proposed future work and are not presented as functionality already implemented.
