````markdown
# Kaltic Technical Architecture

## Overview

Kaltic is an agricultural traceability platform built with a hybrid architecture.

The application layer manages operational traceability workflows and records, while Cardano provides a public verification layer for selected agricultural objects and traceability events.

The current MVP runs on the Cardano Preprod network.

---

## Current MVP Architecture

```text
Agricultural user
        |
        v
     Kaltic UI
        |
        v
     Joget DX8
        |
        +-------------------+
        |                   |
        v                   v
Traceability records   Supporting services
        |              (Google Apps Script)
        |                   |
        +---------+---------+
                  |
                  v
      Canonical / structured data
                  |
                  v
          Cryptographic hashes
                  |
                  v
       Cardano integration layer
                  |
          +-------+-------+
          |               |
          v               v
     NFT minting      Transactions
          |               |
          +-------+-------+
                  |
                  v
          Cardano Preprod
                  |
                  v
       Transaction evidence
                  |
                  v
    Kaltic record / Digital
        Product Passport
````

---

## Application Layer

The main application is implemented in **Joget DX8**.

The public sanitized application export is available at:

[`../joget/APP_kaltic_v1-public.jwa`](../joget/APP_kaltic_v1-public.jwa)

The Joget application defines the principal agricultural workflows, forms, application logic and Cardano integrations used by the MVP.

### Implemented workflows

The current application contains workflows for:

* farm registration;
* agricultural field / plot registration;
* cooler registration;
* administrative account setup;
* harvesting traceability events.

The application uses approval and routing logic to connect registration, verification and blockchain operations.

---

## Farm Registration

Kaltic registers agricultural organizations and their operational information in the application layer.

Farm information can subsequently be referenced by fields and harvesting records instead of duplicating the same information in each event.

At the current MVP stage, operational and potentially sensitive business information remains off-chain.

---

## Agricultural Field Registration

A farm user can register an agricultural field or plot.

The application supports:

* field identification;
* farm association;
* geographic polygon capture;
* GeoJSON representation;
* calculated field area;
* geographic-data hashing;
* blockchain transaction linkage.

The interface uses Leaflet, Leaflet Draw and Turf.js to allow a user to draw the agricultural area and calculate its surface.

### Current blockchain flow

```text
Field registration
      |
      v
Geographic information
      |
      v
GeoJSON + area
      |
      v
Cryptographic hash
      |
      v
Field NFT mint
      |
      v
Cardano Preprod
      |
      v
Transaction ID stored in Kaltic
```

The current implementation uses the Cardano Blockchain Pack for Joget to mint the field NFT.

---

## Harvesting Traceability

Kaltic also implements a harvesting Critical Tracking Event (CTE).

The harvesting workflow captures structured traceability information including fields such as:

* event type;
* harvest identifier;
* commodity;
* variety;
* quantity and unit of measure;
* harvest start and end dates;
* farm;
* agricultural field;
* immediate subsequent recipient;
* cryptographic hashes of the structured harvesting record.

The complete operational record remains in the application layer.

Selected evidence is submitted to Cardano and the resulting transaction ID is associated with the Kaltic record.

### Current harvesting flow

```text
Harvest event
      |
      v
Joget harvesting form
      |
      v
Structured traceability record
      |
      v
Supporting processing service
      |
      v
Cryptographic record hash
      |
      v
Cardano transaction metadata
      |
      v
Cardano Preprod
      |
      v
Transaction ID
      |
      v
