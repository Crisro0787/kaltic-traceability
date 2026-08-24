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
