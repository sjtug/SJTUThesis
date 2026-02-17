# Changelog

*Responsible:* Ian Brock (Ian.Brock@cern.ch)

Copyright (C) 2002-2021 CERN for the benefit of the ATLAS collaboration.

All notable changes to the ATLAS LaTeX package are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html)

Changes are sorted into the following categories:
Added, Changed, Deprecated, Removed, Fixed, Security.

---

## [11.6.0] - 2021-08-20

### Added

- Add `thesis` to list of entry types for adjusting title settings.
- Add `.lof` and `.lot` files to list of files to clean in `Makefile`.

### Changed

- Switch to latest computing acknowledgements.
- aMC@NLO Monte Carlo typeset using a small caps "a".
- Small fix to SUSY bibliography entry.
- Acknowledgements information for papers updated.

---

## [11.5.0] - 2021-08-13

### Changed

- Switch to one line per institute and standardised date for acknowledgements.
- Switch to new reference for computing for acknowledgements.

---

## [11.4.0] - 2021-06-09

### Added

- Add software description and reference to template ATLAS detector text.
- Add description of tHW samples to MC snippets.
- Add `captions=tableheading` as default option for better spacing of table captions above table.
  Use `\centering` and not `\begin{center}...\end{center}` to centre tables.
- Add a macro `\AtlasMaketitle` which can be used instead of `\maketitle`.

### Changed

- Switch almost everywhere to `\ifthenelse` instead of simple `\if`.
- Remove most uses of `\def` and use `\newcommand` etc. instead.
- Make sure `atlasdoc.cls`, `atlascover.sty` and `atlasmetadefs.sty` definitions match.
- Many minor updates to `MC_snippets.tex` to adjust to ATLAS style of tables and improve the LaTeX code.
- Simplify logic in `atlasunit.sty`.
- Page size set, even if ATLAS style is not used in `atlasdoc.cls`.
- Switch back to revtex4-1 by default for APS journals (as 2016 is default year).

### Removed

- Lots of commented out code for TeX Live versions older than 2013 removed.
- Remove any use of directory names in `\usepackage` etc., e.g. `\ATLASLATEXPATH`.
- `\AtlasCoverEditor` macro removed, as it is is not used any more.

---

## [11.3.0] - 2021-05-19

### Added

- May update of publications.

### Changed

- Switch to revtex4-2 by default for APS journals.
- Further small updates to Higgs MC snippets.
- Update acknowledgements.

---

## [11.2.0] - 2021-05-07

### Changed

- Small updates to Higgs MC snippets.
- A couple of fixes connected to Errata/Addendum in `ATLAS.bib`.

---

## [11.1.0] - 2021-05-03

### Added

- April update of publications.

### Removed

- `ChangeLog` as it has been superseded by `CHANGELOG.md`.

---

## [11.0.0] - 2021-03-26

Merge MC generators in `atlasmisc.sty` with those in PMG document.
Add PMG document to the templates directory.
Remove macros with version number, as this is now an optional argument for the default macro names.

### Added

- February and March updates of publications.
- Add PMG MC snippets and document.
- Add a  macro `\Hll` to `atlasprocess.sty` and `atlashepprocess.sty`.
- Updated ATLAS Errata.
- `shownote` option for `atlasdoc.cls`. Normally the note number is turned off for the final version of PUB notes, as it should be added by CDS.

### Changed

- Revamp MC stuff in `atlasmisc.sty`. Synchronise with PMG snippets and document.
- Fixed a couple of references in `ATLAS-useful.bib`.
- Use `https` for DOI.
- Small updates to `atlaslatex_update.sh`.

### Removed

- MC macros with version number, as this is now an optional argument:
  `\ACERMCV, \ALPGENV, \HerwigV, \HERWIGV, \JIMMYV, \MADGRAPHV, \MGMCatNLOV, \MCatNLOV, \AMCatNLOV, \MCFMV, \METOPV, \OPENLOOPSV, \POWHEGV, \POWHEGBOXV, \PYTHIAV, \SHERPAV`

### Fixed

- Wrong command was documented for listing ToDo notes - should be `\listoftodos`.

---

## [10.3.0] - 2021-02-09

