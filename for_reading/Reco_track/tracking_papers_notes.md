# Tracking references — information checklist (for quick reading)

This note is meant to help you *read efficiently*: it enumerates what each paper contains (section-by-section) and what information you can extract for writing your thesis. It is a summary/outline, not a copy of the papers.

Folder: `for_reading/Reco_track/`

## Papers currently in this folder
1) **ATLAS dense-environment tracking performance (Run 2)**
- File: `1704.07983v2.pdf`
- Metadata title: *Performance of the ATLAS track reconstruction algorithms in dense environments in LHC Run 2*
- Journal: Eur. Phys. J. C 77 (2017) 673
- DOI: 10.1140/epjc/s10052-017-5225-7
- arXiv: 1704.07983
- Thesis usage: performance limitations in dense environments; merged clusters; data-driven tracking-efficiency measurement in jet cores.

2) **ATLAS NEWT (software/algorithm overview)**
- File: `T_Cornelissen_2008_J._Phys.__Conf._Ser._119_032014.pdf`
- Title: *The new ATLAS track reconstruction (NEWT)*
- Venue: J. Phys.: Conf. Ser. 119 (2008) 032014 (CHEP 2007 proceedings)
- DOI: 10.1088/1742-6596/119/3/032014
- Thesis usage: “what is the tracking pipeline” (inside-out, ambiguity solving, TRT extension, outside-in/backtracking); also a nice source for *why* modular tracking software exists.

3) **Kalman filtering intro (general estimation background)**
- File: `1710.04055v5.pdf`
- Title: *An Elementary Introduction to Kalman Filtering*
- arXiv: 1710.04055
- Thesis usage: a clean reference if you want to justify the *idea* of Kalman filtering / optimal linear fusion of noisy measurements (useful for track-fitting background).

4) **ATLAS muon reconstruction performance (Run 2, 13 TeV)**
- File: `s10052-016-4120-y.pdf`
- Title: *Muon reconstruction performance of the ATLAS detector in proton--proton collision data at $\sqrt{s}=13$ TeV*
- Journal: Eur. Phys. J. C 76 (2016) 292
- DOI: 10.1140/epjc/s10052-016-4120-y
- Thesis usage: MS segment/track reconstruction overview; ID--MS combination (muon types); reconstruction efficiency + momentum scale/resolution.

---

## 1) 1704.07983v2 — “Dense environments” tracking performance (ATLAS Run 2)

### What question the paper answers
- How well does ATLAS reconstruct tracks when charged particles are highly collimated (jet cores, boosted decays, hadronic τ), where separations are comparable to pixel granularity?
- What algorithmic changes (e.g. pixel-cluster treatment) improve performance?
- Can the *fraction of lost tracks* in jet cores be measured *from data* (not only from MC)?

### Paper structure and what each part contains
**1. Introduction**
- Motivation: Run-2 high-energy jets → dense cores; reconstruction confusion; relevance for b-tagging, τ, jet calibration.

**2. The ATLAS detector**
- Quick description of ATLAS, with focus on the Inner Detector and its pixel/SCT/TRT roles.

**3. ATLAS track reconstruction** (this is the key “algorithm” part)
- **3.1 Clusterization**
  - Hit → cluster formation (connected component analysis, CCA).
  - Space-point creation: pixel cluster → space point; SCT requires combining both sides.
  - Definitions you can reuse:
    - *single-particle cluster* vs *merged cluster* (truth-based in MC).
    - *identified-as-merged* vs *shared* clusters (reco-level categories).
    - “multiply used clusters” = identified-as-merged OR shared (mutually exclusive as defined here).
  - Figure 2 illustrates single vs merged pixel clusters.
- **3.2 Iterative combinatorial track finding**
  - Seeding: three space-points; crude helix parameter estimate.
  - Seed-type ordering by purity: SCT-only → pixel-only → mixed.
  - Seed cuts: momentum/impact parameter cuts; control reuse of space-points.
  - Track building: combinatorial Kalman filter creates candidates; can branch if multiple compatible extensions exist.
  - CPU budget comment: many possible combinations, but algorithmic controls make the expensive steps run rarely.
