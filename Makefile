include config.mk

vpath test

# Basename of thesis
THESISMAIN = thesis
# Test file
TESTFILE = temptest
# TEX, BIB, TEST dir
TEX_DIR = tex
BIB_DIR = bib
TEST_DIR = test

# Option for latexmk
LATEXMK_OPT = -xelatex -silent -f

all: $(THESISMAIN).pdf

.PHONY : all clean version cleantest release cleanall

$(THESISMAIN).pdf : $(THESISMAIN).tex $(TEX_DIR)/*.tex $(BIB_DIR)/*.bib *.cls *.cfg Makefile
	-latexmk $(LATEXMK_OPT) $(THESISMAIN)
	
view : $(THESISMAIN).pdf 
	$(VIEWER) $< &

clean :
	latexmk -C
	-rm *.xdv *.bbl $(TEX_DIR)/*.xdv $(TEX_DIR)/*.aux $(TEX_DIR)/*.log $(TEX_DIR)/*.fls

cleanall : clean
	-rm -f $(THESISMAIN).pdf

test : $(TESTFILE).pdf

$(TESTFILE).pdf : test/$(TESTFILE).tex Makefile
	cd $(TEST_DIR) && latexmk $(LATEXMK_OPT) $(TESTFILE)

cleantest :
	cd $(TEST_DIR) && latexmk -C

release :
	@$(SED) -i "s/templateversion{v.*}/templateversion{v$(VERSION)}/g" sjtuthesis.cfg	
	@$(SED) -i "s/bachelor-.*zip/bachelor-$(VERSION).zip/g" $(TEX_DIR)/chapter01.tex
	@$(SED) -i "s/master-.*zip/master-$(VERSION).zip/g" $(TEX_DIR)/chapter01.tex
	@$(SED) -i "s/phd-.*zip/phd-$(VERSION).zip/g" $(TEX_DIR)/chapter01.tex
	cp $(THESISMAIN).pdf HOWTO.pdf
	@echo "Release $(VERSION)"

