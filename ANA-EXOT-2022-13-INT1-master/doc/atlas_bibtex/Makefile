#------------------------------------------------------------------------------
# Makefile to make atlas_bibtex documentation
#------------------------------------------------------------------------------

BASENAME = atlas_bibtex
TEXLIVE = 2016

.PHONY: clean cleanpdf

atlas_bibtex:
	make -f ../Makefile run_latexmk BASENAME=$(BASENAME)

texlive:
	make -f ../Makefile texlive BASENAME=$(BASENAME) TEXLIVE=$(TEXLIVE)

clean:
	make -f ../Makefile clean
	
cleanpdf:
	-rm $(BASENAME).pdf

cleanall: clean cleanpdf
