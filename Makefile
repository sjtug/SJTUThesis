# Makefile for sjtu-thesis-template-latex

# Basename of thesis
THESISMAIN=diss
# Test file
TESTFILE=test
# pdf viewer: evince/open
VIEWER=open


all: pdf

pdf: ${THESISMAIN}.pdf

${THESISMAIN}.pdf: ${THESISMAIN}.tex
	xelatex -no-pdf --interaction=nonstopmode ${THESISMAIN}
	-bibtex ${THESISMAIN}
	xelatex -no-pdf --interaction=nonstopmode ${THESISMAIN}
	xelatex --interaction=nonstopmode ${THESISMAIN}

view: ${THESISMAIN}.pdf
	${VIEWER} ${THESISMAIN}.pdf &

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
		body/*.aux

distclean: clean
	-@rm -f ${THESISMAIN}.pdf ${TESTFILE}.pdf

test: ${TESTFILE}.tex
	xelatex ${TESTFILE}
	${VIEWER} ${TESTFILE}.pdf

cp: ${THESISMAIN}.pdf
	-@cp ${THESISMAIN}.pdf README.pdf

