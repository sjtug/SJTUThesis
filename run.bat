del diss.pdf
xelatex -no-pdf --interaction=nonstopmode diss
bibtex diss
xelatex -no-pdf --interaction=nonstopmode diss
xelatex --interaction=nonstopmode diss

