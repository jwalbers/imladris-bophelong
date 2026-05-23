# Modalities — Bophelong Health Network

35 real devices across 9 sites (from UpKeep inventory) + 18 fictional devices across 9 additional sites.
One sidecar per site; one DICOM AET per physical device.

> **Botsabelo → Bophelong:** All references to Botsabelo MDR-TB Hospital in the source inventory
> are represented here as Bophelong MDR-TB Hospital.

---

## Real Sites — UpKeep Inventory

### Bophelong MDR-TB Hospital (BH) — Hub — 5 devices

| AET | DICOM | Department | Manufacturer | Model | Serial |
|-----|-------|------------|--------------|-------|--------|
| CR-BH-01 | CR | X-ray | Shimadzu | MUX-100H | 503-48500-12 |
| CR-BH-02 | CR | X-ray | Radiographic System Sedecal X | 18505 | BR10220 |
| CR-BH-03 | CR | X-ray | TXLW8 | 15553 | PKL12432 |
| US-BH-01 | US | X-ray dept | Fujifilm (SonoSite) | M-Turbo | 03R92L |
| US-BH-ICU | US | ICU | Butterfly Network | iQ+ | BT21140B12 |

### Nkau Clinic (NKC) — 4 devices

| AET | DICOM | Department | Manufacturer | Model | Serial |
|-----|-------|------------|--------------|-------|--------|
| CR-NKC-01 | CR | X-ray | (unknown) | 8620002 | 32343 |
| CR-NKC-02 | CR | X-ray | MinXray | MXRSLW | 42837 |
| US-NKC-MCH-01 | US | MCH | Butterfly Network | iQ3 | 24190572 |
| US-NKC-MCH-02 | US | MCH | Fujifilm Sonosite | P08189-91R | WK0VN1 |

### Nohana Clinic (NHC) — 4 devices

| AET | DICOM | Department | Manufacturer | Model | Serial |
|-----|-------|------------|--------------|-------|--------|
| CR-NHC-01 | CR | X-ray | Siemens | 5510 | 32344 |
| CR-NHC-02 | CR | X-ray | MinXray | CMDR.T.120.60.S | CMK2104 |
| CR-NHC-03 | CR | X-ray | MinXray | CMDR.T.120.60S | CMK2106 |
| US-NHC-MCH-01 | US | MCH | Fujifilm Sonosite | P08189-91R | 03X570 |

### Bobete Clinic (BBC) — 4 devices

| AET | DICOM | Department | Manufacturer | Model | Serial |
|-----|-------|------------|--------------|-------|--------|
| CR-BBC-01 | CR | X-ray | Siemens | 5510 | 32345 |
| CR-BBC-02 | CR | X-ray | MinXray | CMDR.T.120.60.S | CMK2105 |
| US-BBC-MCH-01 | US | MCH | Fujifilm Sonosite | P04107-02R | 032D7V |
| US-BBC-MCH-02 | US | MCH | Butterfly Network | iQ+ | BT21140486 |

### Tihanyaku Clinic (TNC) — 3 devices

| AET | DICOM | Department | Manufacturer | Model | Serial |
|-----|-------|------------|--------------|-------|--------|
| CR-TNC-01 | CR | X-ray | Siemens | 5510 | 32831 |
| CR-TNC-02 | CR | X-ray | Fujifilm Healthcare | XD2000 PX | XDRH-6216 |
| US-TNC-MCH-01 | US | MCH | Fujifilm (SonoSite) | Titan | 031XRH |

### Manemaneng Clinic (MMN) — 5 devices

> Source inventory uses two abbreviations: MHC and MMC. Treated as one site; abbreviation
> standardised to MMN. Serial AERB/02A/574 appears under both MHC and MMC rows — counted once.

| AET | DICOM | Department | Manufacturer | Model | Serial |
|-----|-------|------------|--------------|-------|--------|
| CR-MMN-01 | CR | X-ray | MinXray | TR90BH | 46604 |
| CR-MMN-02 | CR | X-ray | MinXray | TR90BH | 46617 |
| CR-MMN-03 | CR | X-ray | Siemens | 8620002 | AERB/02A/574 |
| US-MMN-MCH-01 | US | MCH | Butterfly Network | iQ3 | 24190239 |
| US-MMN-MCH-02 | US | MCH | Butterfly Network | iQ+ | BT21130623 |

### Methalaneng Clinic (MLC) — 3 devices

