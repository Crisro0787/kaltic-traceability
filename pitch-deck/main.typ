#import "theme.typ": *
#set document(title: "K’altic — Harvest records your packer can use", author: "K’altic", date: none)
#set page(width: 320mm, height: 180mm, margin: (x: 18mm, top: 13mm, bottom: 15mm))
#set text(font: "Inter", size: 12pt)
#set par(leading: .65em, spacing: 8pt)
#set block(above: 0pt, below: 0pt)

#slide("dark", t => [
#grid(columns: (1.25fr, 1fr), gutter: 22pt,
 [#image("assets/logo-ivory.svg", width: 48mm) #v(29pt) #(t.label)("For tomato growers supplying export packers") #v(15pt) #(t.title)([Harvest records\ your packer can use.], size: 43pt) #v(18pt) #text(size: 15pt, fill: t.muted)[Record the field, dates, quantity and recipient.\ Reuse that record when someone asks.]],
 [#image("assets/terroir.svg", width: 116mm)])
#v(1fr)
#(t.note)[Working traceability MVP + proposed packer handoff. Product discussion, not a claim of proven customer value.]
])
#pagebreak()

#slide("dark", t => [
#(t.section)("01 / Why the record matters", "When food is recalled, someone has to reconstruct its journey.")
#(t.cols)([
 #(t.metric)("113", "Illnesses reported in the 2024 Sonora cucumber outbreak") #v(15pt)
 #(t.metric)("23", "U.S. states affected · FDA final update, January 2025")
], [#(t.title)("Which grower supplied it? Who received it next?", size: 27pt) #v(15pt)
 FDA traced the outbreak to cucumbers grown by Agrotato in Sonora. Several downstream companies recalled products.

 The practical lesson: a record must connect a product to its source and its next recipient.

 #(t.note)[This establishes the importance of traceability—not demand for K’altic, nor evidence that K’altic could have prevented the outbreak.]
])
#(t.cite)("US2")
])
#pagebreak()

#slide("light", t => [
#(t.section)("02 / One owner. One request.", "Mariana’s packer needs the details of yesterday’s delivery.")
#(t.cols)([
 Mariana owns a tomato farm in Sinaloa and supplies an export packer. She is our illustrative user, not an interviewed customer.

 Before the packer can connect an incoming delivery to its packing records, it needs to know what Mariana sent.

 #text(fill: t.mint)[Her task is specific: identify the harvest and give the packer a consistent record of its origin, dates and quantity.]
], (t.card)[
 #(t.label)("Illustrative request / not a customer quote") #v(13pt)
 #(t.title)("Please send the harvest details for delivery D-018.", size: 25pt) #v(14pt)
 Farm and field · harvest identifier · crop and variety · harvest dates · quantity and unit · receiving packer.
])
#v(1fr)
#(t.note)[The request is a product scenario. The listed harvest fields exist in the repository’s documented MVP; delivery-to-packing integration does not.]
])
#pagebreak()

#slide("light", t => [
#(t.section)("03 / The task we want to replace", "Finding the answer should not mean rebuilding the record.")
#(t.cols)(
 (t.card)[#(t.label)("Illustrative baseline / validate on site") #v(12pt) #(t.smallhead)("Reconstruct the delivery", [Find the harvest note. Identify the field. Check the weight and unit. Match the recipient. Copy the details into the packer’s format.

This may already work well in a spreadsheet. We have not measured its cost.])],
 (t.card)[#(t.label)("Proposed product workflow") #v(12pt) #(t.smallhead)("Reuse a harvest record", [Select an existing farm and field when recording the harvest. Enter dates, quantity and recipient once.

Then retrieve that record for the packer. A packer-ready export and delivery reference are the next workflow to build.])],
)
#v(20pt)
#text(fill: t.gold)[The product must remove duplicate work. Another form alongside the existing spreadsheet would make the problem worse.]
#v(1fr)
#(t.note)[Baseline and benefit are hypotheses—not an observed customer workflow or a claimed time saving.]
])
#pagebreak()

#slide("dark", t => [
#(t.section)("04 / What K’altic already captures", "One harvest, attached to a known field.", subtitle: "Illustrative record using documented MVP fields—not a screenshot or real production data.")
#(t.cols)((t.card)[
 #(t.label)("Harvest H-018 / sample data") #v(12pt)
 #table(columns: (1fr, 1.4fr), inset: 9pt,
 [Farm / field], [Mariana’s farm / Field 02],
 [Commodity / variety], [Tomato / Roma],
 [Harvest start / end], [17 September 2026 / same day],
 [Quantity / unit], [1,200 / kg],
 [Immediate recipient], [Export packer A],
 )
], [#(t.title)("Choose the field. Record the harvest. Keep the reference.", size: 28pt) #v(16pt)
 The MVP stores farms and plots separately, then references them in harvest records. It also captures quantity, dates and the immediate subsequent recipient.

 A Digital Product Passport and transaction link expose verification evidence.

 #(t.note)[Current deployment: Cardano Preprod. An anchor detects changes to a recorded version; it cannot verify that 1,200 kg was really harvested.]
])
#v(1fr)
#(t.note)[Repository: docs/architecture.md, “Farm Registration” and “Harvesting Traceability”; docs/testnet-evidence.md.]
])
#pagebreak()

