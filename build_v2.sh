#!/bin/bash

set -e

SJTUTEX_DIR="SJTUTeX-v2"

if [ ! -d "${SJTUTEX_DIR}" ]; then
    git clone https://github.com/sjtug/SJTUTeX -b v2 ${SJTUTEX_DIR}
fi

cd ${SJTUTEX_DIR} && make generate && cd ..
rm -rf texmf/tex/latex/sjtuthesis
ln -s $(pwd)/${SJTUTEX_DIR}/sjtuthesis/build/unpacked texmf/tex/latex/sjtuthesis

latexmk dev-v2.tex -xelatex -time -file-line-error -halt-on-error -interaction=nonstopmode