> Serial 46604 (MinXray TR90BH) shared with Manemaneng MMN — physical device unresolved.
> Serial BT21130623 shared with Manemaneng MMN and appears as both iQ3 and iQ+ — counted once.

| AET | DICOM | Department | Manufacturer | Model | Serial |
|-----|-------|------------|--------------|-------|--------|
| CR-MLC-01 | CR | X-ray | MinXray | TR90BH | 46604 ⚠ |
| US-MLC-MCH-01 | US | MCH | Fujifilm Sonosite | P04969-01A | 0388R5 |
| US-MLC-MCH-02 | US | MCH | Butterfly Network | iQ3/iQ+ | BT21130623 ⚠ |

### Mohales Hoek — TB Elimination Programme (MH) — 3 devices

> Butterfly iQ3 units listed under "X-ray" department in source; actual modality is US.

| AET | DICOM | Department | Manufacturer | Model | Serial |
|-----|-------|------------|--------------|-------|--------|
| CR-MH-01 | CR | X-ray | OR Technology | PXM-20BT Plus | NPTH20BP-2306-008 |
| US-MH-01 | US | X-ray dept | Butterfly Network | iQ3 | 24170152 |
| US-MH-02 | US | X-ray dept | Butterfly Network | iQ3 | 24190536 |

### Lebakeng Clinic (LKC) — 4 devices

| AET | DICOM | Department | Manufacturer | Model | Serial |
|-----|-------|------------|--------------|-------|--------|
| CR-LKC-01 | CR | X-ray | Siemens | 5510 | AERB/XT/02A/09 |
| CR-LKC-02 | CR | X-ray | Fujifilm Healthcare | XD2000 PX | XDRH-6213 |
| US-LKC-MCH-01 | US | MCH | Butterfly Network | iQ3 | 24190422 |
| US-LKC-MCH-02 | US | MCH | Fujifilm Sonosite | P08189-91R | 03NHXN |

---

## Fictional Sites — 9 additional sites (2 devices each)

| AET | DICOM | Site |
|-----|-------|------|
| CR-MOT-01 | CR | Motebang General Hospital |
| US-MOT-01 | US | Motebang General Hospital |
| CR-SEM-01 | CR | Semonkong Health Centre |
| US-SEM-01 | US | Semonkong Health Centre |
| CR-QAC-01 | CR | Qacha's Nek Clinic |
| US-QAC-01 | US | Qacha's Nek Clinic |
| CR-MOK-01 | CR | Mokhotlong Health Post |
| US-MOK-01 | US | Mokhotlong Health Post |
| CR-MAF-01 | CR | Mafeteng Urban Clinic |
| US-MAF-01 | US | Mafeteng Urban Clinic |
| CR-TEY-01 | CR | Teyateyaneng Health Centre |
| US-TEY-01 | US | Teyateyaneng Health Centre |
| CR-BUT-01 | CR | Butha-Buthe Urban Clinic |
| US-BUT-01 | US | Butha-Buthe Urban Clinic |
| US-MAL-01 | US | Maluti Mobile Unit (portable) |
| US-SEN-01 | US | Senqu Mobile Unit (portable) |

---

## Totals

| Category | Sites | CR | US | Devices |
|----------|-------|----|----|---------|
| Real (UpKeep inventory) | 9 | 19 | 16 | 35 |
| Fictional additions | 9 | 7 | 11 | 18 |
| **Total** | **18** | **26** | **27** | **53** |

---

## Data Quality Notes from Source Inventory

| Issue | Detail |
|-------|--------|
| Duplicate serial 46604 | MinXray TR90BH appears at both Manemaneng (MHC) and Methalaneng (MLC) |
| Duplicate serial BT21130623 | Appears 3× across Manemaneng and Methalaneng as both iQ3 and iQ+ |
| Duplicate serial AERB/02A/574 | Siemens 8620002 at Manemaneng appears under both MHC and MMC rows |
| Manemaneng dual abbreviation | Same clinic entered as both MHC and MMC throughout inventory |
| US devices listed under "X-ray" dept | Butterfly iQ3/iQ+ and Fujifilm M-Turbo/Titan are ultrasound, not X-ray |
| Blank manufacturer row 1 | NKC X-ray serial 32343, model listed as 8620002 (Siemens model number) |
| Spelling: "Siemans" | Rows for Bobete/Tihanyaku Siemens 5510 — likely Siemens |
