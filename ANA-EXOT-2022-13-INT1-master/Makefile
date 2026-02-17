# Makefile for creating an ATLAS LaTeX document
#------------------------------------------------------------------------------
# By default makes ANA-EXOT-2022-13-INT1.pdf using target run_pdflatex.
# Replace ANA-EXOT-2022-13-INT1 with your main filename or add another target set.
# Adjust TEXLIVE if it is not correct, or pass it to "make new".
# Replace BIBTEX = biber with BIBTEX = bibtex if you use bibtex instead of biber.
# Adjust FIGSDIR for your figures directory tree.
# Adjust the %.pdf dependencies according to your directory structure.
# Use "make clean" to cleanup.
# Use "make cleanpdf" to delete $(BASENAME).pdf.
# "make cleanall" also deletes the PDF file $(BASENAME).pdf.
# Use "make cleanepstopdf" to rmeove PDF files created automatically from EPS files.
#   Note that FIGSDIR has to be set properly for this to work.

# Set the default target to run_latexmk instead of run_pdflatex to use latexmk to compile.

# If you have to run latex rather than pdflatex adjust the dependencies of %.dvi target
#   and use the command "make run_latex" to compile.
# Specify dvipdf or dvips as the run_latex dependency,
#   depending on which you want to use.

#-------------------------------------------------------------------------------
# Check which TeX Live installation you have with the command pdflatex --version
TEXLIVE  = 2016
LATEX    = latex
PDFLATEX = pdflatex
# BIBTEX   = bibtex
BIBTEX   = biber
DVIPS    = dvips
DVIPDF   = dvipdf

#-------------------------------------------------------------------------------
# The main document filename
BASENAME = ANA-EXOT-2022-13-INT1

#-------------------------------------------------------------------------------
# Adjust this according to your top-level figures directory
# This directory tree is used by the "make cleanepstopdf" command
FIGSDIR  = figs
#-------------------------------------------------------------------------------

# EPSTOPDFFILES = `find . -name \*eps-converted-to.pdf`
rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))
EPSTOPDFFILES = $(call rwildcard, $(FIGSDIR), *eps-converted-to.pdf)

# Default target - make ANA-EXOT-2022-13-INT1.pdf with pdflatex
default: run_pdflatex
# Use latexmk instead to compile
# default: run_latexmk

.PHONY: run_latexmk
.PHONY: newdocument newdocumenttexmf newnotemetadata newpapermetadata newfiles
.PHONY: draftcover preprintcover newdata
.PHONY: clean cleanpdf help

# Standard pdflatex target
run_pdflatex: $(BASENAME).pdf
	@echo "Made $<"

# Remove -pdf option to run latex instead of pdflatex
run_latexmk:
	latexmk -pdf $(BASENAME)

#-------------------------------------------------------------------------------
# Specify the tex and bib file dependencies for running pdflatex
# If your bib files are not in the main directory adjust this target accordingly
#%.pdf: %.tex *.tex bib/*.bib
%.pdf:  %.tex *.tex *.bib
	$(PDFLATEX) $<
	-$(BIBTEX)  $(basename $<)
	$(PDFLATEX) $<
	$(PDFLATEX) $<
#-------------------------------------------------------------------------------

# Default is to make a new paper
new: newnote

newpaper: TEMPLATE=atlas-paper
newpaper: newdocument newfiles newpapermetadata newauxmat

newpapertexmf: TEMPLATE=atlas-paper
newpapertexmf: newdocumenttexmf newfiles newpapermetadata newauxmat

newnote: TEMPLATE=atlas-note
newnote: newdocument newfiles newnotemetadata

newnotetexmf: TEMPLATE=atlas-note
newnotetexmf: newdocumenttexmf newfiles newnotemetadata

newbook: TEMPLATE=atlas-book
newbook: newdocument newfiles newpapermetadata

newbooktexmf: TEMPLATE=atlas-book
newbooktexmf: newdocumenttexmf newfiles newpapermetadata

draftcover:
	if [ $(TEXLIVE) -ge 2007 -a $(TEXLIVE) -lt 2100 ]; then \
	  sed 's/texlive=20[0-9][0-9]/texlive=$(TEXLIVE)/' template/atlas-draft-cover.tex \
		>$(BASENAME)-draft-cover.tex; \
	else \
	  echo "Invalid value for TEXLIVE: $(TEXLIVE)"; \
	  cp  template/$(BASENAME)-draft-cover.tex $(BASENAME)-draft-cover.tex; \
	fi

preprintcover:
	sed 's/texlive=20[0-9][0-9]/texlive=$(TEXLIVE)/' template/atlas-preprint-cover.tex \
	  >$(BASENAME)-preprint-cover.tex
	#cp template/atlas-preprint-cover.tex $(BASENAME)-preprint-cover.tex

newdata:
	sed s/atlas-document/$(BASENAME)/ template/atlas-hepdata-main.tex | \
	sed 's/texlive=20[0-9][0-9]/texlive=$(TEXLIVE)/' >$(BASENAME)-hepdata-main.tex
	cp template/atlas-hepdata.tex $(BASENAME)-hepdata.tex

newdocument:
	if [ $(TEXLIVE) -ge 2007 -a $(TEXLIVE) -lt 2100 ]; then \
	  sed s/atlas-document/$(BASENAME)/ template/$(TEMPLATE).tex | \
		sed 's/texlive=20[0-9][0-9]/texlive=$(TEXLIVE)/' >$(BASENAME).tex; \
	else \
	  echo "Invalid value for TEXLIVE: $(TEXLIVE)"; \
	  sed s/atlas-document/$(BASENAME)/ template/$(TEMPLATE).tex >$(BASENAME).tex; \
	fi

