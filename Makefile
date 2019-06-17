# Makefile for SJTUThesis

# Basename of thesis
THESIS = thesis
PACKAGE = sjtuthesis
CLSFILES = $(PACKAGE).cls $(PACKAGE)-bachelor.ltx $(PACKAGE)-graduate.ltx

# Option for latexmk
LATEXMK_OPT = -xelatex -silent -file-line-error -halt-on-error -interaction=nonstopmode
LATEXMK_OPT_PVC = $(LATEXMK_OPT_BASE) -pvc

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
	OPEN = start
else
	RM = rm -f
	OPEN = open
endif

.PHONY : all cls doc pvc validate view viewdoc wordcount cleana cleanall FORCE_MAKE

all : $(THESIS).pdf

cls : $(CLSFILES)

$(CLSFILES) : $(PACKAGE).dtx
	xetex --interaction=batchmode $<

doc : $(PACKAGE).pdf

$(PACKAGE).pdf : $(PACKAGE).dtx FORCE_MAKE
	latexmk $(LATEXMKOPTS) $<

$(THESIS).pdf : $(THESIS).tex $(CLSFILES) FORCE_MAKE
	latexmk $(LATEXMKOPTS) $<

pvc : $(THESIS).tex $(CLSFILES)
	latexmk $(LATEXMK_OPT_PVC) $(THESIS)

validate : $(THESIS).tex $(CLSFILES)
	xelatex -no-pdf -halt-on-error $(THESIS)
	biber --debug $(THESIS)

view : $(THESIS).pdf
	$(OPEN) $<

viewdoc : $(PACKAGE).pdf
	$(OPEN) $<

wordcount : $(THESIS).tex
	@if grep -v ^% $< | grep -qz '\\documentclass\[[^\[]*english'; then \
		texcount $< -inc -char-only | awk '/total/ {getline; print "英文字符数\t\t\t:",$$4}'; \
	else \
		texcount $< -inc -ch-only | awk '/total/ {getline; print "纯中文字数\t\t\t:",$$4}'; \
	fi
	@texcount $< -inc -chinese | awk '/total/ {getline; print "总字数（英文单词 + 中文字）\t:",$$4}'

clean :
	-@latexmk -c -silent $(THESIS).tex  2> /dev/null
	-@latexmk -c -silent $(PACKAGE).dtx 2> /dev/null
	-@rm -f $(TEX_DIR)/*.aux 2> /dev/null || true

cleanall :
	-@latexmk -C -silent $(THESIS).tex  2> /dev/null
	-@latexmk -C -silent $(PACKAGE).dtx 2> /dev/null
	-@rm -f $(TEX_DIR)/*.aux 2> /dev/null || true
