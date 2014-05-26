VERSION := 0.5.3

vpath test

# Basename of thesis
THESIS = thesis
# Test file
TESTFILE = temptest
# TEX, BIB, TEST dir
TEX_DIR = tex
BIB_DIR = bib
TEST_DIR = test

# Option for latexmk
LATEXMK_OPT = -xelatex -gg -silent -f

all: $(THESIS).pdf

.PHONY : all clean version cleantest release cleanall

$(THESIS).pdf : $(THESIS).tex $(TEX_DIR)/*.tex $(BIB_DIR)/*.bib *.cls *.cfg Makefile
	-latexmk $(LATEXMK_OPT) $~

clean :
	latexmk -C
	-rm *.xdv *.bbl $(TEX_DIR)/*.xdv $(TEX_DIR)/*.aux $(TEX_DIR)/*.log $(TEX_DIR)/*.fls

cleanall : clean
	-rm -f $(THESIS).pdf

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
	cp $(THESIS).pdf HOWTO.pdf
	@echo "Release $(VERSION)"

git :
	git push gitlab
	git push github