newdocumenttexmf:
	if [ $(TEXLIVE) -ge 2007 -a $(TEXLIVE) -lt 2100 ]; then \
	  sed s/atlas-document/$(BASENAME)/ template/$(TEMPLATE).tex | \
	  sed 's/texlive=20[0-9][0-9]/texlive=$(TEXLIVE)/' | \
	  sed 's/\\newcommand\*{\\ATLASLATEXPATH}{latex\/}/% \\newcommand\*{\\ATLASLATEXPATH}{latex\/}/' | \
	  sed 's/% \\newcommand\*{\\ATLASLATEXPATH}{}/\\newcommand\*{\\ATLASLATEXPATH}{}/' \
	  >$(BASENAME).tex; \
	else \
	  echo "Invalid value for TEXLIVE: $(TEXLIVE)"; \
	  sed s/atlas-document/$(BASENAME)/ template/$(TEMPLATE).tex >$(BASENAME).tex; \
	fi

newpapermetadata:
	cp template/atlas-paper-metadata.tex $(BASENAME)-metadata.tex

newnotemetadata:
	cp template/atlas-note-metadata.tex $(BASENAME)-metadata.tex

newfiles:
	echo "% Put you own bibliography entries in this file" > $(BASENAME).bib
	# touch $(BASENAME).bib
	touch $(BASENAME)-defs.sty

newauxmat:
	cp template/atlas-auxmat.tex $(BASENAME)-auxmat.tex
	cp template/atlas-hepdata.tex $(BASENAME)-hepdata.tex

run_latex: dvipdf

# Targets if you run latex instead of pdflatex
dvipdf: $(BASENAME).dvi
	$(DVIPDF) -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress $<
	@echo "Made $(basename $<).pdf"

dvips:  $(BASENAME).dvi
	$(DVIPS) $<
	@echo "Made $(basename $<).ps"

# Specify dependencies for running latex
#%.dvi: %.tex tex/*.tex bibtex/bib/*.bib
%.dvi:  %.tex *.tex *.bib
	$(LATEX)    $<
	-$(BIBTEX)  $(basename $<)
	$(LATEX)    $<
	$(LATEX)    $<

%.bbl:  %.tex *.bib
	$(LATEX) $<
	$(BIBTEX) $<

help:
	@echo "To create a new paper/CONF Note/PUB Note draft give the command:"
	@echo "make newpaper [BASENAME=ANA-EXOT-2022-13-INT1] [TEXLIVE=YYYY]"
	@echo "To create a new ATLAS note draft give the command:"
	@echo "make newnote [BASENAME=ANA-EXOT-2022-13-INT1] [TEXLIVE=YYYY]"
	@echo "To create a long document (book) like a TDR:"
	@echo "make newbook [BASENAME=ANA-EXOT-2022-13-INT1] [TEXLIVE=YYYY]"
	@echo ""
	@echo "To compile the paper give the command"
	@echo "make"
	@echo "If your bib files are not in the main directory, adjust the %.pdf target accordingly."
	@echo ""
	@echo "To compile the document using latexmk give the command:"
	@echo "make latexmk"
	@echo "You can also adjust the 'default' target."
	@echo ""
	@echo "If atlaslatex is installed centrally, e.g. in ~/texmf:"
	@echo "make newpapertexmf|newnotetexmf|newbooktemf [BASENAME=ANA-EXOT-2022-13-INT1] [TEXLIVE=YYYY]"
	@echo ""
	@echo "If you need a standalone draft cover give the commands:"
	@echo "make draftcover [BASENAME=ANA-EXOT-2022-13-INT1] [TEXLIVE=YYYY]"
	@echo "pdflatex ANA-EXOT-2022-13-INT1-draft-cover"
	@echo ""
	@echo "If you need a standalone preprint cover give the commands:"
	@echo "make preprintcover [BASENAME=ANA-EXOT-2022-13-INT1] [TEXLIVE=YYYY]"
	@echo "pdflatex ANA-EXOT-2022-13-INT1-preprint-cover"
	@echo ""
	@echo "If you need a document for HepData material give the commands:"
	@echo "make newdata [BASENAME=ANA-EXOT-2022-13-INT1] [TEXLIVE=YYYY]"
	@echo "pdflatex ANA-EXOT-2022-13-INT1-hepdata-main"
	@echo ""
	@echo "make clean    to clean auxiliary files (not output PDF)"
	@echo "make cleanpdf to clean output PDF files"
	@echo "make cleanps  to clean output PS files"
	@echo "make cleanall to clean all files"
	@echo "make cleanepstopdf to clean PDF files automatically made from EPS"
	@echo ""

clean:
	-rm ANA-EXOT-2022-13-INT1.pdf *.dvi *.toc *.aux *.log *.out \
		*.bbl *.blg *.brf *.bcf *-blx.bib *.run.xml \
		*.cb *.ind *.idx *.ilg *.inx \
		*.synctex.gz *~ *.fls *.fdb_latexmk .*.lb spellTmp

cleanpdf:
	-rm $(BASENAME).pdf
	-rm $(BASENAME)-draft-cover.pdf $(BASENAME)-preprint-cover.pdf
	-rm $(BASENAME)-hepdata-main.pdf

cleanps:
	-rm $(BASENAME).ps
	-rm $(BASENAME)-draft-cover.ps $(BASENAME)-preprint-cover.ps
	-rm $(BASENAME)-hepdata-main.ps

cleanall: clean cleanpdf cleanps

# Clean the PDF files created automatically from EPS files
cleanepstopdf: $(EPSTOPDFFILES)
	@echo "Removing PDF files made automatically from EPS files"
	-rm $^
