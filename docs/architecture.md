# Kaltic Technical Architecture

## Overview

Kaltic is an agricultural traceability prototype built with a **hybrid architecture**.

The application layer manages operational workflows, identities, permissions, forms, records and presentation. A separate traceability layer preserves persistent object identities, event meaning and source/predecessor relationships. Cardano Preprod is used as an independently inspectable evidence layer for selected critical events.

The final Catalyst F11 interpretation is therefore broader than a single token sequence: the durable core is **objects + events + relationships + verifiable evidence**.

## Final prototype model

```text
Agricultural organization / user
            |
            v
        Kaltic UI
            |
            v
         Joget DX8
            |
     +------+----------------------+
     |                             |
     v                             v
Operational records        Traceability relationships
     |                     (source / predecessor links)
     |                             |
     +--------------+--------------+
                    |
                    v
          Selected critical event
                    |
                    v
           Cardano integration
                    |
                    v
            Cardano Preprod
                    |
                    v
       Transaction / asset evidence
                    |
                    v
     Kaltic history / product passport
```

Cardano is not used as the operational database. Detailed operational and potentially sensitive records remain in the application layer.

## Operational layer

The main application is implemented in **Joget DX8**.

It supports, depending on the configured scenario:

- organizations and users;
- producers;
- agricultural fields / plots;
- crop records;
- cut-level records;
- inventory;
- delivery;
- transformation;
- aggregation;
- supporting photos and documents;
- Digital Product Passport / traceability views.

### Cuts

In the final pilot architecture, **cuts are operational source records**.

They capture the agricultural production context used by later traceability events, but they do not independently require an on-chain transaction.

Conceptually:

```text
Producer / field / crop
          |
          v
         Cut
   (off-chain record)
          |
    +-----+-----+------+
    |           |      |
    v           v      v
 Delivery  Transformation  Aggregation
    |           |             |
    +-----------+-------------+
                |
                v
       selected Cardano evidence
```

This distinction is important: not every operational event needs to be placed on-chain to preserve traceability.

## Traceability layer

Kaltic models supply-chain history through identifiable records and explicit event relationships.

The final research interpretation emphasizes:

- persistent object identifiers;
- explicit business-event semantics;
- source and predecessor references;
- continuity when product changes custody;
- continuity when product changes form;
- continuity when multiple sources are combined;
- reconstruction of history through linked records.

Three relationship patterns were validated during Milestone 3:

1. **Delivery / first-mile movement** — preserve producer and plot origin as product moves.
2. **Transformation** — preserve origin when an input becomes a different product form.
3. **Aggregation** — preserve multiple origins when several source records are combined.

These patterns are documented in [`pilot-workflows.md`](pilot-workflows.md).

## Cardano evidence layer

Selected critical records are associated with Cardano Preprod transactions.

The implementation demonstrates that Kaltic can:

- create and retain application-level traceability records;
- create persistent field / plot identifiers;
- submit selected traceability evidence to Cardano Preprod;
- retain resulting transaction IDs;
- expose blockchain evidence for independent inspection.

Representative transactions are documented in [`testnet-evidence.md`](testnet-evidence.md).

## Field registration

Field registration remains one of the clearest object-identity examples in the current MVP.

The application can capture:

- field identification;
- farm association;
- geographic polygon;
- GeoJSON representation;
- calculated area;
- geographic-data hash;
- Cardano transaction linkage.

The current MVP uses NFT-based field identification on Cardano Preprod.

```text
Field registration
      |
      v
GeoJSON / area
      |
      v
Cryptographic hash
      |
      v
Field NFT
      |
      v
Cardano Preprod
      |
      v
Transaction ID stored in Kaltic
```

## Pilot-specific downstream events

### Delivery

The blueberry pilot tested origin continuity from producer and field through operational cuts and inventory into a delivery record.

The downstream delivery event generated Cardano Preprod evidence while referencing its upstream operational context.

### Transformation

The coffee pilot tested origin continuity through wet-milling transformation.

The purpose was to preserve traceability when the product changed form. Successful records included parchment-coffee transformation evidence on Cardano Preprod.

### Aggregation

The malanga pilot tested preservation of multiple producer and field origins when several cut records were combined into an aggregated lot.

The final aggregation record generated Cardano Preprod evidence after correcting selection and payload issues identified during testing.

## Supporting services

Google Apps Script is used for selected processing functions, including geographic processing and earlier prototype experiments.

Public scripts are available under:

[`../scripts/google-apps-script/`](../scripts/google-apps-script/)

An earlier harvesting service is retained under `legacy/` for transparency. It predates the final cut-based pilot model and should not be interpreted as the final architecture.

## Wallet and identity model

The current prototype uses a Kaltic-controlled administrative blockchain account for principal minting and transaction operations.

This is sufficient to demonstrate public anchoring and record linkage, but it does not independently prove that the agricultural organization represented in a record cryptographically made the claim.

That distinction motivated a separate future direction around verifiable organizational identity and CIP-0170 / KERI attestations.

This proposed work is **not part of the completed F11 prototype**.

## Privacy model

The architecture separates:

### Application layer

- detailed operational records;
- business contact information;
- sensitive supply-chain information;
- complete workflow context;
- supporting images and documents.

### Cardano evidence layer

- selected identifiers;
- transaction references;
- cryptographic evidence;
- public metadata where appropriate.

This provides independent verification without requiring the complete operational dataset to be published permanently on-chain.

## Reliability findings

The final pilot validation exposed several engineering requirements before broader deployment:

- environment and credential preflight checks;
- validation of required selections and payloads;
- idempotency controls;
- explicit transaction states;
- image-size handling;
- exact timing instrumentation;
- improved operational explanation of blockchain evidence.

These are documented limitations and next-step requirements, not hidden failures.

## Public Joget snapshot

The repository contains:

[`../joget/APP_kaltic_v1-1-20260824012721.jwa`](../joget/APP_kaltic_v1-1-20260824012721.jwa)

This is a sanitized **August 2026 snapshot** of the MVP. Some pilot-specific adaptations used during September validation were configured after that export. See [`../joget/README.md`](../joget/README.md).

## Security

The public repository intentionally excludes:

- wallet mnemonic phrases;
- signing keys;
- minting-policy secret keys;
- Blockfrost credentials;
- private deployment identifiers;
- user and pilot records;
- private service configuration.

The repository is intended to document the architecture and public prototype evidence without exposing operational secrets or participant data.
