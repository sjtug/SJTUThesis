#------------------------------------------------------------------------------
# Makefile to make atlas_physics documentation
#------------------------------------------------------------------------------

BASENAME1 = atlas_physics
BASENAME2 = atlas_hepphysics
TEXLIVE = 2016

.PHONY: clean cleanpdf

atlas_physics:
	make -f ../Makefile run_latexmk BASENAME=$(BASENAME1)

atlas_hepphysics:
	if [ $(TEXLIVE) -ge 2013 ]; then \
		make -f ../Makefile BASENAME=$(BASENAME2); \
	fi

texlive:
	make -f ../Makefile texlive BASENAME=$(BASENAME1) TEXLIVE=$(TEXLIVE)
	make -f ../Makefile texlive BASENAME=$(BASENAME2) TEXLIVE=$(TEXLIVE)

clean:
	make -f ../Makefile clean

cleanpdf:
	-rm $(BASENAME1).pdf
	-rm $(BASENAME2).pdf

cleanall: clean cleanpdf
