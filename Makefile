BASE = diss
PDFREADER = evince

all: pdf

pdf: ${BASE}.pdf

${BASE}.pdf: ${BASE}.tex
	# xelatex -no-pdf --interaction=nonstopmode ${BASE}
	# bibtex ${BASE}
	# xelatex -no-pdf --interaction=nonstopmode ${BASE}
	# xelatex --interaction=nonstopmode ${BASE}

view: ${BASE}.pdf
	$PDFREADER ${BASE}.pdf&

tar: ${BASE}.pdf

# TARSOURCE = *.tex *.pdf *.bst *.cfg *.cls Makefile body
# figures reference

# ${BASE}.tar: ${TARSOURCE}
#      tar jcf ${BASE}.tar.bz2 ${TARSOURCE}

clean:
	find ./ -iname '*.aux' | xargs rm
	find ./ -iname '*.log' | xargs rm
	find ./ -iname '*.lot' | xargs rm
	find ./ -iname '*.out' | xargs rm
	find ./ -iname '*.toc' | xargs rm
	find ./ -iname '*.blg' | xargs rm
	find ./ -iname '*.bbl' | xargs rm
	find ./ -iname '*.lof' | xargs rm
	find ./ -iname '*.xdv' | xargs rm
	rm ${BASE}.xdv ${BASE}.pdf
# cleantex
# if [ -e ${BASE}.xdv ]; then rm ${BASE}.xdv; fi
# cd body && cleantex && cd ..

distclean: clean
	if [ -e ${BASE}.pdf ]; then rm ${BASE}.pdf; fi

