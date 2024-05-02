# Latexmk configuration file.
#
#   WARNING: Only works with version 4.59 or higher of latexmk.
#

# Set timezone.
$ENV{'TZ'} = 'Asia/Shanghai';

# Prepended local directories to the search paths.
ensure_path( 'TEXINPUTS', './texmf//' );
# ensure_path( 'OSFONTDIR', './texmf/fonts//' );

# PDF generate method:
#   - 1 pdfLaTeX
#   - 3 LaTeX + DVIPDFMx
#   - 4 LuaLaTeX
#   - 5 XeLaTeX
$pdf_mode = 5;

# Add common patterns for tex engines.
set_tex_cmds( '-synctex=1 %O %S' );

# Run bibtex or biber whenever it appears necessary,
# always delete .bbl files in a cleanup.
$bibtex_use = 2;

# Use dvipdfmx to convert .dvi to .pdf, and xdvipdfmx for .xdv,
# always try to embed fonts, ignoring licensing flags, etc.
$dvipdf = 'dvipdfmx -E %O -o %D %S';
$xdvipdfmx = 'xdvipdfmx -E %O -o %D %S';

# Extra files to clean.
$clean_ext .= ' loa';