#slide("dark", t => [
#(t.section)("05 / The useful output to build", "A harvest handoff the packer can actually accept.")
#(t.cols)((t.card)[
 #(t.label)("Proposed handoff / mock output") #v(12pt)
 #(t.title)("Delivery D-018", size: 25pt) #v(8pt)
 Harvest H-018 · Field 02 · Roma tomatoes\
 17 September 2026 · 1,200 kg\
 Recipient: Export packer A
 #v(15pt)
 #line(length: 100%, stroke: .5pt + t.line-color) #v(12pt)
 #text(fill: t.mint)[Harvest record → packer’s intake reference]
 #v(12pt)
 #(t.note)[Downloadable summary / agreed CSV format / record reference. These handoff features are proposed, not shipped.]
], [#(t.smallhead)("What changes for Mariana", [She sends the same saved harvest information instead of retyping it for each request.]) #v(19pt)
 #(t.smallhead)("What changes for the packer", [Its intake team receives consistent fields and a stable reference it can attach to its own packing record.]) #v(19pt)
 #text(fill: t.gold)[The packer must accept the format. Otherwise there is no useful handoff.]
])
#v(1fr)
#(t.note)[Example identifiers and quantities are fictional. No portal integration, export feature or buyer acceptance is claimed today.]
])
#pagebreak()

#slide("light", t => [
#(t.section)("06 / Where the record stops", "A harvest record is not yet shipment traceability.")
#(t.cols)(
 (t.card)[#(t.label)("Current core") #v(12pt) #(t.smallhead)("Field → harvest", [Mariana’s origin, dates, quantity and immediate recipient.])],
 (t.card)[#(t.label)("Missing connection") #v(12pt) #(t.smallhead)("Intake → packing lot", [The packer links deliveries to its lots, including mixtures and split quantities.])],
 (t.card)[#(t.label)("Downstream partner data") #v(12pt) #(t.smallhead)("Shipment → buyer", [Packing lots connect to outbound shipments and customers.])],
)
#v(20pt)
#text(fill: t.gold)[Without those connections, K’altic cannot answer which finished shipments contain Mariana’s tomatoes.]
#v(12pt)
 The first integration should close that specific gap with one packer—not promise visibility over the entire supply chain.
#(t.cite)("US1")
])
#pagebreak()

#slide("light", t => [
#(t.section)("07 / What it does—and does not—help with", "The harvest record supports the file. It does not authorize export.")
#set text(size: 10.5pt)
#table(columns: (1fr, 1.15fr, 1.2fr),
 [#(t.label)("Task / reviewer")], [#(t.label)("Required material")], [#(t.label)("K’altic’s boundary")],
 [Tomato export notice / SE], [Exporter registration; signed request; SNICE Excel; current SENASICA SRRC adhesion.], [These remain separate applications. The MVP neither prepares nor submits them.],
 [Export clearance / Mexican customs], [Pedimento, commercial-value data and applicable non-tariff evidence; broker represents the exporter.], [A harvest record does not replace the declaration, invoice or export notice.],
 [Supplier verification / U.S. importer], [The covered FSVP importer evaluates supplier risk and keeps verification evidence; FDA can review it.], [Origin records can be supporting information, not proof of hygiene, safe water or pesticide compliance.],
 [Lot tracing / packer and authorities], [Connected event records across the relevant supply chain.], [This is the intended use. Packing/shipment links and complete required data still need work.],
)
#(t.cite)("MX4", "MX5", "US4", "US1")
])
#pagebreak()

#slide("dark", t => [
#(t.section)("08 / The alternative is already available", "Why not keep using Excel?")
#(t.cols)([
 #(t.title)("If it works, Mariana should keep it.", size: 29pt) #v(17pt)
 A shared spreadsheet can record harvests and recipients. A folder can hold certificates. A packer may already provide a supplier portal.

 K’altic has to improve a specific handoff enough to justify another subscription and a change in routine.
], (t.card)[
 #(t.label)("Reasons to choose K’altic / to demonstrate") #v(12pt)
 Less repeated farm and field entry.\
 Fewer missing or mismatched harvest fields.\
 Faster retrieval of the requested record.\
 A format the packer accepts without retyping.
 #v(17pt)
 #text(fill: t.gold)[A blockchain transaction is not the buying reason.]
])
#v(1fr)
#(t.note)[No comparative usability, cost or efficiency result is claimed. This is the product’s burden of proof.]
])
#pagebreak()

