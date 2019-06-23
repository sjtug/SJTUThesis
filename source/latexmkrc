# Latexmk configuration file.

# Use XeLaTeX to compile.
$pdf_mode = 5;

# Set the locale to be used for sorting.
# $biber = 'biber -l zh__pinyin %O %S';
# $biber = 'biber -l zh__stroke %O %S'; 

# Process index.
$makeindex = 'makeindex -s gind.ist %O -o %D %S';

# Process glossary (change history).
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
  system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}

# Files to clean.
$clean_ext = 'bbl hd loa run.xml thm xdv';
