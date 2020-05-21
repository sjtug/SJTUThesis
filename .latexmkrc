# Latexmk configuration file.

# Set environment variables.
$ENV{'TZ'}='Asia/Shanghai';

if ( $^O =~ /MSWin32/ ) {
  $ENV{'TEXINPUTS'}='./texmf//;' . $ENV{'TEXINPUTS'};
} else {
  $ENV{'TEXINPUTS'}='./texmf//:' . $ENV{'TEXINPUTS'}; 
};

# Use xelatex with latexmk.
$pdf_mode = 5;
$postscript_mode = $dvi_mode = 0;

# Always try to embed fonts, ignoring licensing flags, etc.
$xdvipdfmx = 'xdvipdfmx -E -o %D %O %S';

# Files to clean.
$clean_ext = 'bbl glo gls hd loa run.xml thm xdv';
