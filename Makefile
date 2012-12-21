# Makefile for sjtu-thesis-template-latex

# SED tool
SED := gsed
# Basename of thesis
THESISMAIN := diss
# Test file
TESTFILE := test
# pdf viewer: evince/open
VIEWER := open


all: pdf

pdf: $(THESISMAIN).pdf

$(THESISMAIN).pdf: $(THESISMAIN).tex body/*.tex *.cls *.cfg
	xelatex -no-pdf --interaction=nonstopmode $(THESISMAIN)
	-bibtex $(THESISMAIN)
	xelatex -no-pdf --interaction=nonstopmode $(THESISMAIN)
	xelatex --interaction=nonstopmode $(THESISMAIN)

view: $(THESISMAIN).pdf 
	$(VIEWER) $(THESISMAIN).pdf &

clean:
	-@rm -f \
		*~ \
		*.aux \
		*.bak \
		*.bbl \
		*.blg \
		*.dvi \
		*.xdv \
		*.glo \
		*.gls \
		*.idx \
		*.ilg \
		*.ind \
		*.ist \
		*.log \
		*.out \
		*.ps \
		*.thm \
		*.toc \
		*.lof \
		*.lot \
		*.loe \
		*_latexmk \
		body/*.aux \
		body/x.log 

distclean: clean
	-@rm -f $(THESISMAIN).pdf

test: $(TESTFILE).tex
	xelatex $(TESTFILE)
	$(VIEWER) $(TESTFILE).pdf

cp: $(THESISMAIN).pdf
	-@cp $(THESISMAIN).pdf README.pdf

release: diss.tex body/*.tex  # make version=0.5.1 release
	$(SED) -i "s/templateversion{v.*)/templateversion{v$(version))/g" sjtuthesis.cfg	
	$(SED) -i "s/bachelor-.*zip/bachelor-$(version).zip/g" body/chapter01.tex
	$(SED) -i "s/master-.*zip/master-$(version).zip/g" body/chapter01.tex
	$(SED) -i "s/phd-.*zip/phd-$(version).zip/g" body/chapter01.tex