- **3.3 Track candidates and ambiguity solving**
  - Candidate ordering by a *track score*.
  - Score ingredients: hit weights by subdetector, holes penalized, fit χ², log(p) to favor real high-pT tracks.
  - Shared-cluster handling rules (limits on shared clusters; preference to earlier/higher-score candidates).
  - Example baseline quality requirements include (the paper lists more in this section):
    - `pT > 400 MeV`, `|η| < 2.5`, and a minimum number of silicon clusters.
- **3.4 Neural-network pixel clustering**
  - NN-based identification/treatment of merged pixel clusters (read this if you want a short paragraph on “ML in tracking”).
- **3.5 Track fit**
  - Final fit step after ambiguity solving (parameter + covariance), used for track quality and later physics.

**4. Data and Monte Carlo samples**
- Data: 13 TeV, 2015, 3.2 fb⁻¹ (from the abstract/front page).
- MC: dijet samples; used for comparisons and method validation.

**5. Track reconstruction performance in dense environments**
- **5.1 Classification**
  - How tracks/clusters are categorized for the dense-environment studies.
- **5.2 Data and MC simulation comparison**
  - Basic observables comparing data vs MC in dense jets.
- **5.3 Performance for collimated tracks**
  - Dedicated single-particle / decay topologies to isolate “two tracks close together” effects.
- **5.4 Performance for tracks in jets**
  - How performance evolves with jet pT / track density in realistic jets.
  - Example figures you can look at:
    - Figure 4: primary-track density vs ΔR to jet axis.
    - Figure 5: (a) merged-identified pixel clusters and (b) shared pixel clusters vs ΔR.
    - Figure 6+: cluster assignment / IBL cluster behavior vs ΔR (dense cores).

**6. Measurement of track reconstruction efficiency in jets from data** (this is the key “data-driven method” part)
- **6.1 Track selection**
  - The analysis track selection used for the data-driven measurement (beyond the baseline track-quality in Section 3.3):
    - Exactly one pixel cluster per layer
    - $p_T > 10$ GeV
    - $|\eta| < 1.2$
    - $|d_0^{BL}| < 1.5$ mm
    - $|z_0^{BL}\sin\theta| < 1.5$ mm
    - Minimum of six SCT clusters
- **6.2 Fit method**
  - Uses pixel-cluster `dE/dx` (ToT-based) to distinguish 1-MIP vs 2-MIP clusters.
  - Defines templates:
    - *single-track template* (one particle → one cluster)
    - *multiple-track template* (two particles merged; can correspond to one reconstructed + one lost)
  - Defines the measured “lost-track fraction for track pairs” `F_lost2` and gives equations relating:
    - `N_true2 = N_reco2 + 2·N_lost` and `F_lost2 = N_lost / N_true2` (see Section 6.2).
  - Concrete definitions you may want to quote in your thesis text:
    - **Jet core definition (for this method):** most collimated tracks lie within $\Delta R(\mathrm{jet},\mathrm{trk}) < 0.05$.
    - **Single-track template:** tracks well outside the jet core ($\Delta R(\mathrm{jet},\mathrm{trk}) > 0.1$) built from clusters that are neither “identified as merged” nor “shared”.
    - **Multiple-track template:** tracks inside the jet core reconstructed from B-layer clusters identified as merged, or shared B-layer clusters (multiply-used clusters).
  - Fit-range detail (useful if you want to reproduce the method): fit range is `1.1–3.07 MeV g^-1 cm^2` for data and `1.26–3.2 MeV g^-1 cm^2` for simulation.
  - Figure 15: example templates.
- **6.3 Systematic uncertainties**
  - Fit-range dependence, closure tests, etc.
  - Generator dependence mentioned for simulation comparisons.
  - Table 1 summarizes leading systematics + stat.
- **6.4 Results**
  - Figure 16: example `dE/dx` fit in two jet-pT bins.
  - Figure 17: `F_lost2` vs jet pT (data vs simulation) in the jet core.

