# EXOT group support note templates

This directory templates to be used for support (INT) notes of Exotics analyses.

EXOT INT notes should include:
- an executive summary: `executive summary`
- standardized object selection tables including an overlap removal table: `*_selection.tex`, `overlap_removal.tex`
- standardized event selection tables: e.g. `event_cleaning.tex`

The files are included in the `atlaslatex` repository in the directory `template/EXOT`.
For now they should be copied into the main directory of a supporting note and adapted accordingly.
In the future it is planned that they will be copied into the main directory when a skeleton note is created.

All tables except the `event cleaning` are maintained by EXOT group. The `event cleaning` is maintained by the community.
If you see something out-of-date or wrong, please contact the corresponding liaison and the EXOT group conveners.
They should in turn submit a merge request for the `atlaslatex` Git repository.

## Executive summary
This section, ideally 2-pages (max), should be placed at the beginning of the supporting note.
It should give a high-level overview of the analysis including (but not limited to):
 - physics target and the general characteristics of the signal;
 - analysis strategy;
 - general characteristics of the control, validation, and signal regions;
 - background estimation strategy overview;
 - highlight major or most important points of the analysis;
 - a table of all critical tasks, who is responsible for each, and what else they are working on outside of this analysis.

## Object selection
These tables are to harmonize the relevant sections of the supporting notes to make writing, reviewing, and comparing of them **_simpler_**.
These tables are maintained by the [Exotics CP Liaison](https://twiki.cern.ch/twiki/bin/view/AtlasProtected/ExoticsWorkingGroup#Contacts_to_ATLAS_Groups).

If you use non-standard selections which do not fit in these tables, please note that and discussed in detail. 
Also, if your analysis depends on details of the object reconstruction or selection not described, please add the necessary details.

- _Photons & electrons_: `\include{egamma_selection}`
- _Muons_: `\include{muon_selection}`
- _Taus_: `\include{tau_selection}`
- _Jets (small- & large-R (including boosted-object tagging) & MET_: `\include{jet_selection}`
- _b-jets_: `\include{btagging_selection}`
- _Tracks_: `\include{tracks_selection}`
- _Overlap Removal_: `\include{overlap_removal}`


## Event-level selection
Each analysis must apply event level selection to follow the [checklist recommended by DataPrep](https://twiki.cern.ch/twiki/bin/viewauth/Atlas/DataPreparationCheckListForPhysicsAnalysis).

- _DataPrep Checklist_: `\include{event_cleaning}`
