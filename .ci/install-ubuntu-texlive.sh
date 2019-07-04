#!/usr/bin/env bash

# Change default package repository
export REPO=https://mirrors.rit.edu/CTAN/systems/texlive/tlnet

# See if there is a cached version of TeX Live available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget $REPO/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile ../.ci/texlive-ubuntu.profile --repository $REPO
  cd ..
fi

# Install TeX Live packages
tlmgr install           \
  algorithm2e           \
  anyfontsize           \
  biber                 \
  biblatex              \
  biblatex-gb7714-2015  \
  booktabs              \
  boondox               \
  caption               \
  cjk                   \
  ctex                  \
  enumitem              \
  environ               \
  eso-pic               \
  etoolbox              \
  fandol                \
  fontaxes              \
  fontspec              \
  footmisc              \
  ifoddpage             \
  kastrup               \
  l3backend             \
  l3kernel              \
  l3packages            \
  latexmk               \
  listings              \
  lm                    \
  logreq                \
  mathtools             \
  ms                    \
  multirow              \
  newtx                 \
  ntheorem              \
  pageslts              \
  pdfpages              \
  pgf                   \
  relsize               \
  siunitx               \
  sourcecodepro         \
  tex-gyre              \
  threeparttable        \
  times                 \
  tocloft               \
  translator            \
  trimspaces            \
  txfonts               \
  ulem                  \
  undolabl              \
  was                   \
  xcolor                \
  xecjk                 \
  xetex                 \
  xkeyval               \
  xstring               \
  zapfding              \
  zhnumber

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0

# Update TeX Live install but add nothing new
tlmgr update --self --all --no-auto-install
