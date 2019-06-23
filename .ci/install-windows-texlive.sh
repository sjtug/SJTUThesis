#!/usr/bin/env bash

# Change default package repository
export REPO=https://mirrors.rit.edu/CTAN/systems/texlive/tlnet

# See if there is a cached version of TL available
export PATH=/c/texlive/bin/win32:$PATH
if ! command -v texlua.exe > /dev/null; then
  # Obtain TeX Live
  curl -L $REPO/install-tl.zip > install-tl.zip
  unzip -q install-tl.zip
  cd install-tl-20*

  # See if there is a cached version of TL available
  echo | ./install-tl-windows.bat --profile ../.ci/texlive-windows.profile --repository $REPO
  cd ..
fi

# Packages
echo | tlmgr.bat install      \
  algorithmicx                \
  algorithms                  \
  anyfontsize                 \
  biber                       \
  biblatex                    \
  biblatex-gb7714-2015        \
  booktabs                    \
  boondox                     \
  caption                     \
  cjk                         \
  collection-fontsrecommended \
  ctex                        \
  enumitem                    \
  environ                     \
  eso-pic                     \
  etoolbox                    \
  fandol                      \
  float                       \
  fontaxes                    \
  fontspec                    \
  footmisc                    \
  kastrup                     \
  l3kernel                    \
  l3packages                  \
  latexmk                     \
  listings                    \
  logreq                      \
  mathtools                   \
  ms                          \
  multirow                    \
  newtx                       \
  ntheorem                    \
  pageslts                    \
  pdfpages                    \
  pgf                         \
  siunitx                     \
  sourcecodepro               \
  tex-gyre                    \
  threeparttable              \
  tocloft                     \
  translator                  \
  trimspaces                  \
  ulem                        \
  undolabl                    \
  was                         \
  xcolor                      \
  xecjk                       \
  xetex                       \
  xkeyval                     \
  xstring                     \
  zhnumber

# Keep no backups (not required, simply makes cache bigger)
echo | tlmgr.bat option -- autobackup 0

# Update the TL install but add nothing new
echo | tlmgr.bat update --self --all --no-auto-install