### Changed

- Updated conference entries to follow fixed scheme with use of `eventdate` and `venue` fields.
- Documented this in `atlas_bibtex.pdf`.

---

## [10.2.0] - 2021-02-08

### Added

- December update of publications.
- `longtable` is now an option for `atlaspackage.sty` and `atlascontribute.sty`.
- All history now included in this file.

---

## [10.1.0] - 2021-01-08

### Added

- November update of publications.

### Removed

- Get rid of `latex` link in journal directory.

### Fixed

- Fixed `atlaslatex-update.py` self-update to only have to be run once.
- `tocdepth` fixed for TeX Live 2013 (option does not work).

---

## [10.0.0] - 2020-11-23

The October 2020 LaTeX update led to options being ignored when passed to a document class or a style file if the filename contained a directory.
While this bug will probably be fixed at some point,
it in general appears to be better to adjust the macro `\input@path`
to specify the directory that should be searched for the ATLAS LaTeX packages.
Hence a new style file `atlaslatexpath.sty` has been introduced and should be loaded using

```latex
\RequirePackage{latex/atlaslatexpath}
```

before the `\documentclass`.

### Added

- New style file `atlaslatexpath.sty` to set search path for style files and document class.
- New script `atlaslatex_2020.sh` to make adjustments to main files for TeX Live 2020.

### Changed

- Changed version numbering from 09-03-00 to 10.0.0 (follows Semantic Versioning).
- Templates and documentation switched to use of `atlaslatexpath.sty`.
- `atlaslatex_update.sh` script can self update and checks for use of `\ATLASLATEXPATH` macro.

### Deprecated

- The macro `\ATLASLATEXPATH` should no longer be necessary or be used.

### Removed

- Use of the `\ATLASLATEXPATH` macro in templates and documentation.
- Removed `texmf` targets in `Makefile`, as regular targets work in the same way.

### Fixed

- Block option was being ignored in `atlasbiblatex.sty` as of version 07-01-00.
- Remove a duplicate reference from ATAS-SUSY.bib.

---

## [09-03-00] - 2020-10-15

### Added

- August update of publications.
- Add JINST as a journal template.

---

## [09-01-00] - 2020-09-09

### Added

- June and July update of publications.
- Complete set of TDRs now included.
- Add usage of `\tablenum` for tables.

### Changed

- Changed citation ATLAS-TDR-2010-19 to ATLAS-TDR-19.
- A number of small updates to the default detector description from David Stoker.

### Fixed

- Use only `\AtlasTitle` macro and not `\title` macro when using `elsarticle` class.

---

## [09-00-03] - 2020-07-23

### Added

- Major additions to `ATLAS-useful.bib` from PMG group.
- Several generators added to `atlasmisc.sty`.
- Add `atlastodo.sty` for to-do notes.
- Add to-do notes package to templates.
- Add option `svgnames` to `xcolor`.

### Deprecated

- Move `atlasdoc2.cls` and `atlascover2.sty` to obsolete directory.
- Only TeX Live 2013 and later now supported.

---

## [08-05-00] - 2020-06-26

### Added

- April and May 2020 update of publications.

---

## [08-04-00] - 2020-05-17

### Added

- March 2020 update of publications including CMS backlog.

### Changed

- Updated acknowledgements citation.
- Number lines inside equations by default (`mathlines` option).

### Fixed

- Add fix for line numbering around AMS Math LaTeX environments.

---

## [08-03-00] - 2020-04-06

### Added

- December 2019 update of publications.
- Add bookmark package by default.

---

## [08-02-00] - 2020-03-15

### Added

- October and November updates of publications.
- Add `cleveref` package as a default package to `atlaspackage.sty`.
- Add `physics` package when passing option full to `atlaspackage.sty`.
- Add `unicode` and `psdextra` options for `hyperref`.
- New macro `\AtlasOrcid` for ORCID.
- ORCID can be included as an optional argument in `\AtlasAuthorContributor`.
- Links in authors will be black. This is used for ORCID links.

---

## [08-01-00] - 2019-11-26

### Added

- Add `atlaslogo` and `cernlogo` options to turn on/off showing the ATLAS and CERN logos.

