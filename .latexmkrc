$pdflatex = "xelatex -halt-on-error -interaction=nonstopmode %O %S";
$xelatex = "xelatex -halt-on-error -interaction=nonstopmode -no-pdf %O %S";
$pdf_mode = 1;
$dvi_mode = 0;
$postscript_mode = 0;

$clean_ext = 'bbl glo gls hd loa run.xml xdv';

$makeindex = 'makeindex -s gind.ist %O -o %D %S';
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}
