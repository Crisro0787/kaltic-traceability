# Kaltic

Kaltic is an open-source agricultural traceability prototype developed through **Project Catalyst Fund 11 — Cardano Use Cases: Concept** under the proposal **Food Traceabiliy by Cardano** (Project ID **1100136**).

The project investigates how dynamic agricultural supply chains can preserve traceability when products move between actors, are combined, or are transformed. The final prototype uses a hybrid architecture: operational workflows remain adaptable in the application layer, while selected critical events are linked to independently inspectable evidence on **Cardano Preprod**.

- Live prototype: https://kaltic.app
- Catalyst project page: https://projectcatalyst.io/funds/11/cardano-use-cases-concept/food-traceabiliy-by-cardano
- Network used for validation: Cardano Preprod

## Final Catalyst F11 prototype state

The final research interpretation gives priority to **persistent object identity, explicit supply-chain events, and source/predecessor relationships**.

Kaltic does not require every operational record to be written on-chain.

A simplified final model is:

```text
Organization / Producer / Field
            |
            v
           Crop
            |
            v
           Cuts
     (operational / off-chain)
            |
      +-----+------+------+
      |            |      |
      v            v      v
  Delivery   Transformation   Aggregation
      |            |              |
      +------------+--------------+
                   |
                   v
       selected Cardano evidence
                   |
                   v
      linked traceability history
```

In the final pilot configurations, **cuts were operational source records**. They did not independently require a Cardano transaction. Instead, pilot-specific downstream workflows referenced upstream records and generated selected Cardano Preprod evidence.

## Validated traceability patterns

Three real agricultural organizations tested materially different traceability relationships:

| Pilot | Organization | Commodity | Validated endpoint | Relationship tested |
| --- | --- | --- | --- | --- |
| 1 | Blue Berry Trade and Company | Blueberry | Delivery | Preserve producer and plot origin through cuts, inventory and first-mile delivery |
| 2 | Cafe Chichini | Specialty coffee | Wet-milling transformation | Preserve origin when the product changes form |
| 3 | Empacadora El Remolino de Santa Rosa | Malanga Coco | Aggregation | Preserve multiple producer/field origins when cuts are combined into one lot |

Across the final participant-facing validation rounds, participants completed **21 of 21 tasks**. Separately, **17 of 27 technical record attempts succeeded (63.0%)**. The validation evidence reports **18 blockchain confirmations** and individually enumerates **17 transaction IDs**. Structured usability feedback averaged **4.56/5** across the three principal participants.

These results support prototype-level feasibility in bounded workflows. They do **not** establish production readiness, universal farm-to-consumer coverage, regulatory certification, statistically representative adoption, production-grade security, or truthfulness of source data at entry.

## Architecture

The final prototype is organized into three main concerns:

### 1. Operational layer

Implemented primarily in **Joget DX8**.

It manages:

- organizations and users;
- producers and agricultural fields;
- crop and cut-level records;
- operational forms and permissions;
- inventory and pilot-specific workflows;
- photos and other supporting information;
- user-facing traceability views and Digital Product Passports.

### 2. Traceability layer

Kaltic preserves relationships between identifiable records and events.

The important design elements are:

- persistent identifiers;
- event semantics;
- source and predecessor references;
- aggregation relationships;
- transformation relationships;
- delivery/custody relationships;
- reconstruction of product history.

### 3. Evidence layer

Selected records are linked to Cardano Preprod transactions so the blockchain evidence can be independently inspected.

The blockchain is used as an **evidence layer**, not as Kaltic's operational database.

Representative transactions are documented in:

[`docs/testnet-evidence.md`](docs/testnet-evidence.md)

The three final pilot workflows are documented in:

[`docs/pilot-workflows.md`](docs/pilot-workflows.md)

A more detailed technical description is available in:

[`docs/architecture.md`](docs/architecture.md)

## Repository contents

### Joget application snapshot

A sanitized Joget DX8 export is included at:

[`joget/APP_kaltic_v1-1-20260824012721.jwa`](joget/APP_kaltic_v1-1-20260824012721.jwa)

This file is an **August 2026 public snapshot** of the MVP. It predates some pilot-specific adaptations configured during September 2026. See [`joget/README.md`](joget/README.md) for the scope note.

### Google Apps Script services

Public supporting scripts are available under:

[`scripts/google-apps-script/`](scripts/google-apps-script/)

The field-registration service supports geographic processing and record hashing. An earlier harvesting service is retained under `legacy/` for historical transparency; it does not represent the final cut-based pilot architecture.

## Security and sanitization

The public repository intentionally excludes:

- pilot and user data;
- wallet mnemonics;
- signing keys;
- minting-policy secret keys;
- Blockfrost credentials;
- Google Maps and storage credentials;
- private deployment URLs;
- production secrets.

Configuration placeholders are used where external credentials or service identifiers are required.

## Cardano integration

The project demonstrated Cardano Preprod evidence for selected agricultural objects and traceability events, including:

- field / plot registration;
- delivery;
- product transformation;
- multi-source aggregation.

Field registration uses an NFT-based identifier in the current MVP. Downstream pilot workflows are documented primarily in terms of their business event and traceability relationships rather than requiring one universal token sequence.

## Research conclusion

The project began with a token-oriented implementation model, but the final research evaluation produced a broader architectural conclusion:

> The enduring traceability core is the combination of identifiable objects, explicit business events, usable interfaces, and preserved source/predecessor relationships. Token mechanisms are implementation choices that can support this evidence model.

This distinction allows Kaltic to keep commodity-specific operations flexible while maintaining a common traceability structure.

## Future work

The next development priorities identified by the validation are:

1. improve deployment preflight checks and configuration reliability;
2. validate required selections and payloads before submission;
3. add idempotency and explicit transaction states;
4. improve image handling and instrument exact timing;
5. validate deeper split/merge/transformation relationships;
6. test cross-company exchange and governance;
7. evaluate standards alignment such as GS1/EPCIS and relevant FSMA 204 workflows;
8. assess production security, privacy and sustained operational value.

A separate proposed future direction is **CIP-0170 / KERI-based organizational identity attestations**. That work is not presented as functionality completed under the current F11 prototype.

## Founder

**Cristian Rojas — Founder & Technical Lead**

- LinkedIn: https://www.linkedin.com/in/cristian-rojas-cardano-community/
- GitHub: https://github.com/Crisro0787
- Kaltic: https://kaltic.app

## License

The public Kaltic prototype materials are released under the **GNU General Public License v3.0**.

See [LICENSE](LICENSE).