### Changed

- Change default `percentspace` option in `atlaspackage.sty` to `false`.
- Updated acknowledgements.

---

## [08-00-00] - 2019-11-17

### Added

- August and September updates of publications + a few fixes.
- Add a first CI for ATLAS LaTeX.
- Updated acknowledgements.

### Changed

- Rename macro `\Ref` to `\Refn` and `\Refs` to `\Refns`, as `hyperref` defines `\Ref` in TeX Live 2019.

### Removed

- `\Ref` macro removed due to conflict with `hyperref` in TeX Live 2019.

---

## [07-05-01] - 2019-09-13

### Added

- Set default table of contents depth to section and add `tocdepth` option.
- July update of publications (except CMS).
- Add some, but not all, of the ATLAS TDRs to `ATLAS.bib`.
- Small updates to SUSY templates.
- Fix up a number of references in `ATLAS-useful.bib` and add a few new ones.

### Removed

- Remove usage of `tocloft` package, as it can conflict with KOMA-Script.

---

## [07-04-00] - 2019-05-21

### Changed

- Tweak the logic of the `backref` option. Now off by default, except for draft documents.

---

## [07-03-00] - 2019-05-09

### Added

- April update of publications.

### Changed

- Tweak `atlaslatex_update.sh` to not overwrite help text with `BASENAME`.
- A few fixes to references and detector description.

---

## [07-02-00] - 2019-03-19

### Added

- February update of publications.
- Run 2 detector description added.
- Update `ATLAS-SUSY.bib` and `ATLAS-useful.bib`.

---

## [07-01-01.] - 2019-02-28

### Changed

- Update `ATLAS-SUSY.bib` with correct Errata format and other fixes.

---

## [07-01-00] - 2019-02-22

### Added

- January update of publications.
- Add option `backref` to `atlasbiblatex`.
- Add commented out author list to paper template.
- Add INT note templates for SUSY group. These are a WIP and subject to further change.

---

## [07-00-00] - 2019-01-11

### Added

- November update of publications.
- Add `\JHEP` as a journal.

### Changed

- Rewrite macros for creating cover and title pages.
  - Copyright notice should now always be correctly positioned.
  - Less space used for title etc.
  - Tweaking of offsets should no longer be necessary.
  - Warnings about `overfull hboxes` fixed.
  - Previous version available as `atlasdoc2.cls` and `atlascover2.sty`.
- Always use `paper=letter` option for US paper size.
- Some tweaks so turning on language editor comments should not change text width.

---

## [06-00-00] - 2018-11-30

### Added

- October update of publications.
- Added a script `tex_dollars.py` to convert `$...$` to `\(...\)`.

### Changed

- Number and unit spacing in bib files changed to `~` instead of `\;`.
- Use `\text` instead of `\mbox`, `\textrm`, `\mathrm` in bib files.
- Use `\(...\)` instead of `$...$` in template and bib files.
- Use `firstinits` instead of `giveninits` as `biblatex` option for TeX Live < 2016 instead of 2015.
- Moved `atlaslatex_update.sh` script to `scripts` subdirectory.

---

## [05-09-00] - 2018-10-29

### Added

- September update of publications.
- Add INT note templates for EXOT group. These are a WIP and subject to further change.

### Changed

- Updated acknowledgements.

---

## [05-08-00] - 2018-10-11

### Added

- July and August updates of publications.
- Added bib files `ATLAS-useful.bib` and `ATLAS-SUSY.bib`.
- Start adding text snippets to new `atlassnippets.sty` style file.
- Add `microtype` package to standard packages that are included.

### Changed

- A few tweaks to box sizes to get the copyright more often in the right place.
- Use `latexmk` to make documentation.
- Changed instructions for references for big collaborations (only collaboration name).

### Removed

- Moved `atlas_paper` to `atlaslatex-admin`, as the ATLAS Style Guide should contain everything.

### Fixed

- `BASENAME` should be set correctly if `Makefile` is overwritten via `atlaslatex_update.sh`.

---

## [05-07-00] - 2018-08-02

### Added

- May and June updates of publications.

---

## [05-06-00] - 2018-05-15

### Added

