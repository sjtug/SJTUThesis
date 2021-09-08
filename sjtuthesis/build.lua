#!/usr/bin/env texlua

module           = "sjtuthesis"

sourcefiledir    = "source"
sourcefiles      = {"sjtuthesis.dtx"}
installfiles     = {"*.cls","*.def","*.cfg","*.dtx","*.pdf"}

docfiledir       = "doc"

typesetexe       = "xelatex"
typesetfiles     = {"sample-*.tex","sjtuthesis.dtx"}
bibtexexe        = "bibtex"

unpackexe        = "xetex"
unpackfiles      = {"sjtuthesis.dtx"}

packtdszip       = true
