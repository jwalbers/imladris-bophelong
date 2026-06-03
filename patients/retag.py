"""
retag.py — Retag botsabelo_processed DICOM files for the Bophelong network.

Reads from: ../imladris/botsabelo-hospital-records/botsabelo_processed/
Writes to:  ./dicom/

Changes applied:
  - InstitutionName        → "Bophelong MDR-TB Hospital"
  - SourceApplicationEntityTitle → "IML_CR_01" (CR) or "IML_US_01" (US)
  - Fresh Study/Series/SOP Instance UIDs (avoids collision with old Orthanc data)

Patient identity (name, ID, DOB, sex) is preserved unchanged.

Run from imladris-bophelong/:
  python patients/retag.py
"""

import pathlib
import pydicom
from pydicom.uid import generate_uid

SRC_ROOT  = pathlib.Path(__file__).parent.parent.parent / "imladris" / "botsabelo-hospital-records" / "botsabelo_processed"
DEST_ROOT = pathlib.Path(__file__).parent / "dicom"

INSTITUTION = "Bophelong MDR-TB Hospital"

SOURCES = [
    (SRC_ROOT / "xray",           "xray",           "IML_CR_01"),
    (SRC_ROOT / "ultrasound_cine","ultrasound_cine", "IML_US_01"),
]

def retag(src_file: pathlib.Path, dest_file: pathlib.Path, aet: str) -> None:
    ds = pydicom.dcmread(str(src_file))

    ds.InstitutionName = INSTITUTION

    if not hasattr(ds, "file_meta") or ds.file_meta is None:
        ds.file_meta = pydicom.Dataset()

    ds.file_meta.SourceApplicationEntityTitle = aet

    # Fresh UIDs so these studies are distinct from any prior Orthanc imports
    new_study  = generate_uid()
    new_series = generate_uid()
    new_sop    = generate_uid()
    ds.StudyInstanceUID  = new_study
    ds.SeriesInstanceUID = new_series
    ds.SOPInstanceUID    = new_sop
    ds.file_meta.MediaStorageSOPInstanceUID = new_sop

    dest_file.parent.mkdir(parents=True, exist_ok=True)
    pydicom.dcmwrite(str(dest_file), ds)


def main() -> None:
    total = 0
    for src_dir, dest_name, aet in SOURCES:
        if not src_dir.exists():
            print(f"  SKIP (not found): {src_dir}")
            continue
        dest_dir = DEST_ROOT / dest_name
        patient_dirs = sorted(p for p in src_dir.iterdir() if p.is_dir())
        print(f"\n{dest_name}  ({len(patient_dirs)} patients)  AET={aet}")
        for patient_dir in patient_dirs:
            for src_file in sorted(patient_dir.glob("*.dcm")):
                dest_file = dest_dir / patient_dir.name / src_file.name
                retag(src_file, dest_file, aet)
                print(f"  ✓  {patient_dir.name}/{src_file.name}")
                total += 1

    print(f"\nDone — {total} files written to {DEST_ROOT}")


if __name__ == "__main__":
    main()
