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
