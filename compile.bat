chcp 65001
set Path=%Path%;C:\TexLive\2017\bin\win32;
del thesis.pdf >nul 2>nul
if exist thesis.pdf (
	echo Close the file: thesis.pdf!!!
	echo Or use Sumatra to open thesis.pdf
	pause
	exit
)

echo Compile...
latexmk -xelatex -gg  thesis.tex & latexmk -c
del *.aux *.run.xml *.bcf *.log *.xdv *.bbl *.bak *.blg *.out *.thm *.toc *.synctex* *.glg *.glo *.gls *.ist *.idx *.ilg *.ind *.acn *.acr *.lof *.lot *.loa *.alg *.glsdefs >nul 2>nul
cd tex
del *.aux *.run.xml *.bcf *.log *.xdv *.bbl *.bak *.blg *.out *.thm *.toc *.synctex* *.glg *.glo *.gls *.ist *.idx *.ilg *.ind *.acn *.acr *.lof *.lot *.loa *.alg *.glsdefs >nul 2>nul
echo finish...
pause
