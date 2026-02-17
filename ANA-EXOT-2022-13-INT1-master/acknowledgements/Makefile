# Makefile for creating ATLAS Acknowledegments

TEXLIVE  = 2016
PDFLATEX = pdflatex
BIBTEX   = biber

BASENAME = Acknowledgements-main

.PHONY: clean cleanpdf

run_pdflatex: $(BASENAME).pdf
	@echo "Made $<"

# Change TeX Live version
texlive: $(BASENAME).tex
	if [ $(TEXLIVE) -ge 2013 -a $(TEXLIVE) -lt 2100 ]; then \
	  echo "Changing texlive value in $<"; \
	  sed -i'.bak' 's/texlive=20[0-9][0-9]/texlive=$(TEXLIVE)/' $<; \
	else echo "Invalid value for TEXLIVE: $(TEXLIVE)"; fi; \

# Change biblatex backend
bibtex: $(BASENAME).tex
	if [ $(BIBTEX) = 'biber' -o $(BIBTEX) = 'bibtex' ]; then \
	  echo "Changing biblatex backend in $<"; \
	  sed -i'.bak' -e 's/backend=biber/backend=$(BIBTEX)/' -e 's/backend=bibtex/backend=$(BIBTEX)/' $<; \
	else echo "Invalid value for BIBTEX: $(BIBTEX)"; fi; \

# Standard LaTeX targets
$(BASENAME).pdf: $(BASENAME).tex
	$(PDFLATEX) $<
	-$(BIBTEX)  $(basename $<)
	$(PDFLATEX) $<
	$(PDFLATEX) $<

%.bbl: %.tex *.bib
	$(PDFLATEX) $*
	$(BIBTEX) $*

clean:
	-rm *.dvi *.toc *.aux *.log *.out *.blg *.bbl *.bcf *-blx.bib \
	 *.run.xml *.synctex.gz *~ *.fls *.fdb_latexmk .*.lb spellTmp 

cleanpdf:
	-rm $(BASENAME).pdf

cleanall: clean cleanpdf
