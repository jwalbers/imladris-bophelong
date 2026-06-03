# imladris-bophelong

18-site fictional Lesotho health network centered on Bophelong MDR-TB Hospital.

Sites 1–9 are grounded in real UpKeep equipment inventory (Botsabelo → Bophelong rename applied).
Sites 10–18 are fictional additions for geographic coverage.

## Network Overview

| # | Site | Abbrev | Type | District | Hostname | Devices |
|---|------|--------|------|----------|----------|---------|
| 1 | Bophelong MDR-TB Hospital ★ | BH | Hospital (hub) | Maseru | ls-bop-omrs-01 | 5 |
| 2 | Nkau Clinic | NKC | Rural Clinic | Maseru | ls-nkau-omrs-01 | 4 |
| 3 | Nohana Clinic | NHC | Rural Clinic | Mohale's Hoek | ls-noh-omrs-01 | 4 |
| 4 | Bobete Clinic | BBC | Rural Clinic | Thaba-Tseka | ls-bob-omrs-01 | 4 |
| 5 | Tihanyaku Clinic | TNC | Rural Clinic | Mohale's Hoek | ls-tih-omrs-01 | 3 |
| 6 | Manemaneng Clinic | MMN | Rural Clinic | Berea | ls-mmn-omrs-01 | 5 |
| 7 | Methalaneng Clinic | MLC | Rural Clinic | Thaba-Tseka | ls-mtl-omrs-01 | 3 |
| 8 | Mohales Hoek — TB Elimination | MH | Specialised Programme | Mohale's Hoek | ls-moh-omrs-01 | 3 |
| 9 | Lebakeng Clinic | LKC | Rural Clinic | Maseru | ls-lbk-omrs-01 | 4 |
| 10 | Motebang General Hospital | MOT | Hospital | Leribe | ls-mot-omrs-01 | 2 |
| 11 | Semonkong Health Centre | SEM | Rural Clinic | Maseru | ls-sem-omrs-01 | 2 |
| 12 | Qacha's Nek Clinic | QAC | Rural Clinic | Qacha's Nek | ls-qac-omrs-01 | 2 |
| 13 | Mokhotlong Health Post | MOK | Rural Clinic | Mokhotlong | ls-mok-omrs-01 | 2 |
| 14 | Mafeteng Urban Clinic | MAF | High Volume Clinic | Mafeteng | ls-maf-omrs-01 | 2 |
| 15 | Teyateyaneng Health Centre | TEY | High Volume Clinic | Berea | ls-tey-omrs-01 | 2 |
| 16 | Butha-Buthe Urban Clinic | BUT | High Volume Clinic | Butha-Buthe | ls-but-omrs-01 | 2 |
| 17 | Maluti Mobile Unit | MAL | Mobile | Maseru/Thaba-Tseka | ls-mob-maluti-01 | 1 |
| 18 | Senqu Mobile Unit | SEN | Mobile | Southern Mountains | ls-mob-senqu-01 | 1 |
| | **Total** | | | | | **53** |

★ Hub — runs central OpenMRS instance and patient identifier service for all 18 sites.

## Architecture

- **OpenMRS**: Single central instance at Bophelong Hospital; all satellites connect to it
- **PACS**: Cloud-based — Orthanc initially; AdvaPACS evaluation in progress
- **Modalities**: Hybrid model — one DICOM sidecar per site, one AET per physical device
- **Patient data**: Sourced from `imladris-basotho` (git submodule); patient IDs use prefix `LS-BAS-`
- **Connectivity**: Tailscale mesh VPN (`*.tailcdd51.ts.net`)

## Structure

```
basotho/           git submodule → imladris-basotho (canonical patient population)
puppet/
  hieradata/       18 YAML files, one per site (ls-bop-omrs-01.yaml fully configured;
                   remainder are stubs)
  manifests/
    site.pp        Node definitions for all 18 sites
    bophelong.pp   Puppet class definitions (hub vs satellite)
modalities/        53 DICOM AET definitions across 18 sites (see modalities/README.md)
compose/           Per-site Docker Compose overrides
sites/             Per-site fact sheets
```

