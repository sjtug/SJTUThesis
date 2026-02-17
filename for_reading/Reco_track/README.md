# Reco_track reading index

This folder currently contains ATLAS tracking references, one muon-reconstruction performance paper, plus one Kalman-filtering background note.

For a consolidated “what information is in which paper” checklist, see: `tracking_papers_notes.md`.

## 1) ATLAS tracking in dense environments (Run 2)
- **File**: `1704.07983v2.pdf`
- **Full ref**: ATLAS Collaboration, *Performance of the ATLAS Track Reconstruction Algorithms in Dense Environments in LHC Run 2*, Eur. Phys. J. C 77 (2017) 673.
- **arXiv**: 1704.07983 [hep-ex]
- **DOI**: 10.1140/epjc/s10052-017-5225-7
- **What to cite it for (thesis use-cases)**
  - Tracking performance in *high-occupancy / dense* topologies (jet cores, small track separations).
  - Data-vs-MC comparison for tracking observables and efficiency degradation vs. track density.
  - Pixel-cluster-based data-driven efficiency method (uses cluster properties / dE/dx to identify merged clusters).
- **Where it fits in your writing**
  - Event reconstruction chapter → “tracking performance and limitations in dense environments”.
  - Systematics/validation section → “data-driven tracking efficiency cross-check”.

## 2) ATLAS “NEWT” track reconstruction (CHEP 2007 proceedings)
- **File**: `T_Cornelissen_2008_J._Phys.__Conf._Ser._119_032014.pdf`
- **Full ref**: T. Cornelissen et al., *The new ATLAS track reconstruction (NEWT)*, J. Phys. Conf. Ser. 119 (2008) 032014.
- **DOI**: 10.1088/1742-6596/119/3/032014
- **What to cite it for (thesis use-cases)**
  - A compact *algorithm overview* of ATLAS tracking (pattern recognition → ambiguity solving → track fitting).
  - Typical components you can describe in your Track Reconstruction section:
    - seeding and inside-out pattern recognition (ID silicon),
    - extension to outer detectors (e.g. TRT) / back-tracking,
    - ambiguity resolution (shared hits / competing candidates),
    - track fit (often Kalman-filter based in HEP frameworks).
- **Where it fits in your writing**
  - Event reconstruction chapter → “tracking algorithm pipeline (high-level description)”.

## 3) ATLAS muon reconstruction performance (13 TeV, 2015 data)
- **File**: `s10052-016-4120-y.pdf`
- **Full ref**: ATLAS Collaboration, *Muon reconstruction performance of the ATLAS detector in proton–proton collision data at $\sqrt{s}=13$ TeV*, Eur. Phys. J. C 76 (2016) 292.
- **DOI**: 10.1140/epjc/s10052-016-4120-y
- **What to cite it for (thesis use-cases)**
  - How muon tracks are built in the MS (segments → MS track candidates) and how MS+ID tracks are combined.
  - Standard ATLAS muon types (combined, segment-tagged, calorimeter-tagged, extrapolated) and the reconstruction logic.
  - Reconstruction efficiency + momentum scale/resolution measurements (tag-and-probe with $Z\to\mu\mu$ and $J/\psi\to\mu\mu$).
- **Where it fits in your writing**
  - Event reconstruction chapter → Leptons → Muons (recommended place for the algorithm details).

## Suggested BibTeX keys (added to refs.bib)
- `ATLASTrackingDense2017`
- `Cornelissen2008NEWT`
- `Pei2019KalmanIntro`
- `ATLASMuonReco2016`

## Next useful additions (if you want to expand this folder later)
- ATLAS detector paper (overall detector + ID overview) for the basic detector description.
- ATLAS tracking performance papers (inclusive tracks, primary vertices, impact parameter resolution) for baseline performance.
