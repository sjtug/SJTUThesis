# Latexmk configuration file.

# Use xelatex with latexmk.
$pdf_mode = 5;
$postscript_mode = $dvi_mode = 0;

# Files to clean.
$clean_ext = 'bbl glo gls hd loa run.xml thm xdv';

# Process index.
$makeindex = 'makeindex -s gind.ist %O -o %D %S';

# Process glossary (change history).
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
  system("makeindex -q -s gglo.ist -o '$_[0].gls' '$_[0].glo'");
}