Kaltic traceability record
```

---

## Supporting Services

Some processing functions are provided through Google Apps Script web services.

These services currently support operations such as:

* processing agricultural field data;
* generating geographic-data hashes;
* preparing structured harvesting records;
* generating record identifiers;
* generating cryptographic hashes returned to the Joget workflow.

Service deployment identifiers and credentials are intentionally removed from the public Joget export.

The public configuration uses placeholders:

```text
YOUR_PLOT_WEBAPP_ID
YOUR_HARVESTING_WEBAPP_ID
YOUR_BLOCKFROST_PROJECT_KEY
```

---

## Cardano Integration

The current MVP integrates Cardano through the Cardano Blockchain Pack for Joget.

The application configuration includes operations for:

* blockchain account generation;
* NFT minting;
* Cardano transaction submission;
* transaction ID capture;
* explorer links;
* Cardano Preprod backend access.

Third-party plugin binaries are not redistributed in this repository.

---

## Current Wallet Model

The current prototype uses a Kaltic-controlled administrative blockchain account for the principal minting and transaction operations.

Conceptually:

```text
Farm / supply-chain actor
          |
          v
     Kaltic record
          |
          v
 Kaltic administrative wallet
          |
          v
        Cardano
```

This architecture allows the MVP to demonstrate:

* public anchoring of traceability evidence;
* cryptographic record integrity;
* field NFT creation;
* traceability-event transactions;
* linkage between application records and Cardano transactions.

However, it creates an important limitation:

**the transaction proves that Kaltic submitted the blockchain evidence, but does not independently prove that the agricultural organization represented in the record was the organization that cryptographically made the claim.**

---

## Identity Gap

There are two different verification questions:

### Current MVP

**Has this traceability record been anchored and can its integrity be independently checked?**

Kaltic already provides this technical foundation.

### Proposed CIP-0170 integration

**Which verifiable organization is cryptographically accountable for this traceability claim?**

This is the next technical problem Kaltic proposes to solve.

---

## Proposed CIP-0170 Architecture

The proposed integration introduces persistent organizational identity using KERI and CIP-0170 attestations.

The intended architecture is:

```text
Agricultural organization
          |
          v
       KERI AID
          |
          v
   Traceability event
          |
          v
 Canonical record / digest
          |
          v
 CIP-0170 attestation
          |
          v
Organization's external wallet
          |
          v
     Cardano Mainnet
          |
          v
 Kaltic verifier / indexer
          |
          v
Verified Digital Product Passport
```

Instead of Kaltic being the only blockchain actor, participating organizations would use their own external wallets and organizational identities.

A traceability claim could therefore be verified against both:

1. the integrity of the agricultural record; and
2. the identity of the organization responsible for that claim.

---

## Current vs Proposed Architecture

| Capability                               | Current MVP       | Proposed CIP-0170 Phase |
| ---------------------------------------- | ----------------- | ----------------------- |
| Agricultural workflows                   | Implemented       | Reused                  |
| Structured traceability records          | Implemented       | Reused                  |
| Record hashing                           | Implemented       | Reused                  |
| Cardano transactions                     | Preprod           | Mainnet                 |
| Field NFT minting                        | Implemented       | Reused where applicable |
| Digital Product Passport                 | Implemented       | Extended                |
| Organizational identity                  | Not implemented   | KERI AID                |
| Organizational attestations              | Not implemented   | CIP-0170                |
| Transaction wallet                       | Kaltic-controlled | Organization-controlled |
| Verifiable organizational accountability | No                | Yes                     |

---

## Privacy Model

Kaltic does not require all agricultural information to be published on-chain.

The intended model separates:

**Application layer**

* detailed operational records;
* business contact information;
* sensitive supply-chain information;
* complete regulatory records.

**Cardano verification layer**

* cryptographic evidence;
* selected public metadata where appropriate;
* identifiers;
* attestations;
* transaction references.

This enables public verification without requiring sensitive supply-chain datasets to be permanently exposed on-chain.

---

## Public On-chain Evidence

Existing Cardano Preprod transactions generated by the MVP are documented in:

[`testnet-evidence.md`](testnet-evidence.md)

These transactions demonstrate the existing technical foundation.

They are not presented as evidence that CIP-0170 is already implemented.

---

## Security

The public repository intentionally excludes:

* wallet mnemonic phrases;
* signing keys;
* minting policy secret keys;
* Blockfrost credentials;
* production service identifiers;
* user and pilot records;
* private deployment configuration.

The public Joget package is a sanitized version of the working application export.

```
```
