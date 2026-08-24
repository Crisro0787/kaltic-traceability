# Kaltic

Kaltic is an open-source agricultural traceability platform that turns supply-chain events into structured traceability records and Digital Product Passports, using Cardano as a public verification layer.

Live prototype: https://kaltic.app

## Current status

Kaltic has a functional MVP deployed on Cardano public testnet.

The current prototype includes:

- Farm registration
- Agricultural field / plot registration
- Cooler registration
- Harvest traceability workflows
- Structured traceability records
- Digital Product Passports
- Cryptographic hashing of canonical records
- Cardano testnet transactions
- NFT-based field identification
- On-chain evidence linked back to application records

## Technical architecture

Kaltic uses a hybrid architecture.

Operational and potentially sensitive supply-chain information remains in the application layer, while Cardano provides public verification evidence.

Current flow:

Agricultural event  
→ structured record  
→ canonical representation  
→ cryptographic hash  
→ Cardano transaction  
→ transaction evidence linked to the Kaltic record  
→ Digital Product Passport

## Joget application

The main Kaltic MVP is implemented in Joget DX8.

The exportable application package is available here:

[`joget/APP_kaltic_v1-public.jwa`](joget/APP_kaltic_v1-public.jwa)

The application contains workflows, forms, data views, UI configuration and Cardano-integrated application logic for the current prototype.

### Requirements

- Joget DX8
- Cardano Blockchain Pack for Joget
- Cardano Preprod testnet access
- Blockfrost project key
- Supporting Google Apps Script services

Third-party plugin binaries and credentials are not redistributed in this repository.

## Security and sanitization

The public Joget export has been sanitized before publication.

The following are intentionally excluded:

- user and pilot data
- wallet mnemonics
- policy secret keys
- API credentials
- Blockfrost credentials
- private endpoints
- deployment secrets

Configuration placeholders are used where credentials or external service identifiers are required.

## Cardano integration

The existing MVP uses Cardano for:

- generating blockchain accounts
- minting field / plot NFTs
- submitting agricultural traceability transactions
- linking transaction IDs to Kaltic records
- exposing verification through Cardano explorers

## Proposed next stage: CIP-0170

The proposed next development phase is the integration of CIP-0170 / KERI-based organizational identity attestations.

The current MVP provides evidence related to record integrity.

The proposed CIP-0170 integration would extend this to organizational accountability:

**Which verifiable organization is responsible for a traceability claim?**

The intended model is:

Organization  
→ KERI AID  
→ traceability event  
→ canonical record digest  
→ CIP-0170 attestation  
→ organization's external wallet  
→ Cardano mainnet  
→ verification in Kaltic

This CIP-0170 integration is proposed future work and is not part of the currently implemented prototype.

## Founder

**Cristian Rojas — Founder & Technical Lead**

- LinkedIn: https://www.linkedin.com/in/cristian-rojas-cardano-community/
- GitHub: https://github.com/Crisro0787
- Kaltic: https://kaltic.app

Cristian designed and developed the current Kaltic MVP, including its application architecture, agricultural workflows, frontend components, backend integrations and Cardano testnet functionality.

## Open source

The Kaltic prototype and its public technical documentation are released under the GNU General Public License v3.0.

See [LICENSE](LICENSE).