- April updates of publications.
- Start adding copyright statements and LICENSE so code can be made public.

### Changed

- `atlas_physics` has a UK and a US version.
- Make `\dif` language sensitive.

---

## [05-05-00] - 2018-05-04

### Added

- March update of publications.
- Added `\NIMA` as a journal.

### Deprecated

- Moved all old/obsolete style files to an obsolete directory.
- Move `bst` directory with traditional BibTeX style files to obsolete.

---

## [05-04-00] - 2018-03-16

### Added

- February updates of publications.
- Add bookmarks to PDF file via `hyperref`.
- Add a script `atlaslatex_update.sh` to be able to update your atlaslatex version.

### Deprecated

- Move old logos to an obsolete directory.
- Move obsolete style files to same directory.
- Move `lineno.sty` and `authblk.sty` to same directory.

---

## [05-03-00] - 2018-02-20

### Added

- January updates of publications.

### Changed

- Updated acknowledgements.
- Tables document has captions above table.

### Fixed

- Fix language editor comments so that they also work in captions etc.

---

## [05-02-02] - 2018-01-11

### Added

- December updates of publications.
- Added `\tauhad, \taulep, \tauhadvis` and `\taup` definitions.
- Added `\xspace` to journal names in `atlasjournal.sty`.

### Changed

- Allow both `cernpreprint` and `PAPER` options.
- Adjust some definitions to follow ATLAS Style Guide.
- Move `\pileup` to `atlasmisc.sty`.
- `\KT` from `atlasmisc.sty` now `\kperp`.
- `\RcaloM` now `\Rcalom`

---

## [05-01-03] - 2017-12-12

### Fixed

- CERN preprint ID corrected.

---

## [05-01-02] - 2017-11-30

### Added

- November update of publications.
- Add `atlascomment` package for language editors.
- Add option `LANGEDIT` (and `LANGSHOW`) to `atlasdoc` to turn on display of comments.

### Changed

- Abstract in `BOOK` now properly justified.
- The `atlasmetadefs.sty` style file should no longer be necessary when using `atlasdoc`.

### Deprecated

- Moved `atlasdoc1.cls` and `atlascover1.sty` to obsolete directory.

---

## [05-00-01] - 2017-11-07

### Added

- September and October updates of publications.
- Add a proper title page for the `BOOK` option.
- Add `atlasdraft` option to indicate if the document is a draft.
- Add option `abstract`, which should be set to `false` for books without an abstract.
- A skeleton Auxiliary Material file is included by default for papers.
- Add `percentspace` option to `atlaspackage` so space between number and percent can be turned off.
- Add `\MADGRAPHV` and `\MGMCatNLOV` to `atlasmisc.sty`.

### Changed

- Book abstract is put on a separate page.
- The `auxmat` option has been renamed to `HEPDATA` to reflect its usage.
- Move from `scrpage2` to `scrlayer-scrpage` package for TeX Live > 2014.
- Titles for `report` and `misc` bibliography entries by default in italics.
- Pages abbreviation removed also for `english` as language.

---

## [04-02-00] - 2017-09-29

### Added

- August 2017 update of publications.

---

## [04-01-00] - 2017-08-23

### Added

- July 2017 update of publications.
- Add command to make sure `\ell` is shown using PDF figures.

---

## [04-00-00] - 2017-07-21

### Added

- Add Errata to `ATLAS.bib`. This only works properly with biblatex.
- Add ability to use `latexmk` in `Makefile`.
- Add `defaultsups` option to `newtxtext` so multiple authors work properly with TeX Live 2017.
- Add more version variants to MC generator macros.
- Add some explanation on use of `group-minimum-digits` to tables documentation.
- Start adding some documentation about useful packages to ATLAS LaTeX documentation.

### Changed

- Switch from `bibtex` to `biber` as the standard biblatex backend.
- Move `bibtex/bib` to `bib` and `bibtex/bst` to `bib/bst`.
- Reorganise `Makefile` to use separate metadata files for notes and paper.
- Separate templates for paper draft and notes.
- Use same document template for `texmf` version.
- Changes to `atlasmetadefs,sty` so that it works when `coverpage` is turned off.
- Change `group-minimum-digits` option for `siunitx` from 4 to 5.

