THESIS = thesis
# TEX, BIB, TEST dir
TEX_DIR = tex
BIB_DIR = bib

# Option for latexmk
LATEXMK_OPT_BASE = -xelatex -gg -silent
LATEXMK_OPT = $(LATEXMK_OPT_BASE) -f
LATEXMK_OPT_PVC = $(LATEXMK_OPT_BASE) -pvc

all: $(THESIS).pdf

.PHONY : all clean pvc view wordcount git zip

$(THESIS).pdf : $(THESIS).tex $(TEX_DIR)/*.tex $(BIB_DIR)/*.bib sjtuthesis.cls sjtuthesis.cfg Makefile
	-latexmk $(LATEXMK_OPT) $(THESIS)

pvc :
	latexmk $(LATEXMK_OPT_PVC) $(THESIS)

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
	-@rm -f *.xdv *.bbl *.fls $(TEX_DIR)/*.xdv $(TEX_DIR)/*.aux $(TEX_DIR)/*.log $(TEX_DIR)/*.fls _tmp_.pdf *.xml 2> /dev/null || true

s3 : $(THESIS).pdf
	s3cmd put $< s3://sjtuthesis/README.pdf

git :
	for b in "0.7.x" "0.8.x" "develop" "develop-0.7" "develop-0.8"; do git co $${b}; git pull gitlab $${b}; done
	for b in "0.7.x" "0.8.x" "develop" "develop-0.7" "develop-0.8"; do git co $${b}; git push --tags -f -u gitlab $${b}; git push --tags -f -u github $${b}; git push -f -u gitcafe $${b}; done
	git co master; git push gitlab master; git push github master; git push gitcafe master

zip :
	git archive --format zip --output thesis.zip master