### Concrete numeric results you can quote
- From the abstract/front page:
  - Lost-track fraction in the jet core rises with jet pT; e.g. about `0.061 ± 0.006 (stat.) ± 0.014 (syst.)` for `200–400 GeV` jets and `0.093 ± 0.017 (stat.) ± 0.021 (syst.)` for `1400–1600 GeV` jets.
- Table 1 provides `F_lost2` per jet-pT bin and relative systematics/statistics (use it if you need a table-driven citation).

### Figures/Tables checklist (for fast navigation)
- Figures strongly tied to dense-environment story: 2, 4–7, 10–14, 15–17.
- Table 1: `F_lost2` per jet-pT bin + leading systematics.

---

## 2) Cornelissen et al. 2008 — “NEWT” track reconstruction (algorithm + software architecture)

### What question the paper answers
- What is the *high-level* structure of the ATLAS tracking chain (especially in the Inner Detector) and why it is organized as a modular component framework?
- How are inside-out / outside-in steps organized, and where do ambiguity solving, TRT extension, and backtracking fit in?

### Paper structure and what each part contains (from extracted headings)
**1. Introduction**
- Context: multiple historical packages → maintenance/config/conditions-data problems.
- NEWT = a common tracking EDM and modular tool/interface design.
- Mentions usage in offline reconstruction and in the Event Filter (HLT).

**1.1 The ATHENA framework, common services and the event data model**
- Athena/Gaudi framework context; “blackboard” (StoreGate) architecture.
- Job configuration via Python interfaces (important if you want one sentence about how reconstruction is steered).

**2. New Tracking in the Inner Detector**
- NEWT first fully deployed in ID; validated with MC, test beam, cosmics.

**2.1 The ATLAS Inner Detector**
- Pixel + SCT + TRT roles.
- Gives rough channel counts (order-of-magnitude numbers).

**2.2 The ID reconstruction sequences**
- Emphasizes: pattern recognition and track fitting are intertwined (Kalman extensions, DAF, etc.).
- Two main sequences:
  - inside-out
  - outside-in
- Mentions additional second-stage pattern recognition for special topologies (V0, kink/brems-related), though not the focus.

**2.3 The Inside-out sequence**
- Starts from silicon seeding, grows outward.
- **2.3.1 Global track seeding**
  - Build 3D silicon space points, then seeds and candidates.
  - Uses a road/window search and simplified Kalman filtering/smoothing logic for accepting/rejecting hits.
- Figure 2: UML-like diagram of the main modules and shared tools.

**2.4 Ambiguity solving**
- Track scoring via reward/penalty; higher score prefers more/better hits.
- Different subdetectors contribute differently; holes penalize.
- Figure 3: schematic ambiguity example in SCT barrel (shared hits, holes, overlaps).

**2.4.1 TRT track extension**
- Extends silicon tracks into TRT; only tracks surviving ambiguity go to this step.
- Two implementations are described:
  - a “classical” road-finding + line-fit compatibility check
  - a DAF-based approach optimized for high occupancy (weights hits by likelihood, annealing)
- Follow-up processing: fit + scoring to select the best TRT extension candidates.
- Figure 4: example event showing TRT associations and standalone TRT segments.

**2.5 The Outside-in sequence**
- Motivation: tracks with poor/insufficient silicon seeds, displaced tracks (Ks, conversions), electrons with energy loss, etc.
- Starts from TRT: segment finding (Hough transform), then *backtracking* into silicon.
- Uses an association tool to avoid reusing hits already assigned in inside-out.

**3. Performance**
- **Figure 5**: example performance plots (impact-parameter resolution and reconstruction efficiency vs |η|, for inside-out).
- **3.1 Electron fitting**
  - Motivation: bremsstrahlung breaks Gaussian-noise assumptions.
  - Mentions GSF and alternative noise-handling.
  - Figure 6: Z→ee mass improvement with GSF refit compared to standard Kalman.
