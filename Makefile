THESIS = thesis
# TEX, BIB, TEST dir
TEX_DIR = tex
BIB_DIR = bib

# Option for latexmk
LATEXMK_OPT = -xelatex -gg -silent -f

all: $(THESIS).pdf

.PHONY : all clean validate view wordcount

$(THESIS).pdf : $(THESIS).tex $(TEX_DIR)/*.tex $(BIB_DIR)/*.bib sjtuthesis.cls sjtuthesis.cfg Makefile
	-latexmk $(LATEXMK_OPT) $(THESIS)

validate :
	xelatex -no-pdf -halt-on-error $(THESIS)
	biber --debug $(THESIS)

view : $(THESIS).pdf
	open $<

wordcount:
	@perl texcount.pl $(THESIS).tex -inc          | awk '/total/ {getline; print "词数    :",$$4}' 
	@perl texcount.pl $(THESIS).tex -inc -char    | awk '/total/ {getline; print "字符数  :",$$4}' 
	@perl texcount.pl $(THESIS).tex -inc -ch-only | awk '/total/ {getline; print "中文字数:",$$4}' 

clean :
	latexmk -C
	-rm *.xdv *.bbl *.fls $(TEX_DIR)/*.xdv $(TEX_DIR)/*.aux $(TEX_DIR)/*.log $(TEX_DIR)/*.fls _tmp_.pdf *.xml

s3 : $(THESIS).pdf
	s3cmd put $< s3://sjtuthesis/README.pdf

git :
	git push gitlab
	git push github
	git push gitcafe

