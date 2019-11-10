# Makefile for SJTUThesis

# Basename of thesis
THESIS = thesis

# Option for latexmk
LATEXMK_OPT = -xelatex -quiet -file-line-error -halt-on-error -interaction=nonstopmode
LATEXMK_OPT_PVC = $(LATEXMK_OPT_BASE) -pvc

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
	OPEN = start
else
	RM = rm -f
	OPEN = open
endif

.PHONY : all pvc view wordcount clean cleanall FORCE_MAKE

all : $(THESIS).pdf

$(THESIS).pdf : $(THESIS).tex FORCE_MAKE
	@latexmk $(LATEXMK_OPT) $<

pvc : $(THESIS).tex
	@latexmk $(LATEXMK_OPT_PVC) $(THESIS)

view : $(THESIS).pdf
	$(OPEN) $<

wordcount : $(THESIS).tex
	@if grep -v ^% $< | grep -qz '\\documentclass\[[^\[]*english'; then \
		texcount $< -inc -char-only | awk '/total/ {getline; print "英文字符数\t\t\t:",$$4}'; \
	else \
		texcount $< -inc -ch-only | awk '/total/ {getline; print "纯中文字数\t\t\t:",$$4}'; \
	fi
	@texcount $< -inc -chinese | awk '/total/ {getline; print "总字数（英文单词 + 中文字）\t:",$$4}'

clean :
	-@latexmk -c -silent $(THESIS).tex 2> /dev/null
	-@rm -f $(TEX_DIR)/*.aux 2> /dev/null || true

cleanall :
	-@latexmk -C -silent $(THESIS).tex 2> /dev/null
	-@rm -f $(TEX_DIR)/*.aux 2> /dev/null || true