---

## [03-03-00] - 2017-07-03

### Added

- June 2017 update of publications.

---

## [03-02-00] - 2017-05-30

### Added

- May 2017 update of publications.

---

## [03-01-00] - 2017-05-16

### Added

- April 2017 update of publications.

### Changed

- Small update to detector description.
- Include ATLAS bibliography files by default.

---

## [03-00-01] - 2017-03-31

### Added

- February and March 2017 update of publications.

### Changed

- `atlaslatex` is now maintained in Git.

---

## [03-00-00] - 2017-02-16

### Added

- October 2016 to January 2017 updates of ATLAS publications.
- Add option `datetop` to put the date at the top of the title page.
- Add option `titlepage` to select normal or smaller fonts for the title page.
- Added option `subfig` to `atlaspackage`, so all subfigure packages can be turned off.
- Add option to reduce font sizes on title page.
- Add option to include `mhchem` early for TeX Live 2014.
- Add some more temporary files that come from `latexmk` and `TextMate` to the list to clean up.

### Changed

- Default TeX Live version changed to 2016 to match arXiv.
- `eVkern` option selected by default when using `txfonts`.
- Some options to add more real estate for the abstract on the title page.
- Fix problem when using `subcaption` with list of figures or tables.
- Move `maxbibnames` and block options to `atlasbiblatex.sty`.
- Set `maxbibnames=5` by default to conform with current recommendations.
- More generic font commands on cover and title pages.
- Small change to `atlasdoc1.cls` to get date printed when KOMA-Script is not used.

---

## [02-00-01] - 2016-10-10

### Added

- Add `atlascover1.sty` to go with `atlasdoc1.cls`.
- September update of publications.

### Fixed

- Fix known bugs in version 02-00-00. Tested on usual platforms.

---

## [02-00-00] - 2016-09-21

### Added

- Add `BOOK` option for book as base class for things like LOIs and TDRs.
- Use the command `make newbook` to create such a document.

### Changed

- `atlasdoc1` can use LaTeX classes, but does not support BOOK.

### Deprecated

- This release is not perfect. You have to steer the `coverpage` from class options.
Hopefully this will be fixed in the next release.

### Removed

- Drop standard LaTeX classes - only use KOMA-Script.

---

## [01-08-02] - 2016-09-07

### Added

- June, July, August updates of ATLAS and CMS publications.

---

## [01-08-01] - 2016-08-23

### Added

- New style file `atlasjetetmiss.sty` with definitions from the Jet/Etmiss group.
- A number of definitions from the Jet/Etmiss group were added to `atlasmisc.sty`, `atlasparticle,sty` and `atlasprocess.sty`.
- Add option `eVkern` to `atlaspackage` to move 'e' and 'V' closer together in eV and its variants, e.g. GeV.
- Add options `hepparticle` and `hepprocess` to `atlasphysics`, which use particle names from the `hepparticle` package.
- Add some discussion about `\it, \rm, \tt` etc. errors in TeX Live 2016.

### Changed