- **3.2 Timing performance**
  - Gives a target (order of Hz) and a table of per-module timing contributions.
  - Table 1 (approx. time/event, ms) lists representative costs for the ID chain:
    - silicon space-point seeded track finding: 370 ms
    - ambiguity solving on silicon track candidates: 240 ms
    - extension into the TRT: 270 ms
    - TRT segment finding: 340 ms

**4. Conclusion / 4.1 Conclusion and Outlook**
- Summary of modular tracking chain; common EDM output objects; relevance for trigger and future extensions.

### Figures/Tables checklist (for fast navigation)
- Figure 1: offline vs Event Filter reconstruction example.
- Figure 2: module/tool sequence diagram (great for a thesis “pipeline diagram” description).
- Figure 3: ambiguity solving schematic.
- Figure 4: TRT extension vs TRT segment search example.
- Figure 5: representative track performance plots.
- Figure 6: GSF vs standard Kalman for Z→ee.
- Table 1: per-module timing contributions.

---

## If you want, I can also generate “reading questions” for each section
Examples:
- For 1704.07983: What exact track selection is used in Section 6.1? What is the definition of the jet core (ΔR cut)? What template-building details matter if you want to reproduce the method?
- For Cornelissen 2008: Which components/tools are “common” vs detector-specific? What is the stated scoring logic in ambiguity solving?

---

## 3) Pei et al. 2019 — “An Elementary Introduction to Kalman Filtering” (general background)

### Why you might care (for a thesis)
- Useful if you want 1–2 paragraphs explaining *why* Kalman filtering is a natural way to combine noisy measurements with uncertainties (covariances), before you say “track fitting uses a Kalman(-like) filter”.
- Not ATLAS-specific; treat it as math/estimation background rather than detector documentation.

### What the paper contains (outline)
- Abstract + **1 Introduction**: positioning Kalman filtering as “data fusion with uncertainty”.
- **2 Formalization of estimates**: random variables, mean/variance, covariance, uncorrelated vs independent.
- **3–4 Fusing scalar/vector estimates**: how optimal linear weighting follows from variances/covariances.
- **5 BLUE** (best linear unbiased estimator): how to estimate hidden components when only part of the state is observed.
- **6 Kalman filters for linear systems**: state evolution model (prediction) + measurement update (fusion).
- **7 Extension to nonlinear systems**: brief discussion.

### What to cite it for (thesis use-cases)
- A general reference for the *principle* of Kalman filtering / optimal linear fusion (not detector-specific details).

---

## 4) ATLAS Collaboration 2016 — Muon reconstruction performance at $\sqrt{s}=13$ TeV

### What it gives you (high-value items for writing)
- A concrete, ATLAS-official description of the **MS tracking workflow** (segments → MS track candidates → global fit with hit cleaning/recovery).
- A clear definition of **muon reconstruction types** and the logic used to resolve overlaps:
  - Combined (CB): independent ID and MS tracks + global refit of hits from both.
  - Segment-tagged (ST): an ID track associated with at least one MS segment.
  - Calorimeter-tagged (CT): ID track matched to MIP-like calorimeter deposit (recovers $|\eta|<0.1$ region).
  - Extrapolated (ME): MS-only, parameters reported at IP with energy-loss correction (extends to $2.5<|\eta|<2.7$).
- Performance deliverables you can cite: reconstruction efficiency (tag-and-probe with $Z\to\mu\mu$ / $J/\psi\to\mu\mu$), isolation efficiency, momentum scale/resolution and calibration procedure.

### Where to read for “how MS tracking works”
- Section 3.1: **Muon reconstruction in the MS**
  - Segment finding inside chambers; Hough-transform-based hit-pattern search; straight-line fits for segments.
  - Segment-seeded combinatorial track building across layers; overlap removal; global $\chi^2$ fit.
  - Hit removal (large $\chi^2$ contributions) + hit recovery.
- Section 3.2: **Combined reconstruction**
  - Outside-in vs inside-out combination strategies; global refit; energy-loss treatment in the calorimeter.