## Related repos

| Repo | Role |
|------|------|
| `imladris` | Lab platform: Docker stack, DICOM sim, HL7 bridge, AdvaPACS integration, E2E test runner |
| `imladris-basotho` | Patient population + single-site E2E fixture (submoduled here) |


## Synching with gcloud

```
gcloud storage rsync -r patients/dicom/xray            gs://botsabelo-hospital-records/bophelong_processed/xray
gcloud storage rsync -r patients/dicom/ultrasound_cine gs://botsabelo-hospital-records/bophelong_processed/ultrasound_cine
```

## AdvaPACS user permissions

Application Entities

Manage Local Application Entity

Manage Remote Application Entity

View Local Application Entity

View Remote Application Entity

Auditing

View Audit Logs

Billing

Manage Billing Alert

Manage Billing Detail

View Bill

View Billing Alert

View Billing Detail

Chat

Access Chat

Clinician Portal

Explicit Access Grant

Manage Clinician Portal

Configuration

Manage Compression Rule

Manage Data Set

Manage Data Source

Manage Immutable Storage Rules

Manage Migration Job

Manage Prefetching Rule

Manage Routing Rule

Manage Study Tag Rule

Manage Task Configuration

Manage Transform Rule

Manage Upload Rule

Manage Webhooks

View Compression Rule

View Data Set

View Data Source

View Immutable Storage Rules

View Migration Job

View Prefetching Rule

View Routing Rule

View Study Tag Rule

View Task Configuration

View Transform Rule

View Upload Rule

View Webhooks

Data

Manage Code Management

Manage Code Systems

Manage Custom Fields

Manage ID Sequences

Manage Practitioners

View Code Management

View Code Systems

View Custom Fields

View ID Sequences

View Practitioners

Documents

Manage Document

Manage Sensitive Document

View Document

View Sensitive Document

Gateways

Manage Gateway

Regenerate Gateway Authentication Key

View Gateway

View Gateway Logs

HL7

Manage HL7 Message Log

Manage HL7 Service

View HL7 Message Log

View HL7 Service

Integrations

Access Zed Portal

Monitoring

Manage Image Lifecycle Management Monitor

Manage Retrieve Queue

Manage Routing Queue

Manage Upload Queue

View Association Monitor

View Image Lifecycle Management Monitor

View Incoming Queue

View Retrieve Queue

View Routing Queue

View Upload Queue

Notes

Delete All Notes

Delete Own Note

Manage All Notes

Manage Own Note

View Notes

Orders

Manage Order

View Order

Organisations

Manage Organisation

View Organisation

Patient Portal

Manage Patient Portal

Patients

Manage Patient

View Patient

Payments

Manage Payment Methods

Pay Invoice

View Payment

View Payment Methods

Query Retrieve

Query Retrieve

Reports

Manage Report

View Report

Settings

Manage API Key

Manage Assigning Authorities

Manage Authentication

Manage Feature Visibility

Manage General Settings

Manage Latency Cache Settings

Manage Security

View Authentication

Studies

Audit Study

Change Study Availability

Delete Study

Delete Study Requiring Validation

Download Study

Edit Study

Manage Sensitive Study

Manage Study Storage Class

Move Study

Share Study

Upload Study

Validate Study Requiring Validation

View Sensitive Study

View Study

View Study Image

View Study Requiring Validation

Tasks

Delete All Tasks

Delete Own Task

Manage All Tasks

Manage Own Task

View All Tasks

View Own Task

Users

Impersonate User

Manage Role

Manage User

Manage User Group

View Audit Tool

View Role

View User

View User Group

Viewer

Manage All Settings

Manage Group Settings

Manage Own Settings

View All Settings

Save Artifacts

View Group Settings

View Own Settings

Worklist

Access Worklist
© 2026 AdvaPACS by AdvaHealth Solutions