- Update definitions of `\GeV` etc. in `atlasunit.sty` (even though you shouldn't be using them - use `siunitx` instead)!

---

## [01-07-13] - 2016-06-15

### Added

- May updates of ATLAS and CMS publications.
- Add location and address options to `atlasbiblatex`.

### Changed

- Do not print month in references (when using biblatex).
- Correct volume number for JHEP (without year).

---

## [01-07-12] - 2016-05-20

### Added

- April updates of ATLAS and CMS publications.
- Add `maxbibnames` option to `atlaspackage`.

---

## [01-07-11] - 2016-05-09

### Added

- March updates of ATLAS and CMS publications.

### Changed

- Switch to new ATLAS logo.

---

## [01-07-10] - 2016-03-22

### Added

- February updates of ATLAS and CMS publications.
- Add `\xspace` to aMC@NLO.

### Changed

- Small fix to link from journal information to DOI.
- Small updates to documentation on ATLAS LaTeX.
- Adjusted journal examples and documentation to use `\ATLASLATEXPATH`. This makes compilation with Windows easier, as links are no longer needed.

---

## [01-07-09] - 2016-01-29

### Added

- December and January updates of ATLAS and CMS publications.

---

## [01-07-08] - 2015-12-19

### Added

- October and November updates of ATLAS and CMS publications.
- Add a couple more Herwig symbols.

### Changed

- Suppress issue number in journal volume.

---

## [01-07-07] - 2015-11-21

### Added

- August and September updates of ATLAS and CMS publications.
- Add commented out code to get institutes on one line for title page.

### Changed

- Updated acknowledgements.
- Some help for JINST publications added.
- Change to CC-BY-4.0.

---

## [01-07-06] - 2015-07-31

### Added

- June and July updates of ATLAS and CMS publications.
- Add `\App` etc. to `atlasxref.sty` for appendices.
- Add some more Monte Carlos to `atlasmisc.sty`.
- Add some more units to `atlas_physics` for testing.
- Add some documentation about JINST.

### Changed

- Improve `siunitx` option setting for TeX Live 2011 (arXiv version).
- A few fixes so that things (sort of) work with TeX Live earlier than 2009.
- Move `\pdfoutput=1` command even earlier in template.
- Small tweak of title page header for long note numbers.
- Adjust things so documentation compiles for TeX Live versions.
- Tweaks for subtables, so that labels are correct.

---

## [01-07-05] - 2015-06-22

### Added

- Monthly update of ATLAS and CMS publications.
- Add (unfortunately) support for TeX Live 2007 and earlier - needed by JINST.
- Add a few more MC generators to `atlasmisc.sty`.
- Add macros for cross-referencing appendices to `atlasxref.sty`.
- Add a bit more documentation on subfigures.

### Changed

- Only print first page in `biblatex` bibliography.
- Set `subfig` and `subcaption` options so that `\ref` and `\subref` work as in subfigure.

---

## [01-07-04] - 2015-06-03

### Added

- Monthly update of ATLAS and CMS publications.
- Add comment to documentation about APS journals.
- Add `\ppbar` as symbol.

### Changed

- `biblatex` option only works as of 2014 and not 2013.

---

## [01-07-03] - 2015-04-29

### Added

- Monthly update of ATLAS and CMS publications.

### Changed

- Do not use `tabular` on cover page for supporting notes.
- A few minor improvements to template comments.
- Improve steering of what is done if `latex` command is used in `Makefile`.
- Check if `biblatex` is loaded in `atlasbiblatex`.

---

## [01-07-02] - 2015-03-20

### Changed

- A few small fixes to the bib files.
- Move from `atlas-paper.bib` to `ATLAS.bib` everywhere.
- Document better how to switch between `subfigure`, `subfig` and `subcaption`.
- Move acknowledgements archive to the admin tree

---

## [01-07-01] - 2015-03-17

### Added

- Added preliminary version of `ATLAS.bib`.
- Add block option to `atlaspackage`.

### Changed

- Updated PUB and CONF note bib files. `ATLAS.bib` comes a bit later.
- Improve instructions for arXiv and CERN preprint.

### Fixed

- Line numbers turned off by mistake in version 01-07-00.

---

## [01-07-00] - 2015-03-09

### Added

- ATLAS CONF and PUB notes bib files included. Journal publications to come.
- Added a few instructions on CERN preprint preparation.
- Add option `detect-all` to `siunitx`.
- Added a new command `make cleanepstopdf` to delete PDF files made automatically from EPS files.

### Changed

- `maketitle=false` is now the default option to avoid problems with `siunitx` and `units` in the title/abstract.
- Improve cross-referencing macros a bit.
- Some adjustments and additions made to the standard `Makefile`.

---

## [01-06-03] - 2015-03-02

### Changed

- Allow `BSM` and `bsm` as options for `atlasphysics.sty`.

---

## [01-06-02] - 2015-02-23

### Added

- Add a variable `\ATLASLATEXPATH` which contains the directory for style files. This can be used instead of the `texmf` option and is more flexible.
- Add `biblatex` option to turn off `eprint`.
- Add some documentation on different directory options.

### Changed

- Print note after URL and `eprint`.

---

## [01-06-01] - 2015-02-08

### Changed

- Adjust things so that only TeX Live version has to be specified.
- Should work back to TeX Live 2009. Before that have to turn off `biblatex`.

### Removed

- Remove contact editor from cover page.
- Remove `make new2009` target. Use `make new TEXLIVE=2009` etc instead.
- Remove `atlas-document-2009.tex`, as `texlive=YYYY` now steers everything.

---

## [01-06-00] - 2015-02-01

### Added

- Add option `coverfontsize` to steer the base font size for the cover pages.
- Add `PAPER` and `NOTE` as options to `atlasdoc`, so that ATLAS Paper gets printed on title page.
- Add package `ifthen` as a required package.

### Changed

- Several tweaks to the cover page so that it can cope better with a long abstract.
- Adjust options for placement and number of floats on a page.
- Only print journal name for paper drafts.

---

## [01-05-03] - 2014-12-23

### Added

- Add acknowledgements.

---

## [01-05-02] - 2014-12-20

### Changed

- Replace `pageheadfoot` option with `pagehead`.
- Small updates to documentation.

---

## [01-05-00] - 2014-12-08

### Added

- First official release of the ATLAS preprint style.
- Add template files for TeX Live 2009 and central `atlaslatex` installations.
- Add a document on table formatting.
- Add option to use different backends with biblatex in `atlaspackage`.
- Add date to CERN preprint front page.
- Add options to turn on/off title and style of title for articles with `biblatex`.
- Add heavy ion style file. A few new definitions aded to `atlasmisc.sty`.
- Start adding standard text snippets.

### Changed

- `atlasstyle` is now default for all documents.
- `biblatex` with the `bibtex` backend is the default way of typesetting references.
- Use `scrpage2` with KOMA-Script and `fancyhdr` with normal LaTeX classes.
- Clean up paper template and change its name to a general guide.
- Bring `biblatex` and `bibtex` onto a similar level in the documentation and the style file.
- Harmonise `biblatex` and BibTeX style files. Style conforms to ATLAS wishes.
- Revise a bit the documentation on a BibTeX entry for a CONF note.
- Move `biblatex` style file to `latex` subdirectory and just link from `bibtex/bst`.
- Auxiliary material includes `fancyhdr` or `scrpage2` by default.

### Removed

- Remove date/time definition from `atlasmisc.sty` to avoid errors with TeX Live 2013.

### Fixed

- Small fix to detector description.

---

## [01-04-01] - 2014-11-20

### Added

- Started documenting ATLAS preprint style in `atlas_latex`.

### Fixed

- Small fix so `atlascover` recognises better when `atlasdoc` is used.

---

## [01-04-00] - 2014-11-19

### Added

- First implementation of the ATLAS preprint style. Fonts still have to be checked on other platforms.
- `make cleanpdf` command added (or being added) to standard `Makefiles`.
- Options added to `atlasdoc` for different fonts.
- `showframe` option added for debugging.

### Changed

- Major rewrite of both `atlasdoc.cls` and `atlascover.sty`, which removes spurious offsets.
- Need `coverpage=true` in `atlascover.sty` if you want a draft cover and are using `atlascover.sty` standalone.

### Removed

- Removed need for title skip parameter and horizontal and vertical offsets on cover pages.
- No longer need `atlasdoc` as option to `atlascover`, as package checks if `atlasdoc` is being used itself.

### Fixed

- Adding of extra blank pages after cover page mostly removed. Have to see if it is necessary somewhere.

---

## [01-03-06] - 2014-10-20

### Changed

- Require `hyperref` in `atlascover` to avoid problems with supporting documentation.

---

## [01-03-05] - 2014-10-16

### Changed

- Rename documentation directories and files to use `_` instead of `-`.

---

## [01-03-04] - 2014-10-09

### Changed

- Small fix to auxiliary material.
- Replace some `\\` with `\par` in `atlascover` for consistency.

---

## [01-03-03] - 2014-10-09

### Fixed

- Fix to CONF and PUB note draft cover pages.

---

## [01-03-02] - 2014-09-22

### Added

- Instructions for Fedora added.
- Add option to `atlaspackage` to turn off `lineno`.

### Changed

- Do not use `lineno` with `revtex` - use class option `linenumbers` instead.
- Use `\linewidth` instead of `\textwidth` in `PrintAtlasContribute` so it works in two column format.
- Print out web page on auxiliary material cover.
- Move date and page number from header to footer in draft mode.

### Fixed

- Fix typo that put line numbers on cover page.
- List of contributors was too wide.
- Small fix to BibTeX style files and bring them back in sync.

---

## [01-02-00] - 2014-09-15

### Added

- Add `texmf` switch to `atlasdoc` (needed for cover).

### Changed

- Use `kvoptions` in `atlascontribute`.
- Change option from `noauthblk` to `authblk=false`.
- Internally quite a lot of variable name changes.
- Prepare `atlasdoc` for moving to `kvoptions`.
- Switched from tabs to spaces in many places.

### Fixed

- Bug fixed for CentOS/Fedora, as `scrdate/scrtime` did not work properly.
- `full` option did not work in `atlaspackage`.
- Small fix to `atlaspackage` so `texlive` switch works.

---

## [01-01-00] - 2014-09-06

### Added

- Add template for auxiliary material (`atlas-auxmat`).
- Add switch so that TeX Live 2009 also works.
- Add `preprintcover` to `Makefile`.
- Add option to `atlaspackage` to turn off including `siunitx`.
- Added `atlasjournal` and `atlasxref` to `atlasphysics`.

### Changed

- Use `fancyhdr` to make header in draft mode (and also for auxiliary material).
- Use `scrdate` and `scrtime` for current date and time.
- Replace `color` with `xcolor`.
- Switch to `kvoptions` in `atlaspackage`.
- Further improvements to documentation, especially to `atlas-latex`.

### Removed

- Do not include `atlascontribute` in metadata file.

---

## [01-00-00] - 2014-09-04

### Added

- Add some examples of paper drafts with journal formatting.
- More style files for journal names and cross references.
- Include JHEP BibTeX style file in `bibtex/bst`.

### Changed

- Use `kvoptions` for setting options, as then offsets can be given.
- Move logos from `figures` to `logos` directory.
- Updates to documentation, especially BibTeX and LaTeX guide.


---

## [00-99-00] - 2014-08-29

### Added

- Added a new style file `atlascontribute.sty`. It can be used to create both the list of authors and the contributions they made to the analysis.

### Deprecated

- `atlas-document-contribute` is no longer needed. This information should be included in `atlas-document-metadata.tex` instead.

---

## [00-98-00] - 2014-08-28

### Added

- Add `lineno` as required package, so that `atlasdoc` does not need `atlaspackage`.
- Rounding note added to documentation.

---

## [00-97-00] - 2014-08-27

### Added

- `atlas-physics` document list of definitions created automatically.
- CONF and PUB are now options for CONF and PUB notes.
- More documentation on options in `atlasdoc` and `atlascover` added to `atlas-latex`.

### Changed

- Cover pages change a bit depending on these options.
- EdBoard replaced by Readers for a PUB note.

---

## [00-96-00] - 2014-08-27

### Added

- Add option `texmf` to `atlasphysics` if package in installed centrally.
- Add note number back into title page.

### Changed

- Merge biblatex setup into `atlaspackage` with an option.
- Switch back from `\AtlasTitle` to `\title`.
- Further improve documentation

---

## [00-95-00] - 2014-08-22

### Added

- First alpha release of `atlaslatex`.
- Add `inputenc` and `fontenc` to `atlasphysics.sty`. In fact, these (and `txfonts`) should probably move to `atlasdoc.cls`.
- Add `koma` option to `atlasdoc.cls`.

### Changed

- `atlasphysics.sty` split into smaller files.
- Options to steer `atlasphysics.sty`.
- Documentation reorganised. Split into paper style, for which PubCom is responsible and `atlaslatex` guide.
- Templates all in `templates` directory.
- `Makefile` can make a new document.
- Better use of `geometry` to set page size everywhere.
- Use `tocloft` for table of contents.
- Titles should invoke `boldmath` automatically.
- Merge `biblatex` into `atlaspackage` and add `biblatex` option.

---

## [Unreleased] - 2021-03-XX

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security
