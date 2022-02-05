#!/bin/bash
set -e

SJTUTEX_DIR="SJTUTeX-v1"

if [ ! -d "${SJTUTEX_DIR}" ]; then
    git clone https://github.com/sjtug/SJTUTeX -b v1 ${SJTUTEX_DIR}
fi

cd ${SJTUTEX_DIR}/source
xetex -interaction=nonstopmode sjtuthesis.ins
cd ../../

rm -rf texmf/tex/latex/sjtuthesis
mkdir texmf/tex/latex/sjtuthesis

RELEASE_DIR="texmf/tex/latex/sjtuthesis"

cp ${SJTUTEX_DIR}/source/sjtuthesis.cls ${RELEASE_DIR}
cp ${SJTUTEX_DIR}/source/sjtuthesis-graduate.ltx ${RELEASE_DIR}
cp ${SJTUTEX_DIR}/source/sjtuthesis-undergraduate.ltx ${RELEASE_DIR}
cp -a ${SJTUTEX_DIR}/vi ${RELEASE_DIR}
mkdir -p ${RELEASE_DIR}/fd
cp ${SJTUTEX_DIR}/source/*-font-*.def ${RELEASE_DIR}/fd

make main.pdf
