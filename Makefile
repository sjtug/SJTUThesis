vpath %.tex tex
vpath %.mkd mkd

THESIS = thesis
SUBMIT = submit
# TEX, BIB, TEST dir
MKD_DIR = mkd
MKD_FILES = $(shell cd $(MKD_DIR) && ls *.mkd)
TEX_DIR = tex
TEX_FILES = $(MKD_FILES:%.mkd=%.tex)
BIB_DIR = bib

# Option for latexmk
LATEXMK_OPT = -xelatex -gg -silent -f
T2M_OPT = --parse-raw --no-tex-ligatures -f latex -t markdown 
M2T_OPT = --chapters --parse-raw --no-tex-ligatures -f markdown -t latex

all: $(THESIS).pdf $(SUBMIT).pdf

.PHONY : all clean tex2mkd

$(THESIS).pdf : $(THESIS).tex $(TEX_FILES) $(BIB_DIR)/*.bib sjtuthesis.cls sjtuthesis.cfg Makefile
	-latexmk $(LATEXMK_OPT) $(THESIS)
	
%.tex : %.mkd Makefile
	pandoc $(M2T_OPT) $< -o tex/$@

mkd2tex : $(MKD_FILES) $(TEX_FILES)

tex2mkd :
	cd $(TEX_DIR) && for texfile in `ls *.tex`; do f=$$(basename $$texfile .tex) && pandoc $(T2M_OPT) $$f.tex -o ../mkd/$$f.mkd; done

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

