THESIS = thesis
# TEX, BIB, TEST dir
TEX_DIR = tex
BIB_DIR = bib

# Option for latexmk
LATEXMK_OPT = -xelatex -gg -silent -f

all: $(THESIS).pdf

.PHONY : all clean version release cleanall

$(THESIS).pdf : $(THESIS).tex $(TEX_DIR)/*.tex $(BIB_DIR)/*.bib *.cls *.cfg Makefile
	-latexmk $(LATEXMK_OPT) $(THESIS)

clean :
	latexmk -C
	-rm *.xdv *.bbl *.fls $(TEX_DIR)/*.xdv $(TEX_DIR)/*.aux $(TEX_DIR)/*.log $(TEX_DIR)/*.fls

cleanall : clean
	-rm -f $(THESIS).pdf

s3 : $(THESIS).pdf
	s3cmd put $< s3://sjtuthesis/README.pdf

git :
	git push gitlab
	git push github

