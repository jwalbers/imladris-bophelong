# Bophelong Health Network — node definitions
# 18 sites, 53 DICOM devices
# Sites 1-9: grounded in real UpKeep inventory (Botsabelo → Bophelong)
# Sites 10-18: fictional additions for geographic coverage
# All per-site configuration via hiera (hieradata/<hostname>.yaml)

# --- Hub ---

# 1. Bophelong MDR-TB Hospital (BH) — hub, Maseru
node 'ls-bop-omrs-01',
     'ls-bop-omrs-01.tailcdd51.ts.net',
     'ls-bop-omrs-01.localhost' {
  include bophelong::hub
}

# --- Real Sites (from UpKeep inventory) ---

# 2. Nkau Clinic (NKC) — Maseru
node 'ls-nkau-omrs-01',
     'ls-nkau-omrs-01.tailcdd51.ts.net',
     'ls-nkau-omrs-01.localhost' {
  include bophelong::satellite
}

# 3. Nohana Clinic (NHC) — Mohale's Hoek
node 'ls-noh-omrs-01',
     'ls-noh-omrs-01.tailcdd51.ts.net',
     'ls-noh-omrs-01.localhost' {
  include bophelong::satellite
}

# 4. Bobete Clinic (BBC) — Thaba-Tseka
node 'ls-bob-omrs-01',
     'ls-bob-omrs-01.tailcdd51.ts.net',
     'ls-bob-omrs-01.localhost' {
  include bophelong::satellite
}

# 5. Tihanyaku Clinic (TNC) — Mohale's Hoek
node 'ls-tih-omrs-01',
     'ls-tih-omrs-01.tailcdd51.ts.net',
     'ls-tih-omrs-01.localhost' {
  include bophelong::satellite
}

# 6. Manemaneng Clinic (MMN) — Berea
node 'ls-mmn-omrs-01',
     'ls-mmn-omrs-01.tailcdd51.ts.net',
     'ls-mmn-omrs-01.localhost' {
  include bophelong::satellite
}

# 7. Methalaneng Clinic (MLC) — Thaba-Tseka
node 'ls-mtl-omrs-01',
     'ls-mtl-omrs-01.tailcdd51.ts.net',
     'ls-mtl-omrs-01.localhost' {
  include bophelong::satellite
}

# 8. Mohales Hoek — TB Elimination Programme (MH)
node 'ls-moh-omrs-01',
     'ls-moh-omrs-01.tailcdd51.ts.net',
     'ls-moh-omrs-01.localhost' {
  include bophelong::satellite
}

# 9. Lebakeng Clinic (LKC) — Maseru (remote mountain)
node 'ls-lbk-omrs-01',
     'ls-lbk-omrs-01.tailcdd51.ts.net',
     'ls-lbk-omrs-01.localhost' {
  include bophelong::satellite
}

# --- Fictional Sites (geographic coverage) ---

# 10. Motebang General Hospital (MOT) — Leribe
node 'ls-mot-omrs-01',
     'ls-mot-omrs-01.tailcdd51.ts.net',
     'ls-mot-omrs-01.localhost' {
  include bophelong::satellite
}

# 11. Semonkong Health Centre (SEM) — Maseru mountains
node 'ls-sem-omrs-01',
     'ls-sem-omrs-01.tailcdd51.ts.net',
     'ls-sem-omrs-01.localhost' {
  include bophelong::satellite
}

# 12. Qacha's Nek Clinic (QAC) — Qacha's Nek
node 'ls-qac-omrs-01',
     'ls-qac-omrs-01.tailcdd51.ts.net',
     'ls-qac-omrs-01.localhost' {
  include bophelong::satellite
}

# 13. Mokhotlong Health Post (MOK) — Mokhotlong
node 'ls-mok-omrs-01',
     'ls-mok-omrs-01.tailcdd51.ts.net',
     'ls-mok-omrs-01.localhost' {
  include bophelong::satellite
}

# 14. Mafeteng Urban Clinic (MAF) — Mafeteng
node 'ls-maf-omrs-01',
     'ls-maf-omrs-01.tailcdd51.ts.net',
     'ls-maf-omrs-01.localhost' {
  include bophelong::satellite
}

# 15. Teyateyaneng Health Centre (TEY) — Berea
node 'ls-tey-omrs-01',
     'ls-tey-omrs-01.tailcdd51.ts.net',
     'ls-tey-omrs-01.localhost' {
  include bophelong::satellite
}

# 16. Butha-Buthe Urban Clinic (BUT) — Butha-Buthe
node 'ls-but-omrs-01',
     'ls-but-omrs-01.tailcdd51.ts.net',
     'ls-but-omrs-01.localhost' {
  include bophelong::satellite
}

# --- Mobile Units ---

# 17. Maluti Mobile Unit — Maseru / Thaba-Tseka routes
node 'ls-mob-maluti-01',
     'ls-mob-maluti-01.tailcdd51.ts.net',
     'ls-mob-maluti-01.localhost' {
  include bophelong::satellite
}

# 18. Senqu Mobile Unit — southern mountain routes
node 'ls-mob-senqu-01',
     'ls-mob-senqu-01.tailcdd51.ts.net',
     'ls-mob-senqu-01.localhost' {
  include bophelong::satellite
}