#slide("light", t => [
#(t.section)("09 / A test that can reject the idea", "Run the same packer request through both workflows.")
#(t.cols)(
 (t.card)[#(t.label)("First / observe") #v(12pt) #(t.smallhead)("Use real paperwork", [With consent, follow one grower and one packer through real harvest handoffs. Collect their actual request format and watch how they answer it today.])],
 (t.card)[#(t.label)("Then / compare") #v(12pt) #(t.smallhead)("Measure the work", [Record time to prepare and find the answer, missing fields, packer corrections and duplicate entry. Repeat comparable requests using K’altic.])],
 (t.card)[#(t.label)("Finally / decide") #v(12pt) #(t.smallhead)("Require acceptance", [Continue only if the packer accepts the output and total work falls without worse accuracy. Stop or redesign if users still maintain two records.])],
)
#v(19pt)
#text(fill: t.mint)[Evidence sought: a usable handoff, repeated use, and a customer willing to pay—not another testnet transaction.]
#v(1fr)
#(t.note)[Proposed validation plan. No customers, completed interviews or pilot results are implied.]
])
#pagebreak()

#slide("dark", t => [
#(t.section)("10 / A simple offer, if the workflow earns it", "MXN 100 a month to maintain and reuse harvest records.")
#(t.cols)([
 #(t.metric)("100 MXN", "Proposed monthly grower subscription, excluding applicable tax") #v(20pt)
 Farm and field setup. Harvest records. A packer-accepted handoff once built and validated.

 #(t.note)[Price hypothesis, not existing revenue. No requirement to purchase an investment or understand the verification infrastructure.]
], (t.card)[#(t.smallhead)("Who pays must follow who benefits", [If the grower saves little work but the packer benefits, test a packer-sponsored model instead.

Do not assume farmers will pay because regulations exist. Ask for renewal after the workflow has been used.

The price must cover onboarding and support; those costs are not yet established.])])
#v(1fr)
#(t.note)[The immediate commercial question is willingness to pay for this task. A national market projection cannot answer it.]
])
#pagebreak()

#slide("dark", t => [
#(t.label)("The next step") #v(28pt)
#(t.title)([One grower. One packer.\ One accepted harvest handoff.], size: 43pt)
#v(23pt)
#text(size: 16pt, fill: t.muted)[Bring the actual forms, the current spreadsheet and a real request.\ Use them to decide what K’altic should replace.]
#v(23pt)
#text(fill: t.mint)[The MVP proves records can be captured and anchored.\ The pilot must prove that people can get their work done more easily.]
#v(1fr)
#(t.note)[Seeking a workflow design partner—not claiming a finished export-compliance system.]
])
#pagebreak()

#slide("light", t => [
#(t.section)("Appendix / Evidence and scope", "Primary sources for the problem—not proof of product demand.")
#for id in ("US2", "MX4", "MX5", "US4", "US1") [
 #text(size: 10pt)[#link(sources.at(id).url)[#text(fill: t.mint, weight: "semibold")[#id · #sources.at(id).short ↗]] — #sources.at(id).detail]
 #v(12pt)
]
#v(1fr)
#(t.note)[Reviewed 18 September 2026. Scope and exemptions vary. Recheck rules and obtain qualified advice for a shipment; this presentation is not an export checklist.]
])
#pagebreak()

#slide("light", t => [
#(t.section)("Appendix / What is actually implemented", "A working record layer. A handoff still to validate.")
#(t.cols)((t.card)[#(t.smallhead)("Documented in the repository", [Farm registration and reusable farm references. Field identification and geographic information. Harvest identifiers, dates, quantity, variety and recipient. Digital Product Passports, hashes and Preprod transaction links.

Sources: README.md; docs/architecture.md; docs/testnet-evidence.md.])], (t.card)[#(t.smallhead)("Not established by that evidence", [An accepted packer export, delivery reconciliation, packing-lot lineage, shipment tracing, official filing integrations, production compliance or measurable customer savings.

Those gaps are deliberately visible in this presentation.])])
#v(19pt)
#link("https://preprod.cardanoscan.io/transaction/8c7e02a0c3056d33587999337def2e03828510f993a92f70d671b8fac3a17292")[Field transaction ↗] #h(25pt)
#link("https://preprod.cardanoscan.io/transaction/2a42fb79867b948d5990dd564abee307b404de54cdcdd6d78dea84a4039b472b")[Harvest transaction ↗]
#v(1fr)
#(t.note)[Administrative-wallet anchors do not establish grower identity or truthful inputs. Keep sensitive operational data off-chain.]
])
