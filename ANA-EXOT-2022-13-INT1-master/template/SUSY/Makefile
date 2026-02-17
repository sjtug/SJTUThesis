#------------------------------------------------------------------------------
# Makefile to make EXOT templates document
#------------------------------------------------------------------------------

BASENAME = SUSY_template
TEXLIVE = 2016

.PHONY: clean cleanpdf

SUSY_template:
	make -f ../../doc/Makefile run_latexmk BASENAME=$(BASENAME)

texlive:
	make -f ../../doc/Makefile texlive BASENAME=$(BASENAME) TEXLIVE=$(TEXLIVE)

clean:
	make -f ../../doc/Makefile clean
	
cleanpdf:
	-rm $(BASENAME).pdf

cleanall: clean cleanpdf
	