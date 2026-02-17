# SUSY group support note templates

This directory contains templates to be used for support (INT) notes of SUSY analyses.

SUSY INT notes should include:
- an executive summary: `executive summary`
- explicit pointers to the locations of the pieces of documentation required for a PAR and a FAR

The files are included in the `atlaslatex` repository in the directory `template/SUSY`.
For now they should be copied into the main directory of a supporting note and adapted accordingly.
In the future it is planned that they will be copied into the main directory when a skeleton note is created.

All files are maintained by the SUSY group.
If you see something out-of-date or wrong, please contact the SUSY group conveners.
They should in turn submit a merge request for the `atlaslatex` Git repository.

## Executive summary
This section, ideally less than two pages, should be placed at the beginning of the supporting note.
It should give a high-level overview of the analysis including (but not limited to):
 - physics target and the general characteristics of the signal;
 - analysis strategy;
 - general characteristics of the control, validation, and signal regions;
 - a background estimation strategy overview;
 - highlights of major or most important points of the analysis;
 - a table of all critical tasks and who is responsible for each.

This section should include explicit pointers to the items required for the [PAR](https://twiki.cern.ch/twiki/bin/view/AtlasProtected/SusyApprove#Partial_Analysis_Review) and [FAR](https://twiki.cern.ch/twiki/bin/view/AtlasProtected/SusyApprove#Full_analysis_review_and_unblind), including the list of [standard plots and checks](https://twiki.cern.ch/twiki/bin/view/AtlasProtected/SusyBgForumRun2CheckList#Standard_diagnostic_plots_checks) and the [items recommended by DataPrep](https://twiki.cern.ch/twiki/bin/viewauth/Atlas/DataPreparationCheckListForPhysicsAnalysis).
