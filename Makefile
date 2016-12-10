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
	-git co master; git push --tags gitlab master; git push --tags github master
	-for b in "dev" "0.7-dev" "0.8-dev"; do git co $${b}; git push -f -u gitlab $${b}; git push -f -u github $${b}; done
	-for b in "0.7.x" "0.8.x"; do git br -D $${b}; done

zip :
	git archive --format zip --output thesis.zip master
