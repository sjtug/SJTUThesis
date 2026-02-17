Project for ANA-EXOT-2022-13-INT1
====================

This project has been automatically generated following the default setup for all document projects under the atlas-physics-office GitLab group including the Continuous Integration (CI) tools which will check the health of the document after each commit has been push to the project.

## Issues
if there is any issue with the CI pipelines, any job failing, any bug spotted or any question relating the project configuration or GitLab workflow please place an issue following the instructions in the issues wiki page.

If you have further questions or any concern you can send an e-mail to the e-group `atlas-phys-office-glance-gitlab`.

## Permissions
All users in the ANA-EXOT-2019-26 have developer access to the repositories stored in it. This means that every the editors of this project have access to work without any limit in this project but cannot access the project configuration.

The users under the group ANA-EXOT-2019-26 are managed via the editors e-group. If at any point anyone wants to have access to this project please include that user in the e-group and the automatic synchronization will take care of it. Keep in mind that this synchronization can take time.

## Continuous integration

On the left side-bard there is a menu called CD/CD. Here will appear the different pipelines triggered after each commit. The PO-GitLab CI tools will check after each commit has been pushed to the repository that the document is properly formatted for publication and using the latest version of the ATLAS Latex Template. For more details about the pipelines visit [the Pipelines wiki page](https://gitlab.cern.ch/atlas-physics-office/gitlab-integration/wikis/pipelines).

## Preparing for submission

In order to proceed to submission a merge should be placed following [his instructions](https://gitlab.cern.ch/atlas-physics-office/gitlab-integration/wikis/mergerequest) but before doing so it is important to check the different items stated in the [Document Handling twiki page](https://twiki.cern.ch/twiki/bin/view/AtlasProtected/DocumentHandling#PO_GitLab_papers) which are mainly:

1. Check that the document is properly formatted following the document checklist. Most of the items are taking care by checking that the [pipelines](https://gitlab.cern.ch/atlas-physics-office/gitlab-integration/wikis/pipelines) are working properly but it is good to read them and make sure nothing is missing. In particular, please make sure that you don't have any eps files (or duplication of the same file under different formats) and that you don't force (in the main LaTeX file) bibtex to be used, sine the Ci is expecting biber.
2. Prepared the [Metadata.txt](https://twiki.cern.ch/twiki/bin/view/AtlasProtected/MetadataPreparation) file. This file can be either added to the project and linked in the merge request or attached directly to the merge request itself.
3. Check that the figures and tables webpages tarball will be properly generated. This is done in the `PO-*` pipelines automatically after the merge request is accepted by Physics Office but it is good if editors can test it first following the instructions in the [wiki page](https://gitlab.cern.ch/atlas-physics-office/gitlab-integration/wikis/pipelines#po-pipelines).
4. Finally [place the merge request.](https://gitlab.cern.ch/atlas-physics-office/gitlab-integration/wikis/mergerequest).

### Running on lxplus

The most common FAQ I get is why `atlaslatex` does not just compile "out of the box"?
If you are running on `lxplus` for it to work, you MUST set your PATH correctly as follows:

    export PATH=/cvmfs/sft.cern.ch/lcg/external/texlive/2016/bin/x86_64-linux:$PATH

in order to use TeX Live 2016.
TeX Live 2016 is the current version used in the Physics Office Continuous Integration.

A users guide to the templates can be found in `doc/atlas_latex.pdf`. You can produce
this document yourself (and thus test that your LaTeX setup is working)
by giving the commands:

    cd doc/atlas_latex
    make

or  

    cd doc/atlas_latex
    pdflatex atlas_latex
    biber    atlas_latex
    pdflatex atlas_latex
    pdflatex atlas_latex

Four other make targets are:

- `make clean`: cleans up intermediate files
- `make cleanpdf`: remove output pdf file
- `make cleanall`: also cleans up output pdf file
= `make verson`: check your TeX Live version
