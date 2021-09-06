#!/usr/bin/env texlua

module           = "sjtuthesis"

sourcefiledir    = "source"
sourcefiles      = {"sjtuthesis.dtx"}
installfiles     = {"*.cls","*.def","*.cfg","*.dtx","*.pdf"}

docfiledir       = "doc"

typesetexe       = "xelatex"
typesetfiles     = {"sjtuthesisuserguide.tex","sjtuthesis.dtx"}

bibtexexe        = "bibtex"

unpackexe        = "xetex"
unpackopts       = "--interaction=batchmode"
unpackfiles      = {"sjtuthesis.dtx"}

packtdszip       = true

-- function type_example_latexmk()
--   local file = "../"..docfiledir.."/sjtuthesisuserguide.tex"
--   local command = "latexmk -xelatex "..file
--   print("** Running: "..command)
--   errorlevel = run(unpackdir, command)
--   if errorlevel ~= 0 then
--     error("** Error!!: "..command)
--     return errorlevel
--   end
--   return 0
-- end

-- specialtypesetting = { }
-- specialtypesetting["sjtuthesisuserguide.tex"] = {func = type_example_latexmk}
