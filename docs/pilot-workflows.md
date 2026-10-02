# Final Pilot Workflows

This document summarizes the three bounded agricultural traceability patterns validated during Kaltic Milestone 3.

The purpose is to show how the same architectural core was adapted to different commodities and business events without assuming that every operational record must be published on-chain.

## Common pattern

Across the pilots, Kaltic used operational source records to build context and selected downstream events to generate Cardano Preprod evidence.

```text
Organization / Producer / Field
            |
            v
           Crop
            |
            v
           Cuts
     (operational records)
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
```

Cuts themselves were part of the operational application layer.

## Pilot 1 — Blue Berry Trade and Company

**Commodity:** Blueberry  
**Primary relationship:** First-mile origin continuity  
**Validated endpoint:** Delivery

### Workflow

```text
Organization
   |
   v
Producer
   |
   v
Field / plot
   |
   v
Crop / production context
   |
   v
Cuts
   |
   v
Inventory
   |
   v
Delivery
   |
   v
Cardano Preprod evidence
```

The pilot tested whether producer and plot origin remained connected through cut-level operational records, inventory and delivery.

A representative final delivery record is:

- Kaltic record: `DEL-000001`
- Transaction: `23cb018a0ff96f9c08ed6a56744618be47c0d6dbf3af49fa4aad16c95c205556`

## Pilot 2 — Cafe Chichini

**Commodity:** Specialty coffee  
**Primary relationship:** Transformation continuity  
**Validated endpoint:** Wet-milling / parchment transformation

### Workflow

```text
Organization
   |
   v
Producer
   |
   v
Field / plot
   |
   v
Crop
   |
   v
Cuts
   |
   v
Wet-milling transformation
   |
   v
Parchment coffee / inventory
   |
   v
Cardano Preprod evidence
```

The pilot tested whether origin remained visible after product changed form.

A representative final transformation record is:

- Kaltic record: `PERG-000002`
- Transaction: `264ad0ff1b38382b363279160811cbc18db2a38b3668f1b215783cd069dcd197`

## Pilot 3 — Empacadora El Remolino de Santa Rosa

**Commodity:** Malanga Coco  
**Primary relationship:** Multi-source aggregation  
**Validated endpoint:** Aggregated harvest lot

### Workflow

```text
Producer A / Field A / Cuts
               \
                \
                 > Aggregated lot
                /
Producer B / Field B / Cuts
               |
               v
       Cardano Preprod evidence
```

The pilot tested whether multiple producer and field origins could remain linked when several cut records were combined into one lot.

A representative final aggregation record is:

- Kaltic record: `AGG-MAL-000002`
- Transaction: `49aeb09beabbde293da540314f97f6c789aa3a971cbb32a07e47f24f42e49726`

The validation intentionally stopped at aggregation. Packing, container and export information were mapped during discovery but were not presented as completed final pilot endpoints.

## Cross-pilot conclusion

Together, the three pilots exercised three materially different traceability relationships:

1. **movement / delivery**;
2. **transformation**;
3. **aggregation**.

The common architectural principle is not that every commodity must follow the same fixed workflow. It is that Kaltic must preserve identifiable objects, explicit business-event meaning, and the relationships needed to reconstruct origin across those different event types.

## Validation boundary

The pilots used historical, representative, simulated, mixed or anonymized data as appropriate.

They demonstrate prototype functionality, adaptability and traceability relationships in bounded workflows. They do not claim three live end-to-end commercial supply chains, regulatory certification or production deployment.
