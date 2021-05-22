# Latexmk configuration file.

# Set environment variables.

# Set timezone.
$ENV{'TZ'}='Asia/Shanghai';

# Ensure './texmf//' is in '$TEXINPUTS'.
ensure_path( 'TEXINPUTS', './texmf//' );

# Use lualatex with latexmk.
# $pdf_mode = 4;
# Use xelatex with latexmk.
$pdf_mode = 5;
$postscript_mode = $dvi_mode = 0;

# Always try to embed fonts, ignoring licensing flags, etc.
$xdvipdfmx = 'xdvipdfmx -E -o %D %O %S';

# Files to clean.
$clean_ext = 'bbl glo gls hd loa run.xml thm xdv';
