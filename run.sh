#!/bin/sh

BASE=diss

rm ${BASE}.pdf
xelatex -no-pdf --interaction=nonstopmode ${BASE}
bibtex ${BASE}
xelatex -no-pdf --interaction=nonstopmode ${BASE}
xelatex --interaction=nonstopmode ${BASE}
evince diss.pdf

