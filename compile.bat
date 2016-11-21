@echo off
del thesis.pdf >nul 2>nul
if exist thesis.pdf (
	echo Close the file: thesis.pdf!!!
	echo Or use Sumatra to open thesis.pdf
	pause
	exit
)

echo Compile...
echo xelatex -no-pdf thesis...
xelatex -no-pdf thesis 1> nul
echo biber --debug thesis...
biber --debug thesis 1> nul
echo xelatex thesis...
xelatex thesis 1> nul
xelatex thesis 1> nul
echo clean files...
del *.aux *.run.xml *.bcf *.log *.xdv *.bbl *.bak *.blg *.out *.thm *.toc *.synctex* *.glg *.glo *.gls *.ist *.idx *.ilg *.ind *.acn *.acr *.lof *.lot *.loa *.alg *.glsdefs >nul 2>nul
cd tex
del *.aux *.run.xml *.bcf *.log *.xdv *.bbl *.bak *.blg *.out *.thm *.toc *.synctex* *.glg *.glo *.gls *.ist *.idx *.ilg *.ind *.acn *.acr *.lof *.lot *.loa *.alg *.glsdefs >nul 2>nul
echo finish...
pause
