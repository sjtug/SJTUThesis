THESIS = thesis
SUBMIT = submit
# TEX, BIB, TEST dir
TEX_DIR = tex
BIB_DIR = bib

# Option for latexmk
LATEXMK_OPT = -xelatex -gg -silent -f

all: $(THESIS).pdf $(SUBMIT).pdf

.PHONY : all clean validate

$(THESIS).pdf : $(THESIS).tex $(TEX_DIR)/*.tex $(BIB_DIR)/*.bib sjtuthesis.cls sjtuthesis.cfg Makefile
	-latexmk $(LATEXMK_OPT) $(THESIS)

$(SUBMIT).pdf : $(THESIS).pdf statement.pdf
	rm -f _tmp_.pdf $@
	stapler sel $(THESIS).pdf 1-4 statement.pdf _tmp_.pdf
	stapler sel _tmp_.pdf $(THESIS).pdf 6-end $@

clean :
	latexmk -C
	-rm *.xdv *.bbl *.fls $(TEX_DIR)/*.xdv $(TEX_DIR)/*.aux $(TEX_DIR)/*.log $(TEX_DIR)/*.fls _tmp_.pdf *.xml

s3 : $(THESIS).pdf
	s3cmd put $< s3://sjtuthesis/README.pdf

git :
	git push gitlab
	git push github

