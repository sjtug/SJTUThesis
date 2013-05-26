# Makefile for sjtu-thesis-template-latex

# SED tool
SED = gsed
# Basename of thesis
THESISMAIN = diss
# Test file
TESTFILE = temptest
# pdf viewer: evince/open
VIEWER = open
# version number, which can be specified when calling make like
# make VERSION="0.5.2"
VERSION = 0.5.3

all: $(THESISMAIN).pdf

.PHONY : all clean version distclean cleantest release

$(THESISMAIN).pdf : $(THESISMAIN).tex body/*.tex reference/*.bib *.cls *.cfg
	-latexmk -silent -f -pdf $(THESISMAIN)
	
view : $(THESISMAIN).pdf 
	$(VIEWER) $< &

clean :
	latexmk -C

distclean : clean
	-@rm -f $(THESISMAIN).pdf

test : $(TESTFILE).pdf

$(TESTFILE).pdf : $(TESTFILE).tex
	latexmk -silent -pdf $(TESTFILE) > /dev/null
	$(VIEWER) $@

cleantest :
	-@rm $(TESTFILE).pdf

cp : $(THESISMAIN).pdf
	-@cp -f $< README.pdf

version :
	$(SED) -i "s/templateversion{v.*}/templateversion{v$(VERSION)}/g" sjtuthesis.cfg	
	$(SED) -i "s/bachelor-.*zip/bachelor-$(VERSION).zip/g" body/chapter01.tex
	$(SED) -i "s/master-.*zip/master-$(VERSION).zip/g" body/chapter01.tex
	$(SED) -i "s/phd-.*zip/phd-$(VERSION).zip/g" body/chapter01.tex

release : clean version all cp
	@echo "OK. Release version $(VERSION)."
