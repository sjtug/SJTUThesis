#!/usr/bin/env texlua

module           = "sjtuthesis"

sourcefiledir    = "source"
sourcefiles      = {"sjtuthesis.dtx"}
installfiles     = {"*.sty"}

-- docfiledir       = "doc"

typesetexe       = "xelatex"
bibtexexe        = "bibtex"

unpackexe        = "xetex"
unpackopts       = "--interaction=batchmode"
unpackfiles      = {"sjtuthesis.dtx"}
