# Joget Application

This folder contains a sanitized Joget DX8 application export for the Kaltic MVP.

## Public snapshot

Current file:

[`APP_kaltic_v1-1-20260824012721.jwa`](APP_kaltic_v1-1-20260824012721.jwa)

The filename timestamp reflects the public export created on **24 August 2026**.

This package is useful for reviewing the core application structure, forms, workflows and integrations available at that point in the project.

## Important scope note

The August snapshot predates some pilot-specific adaptations configured during the final September 2026 validation period.

The final M3 pilots included additional bounded workflows around:

- cut-level operational records;
- blueberry delivery;
- coffee transformation;
- malanga aggregation.

Those final relationships and the corresponding Cardano Preprod evidence are documented in the repository even though this specific `.jwa` export is an earlier sanitized snapshot.

See:

- [`../docs/architecture.md`](../docs/architecture.md)
- [`../docs/pilot-workflows.md`](../docs/pilot-workflows.md)
- [`../docs/testnet-evidence.md`](../docs/testnet-evidence.md)

## Sanitization

The public package intentionally excludes sensitive configuration and operational data, including:

- pilot/user records;
- wallet secrets;
- signing keys;
- API credentials;
- private deployment endpoints;
- other production secrets.

The repository should therefore be treated as public technical evidence and documentation of the prototype, not as a production deployment image.
