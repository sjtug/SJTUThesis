#!/bin/bash

set -e

rm -rf build
mkdir -p build

sed -e "s|\documentclass\[.*\]|\documentclass\[type=bachelor\]|g" main.tex > build/build-bachelor.tex
sed -e "s|\documentclass\[.*\]|\documentclass\[type=master\]|g" main.tex > build/build-master.tex

echo "--- Bachelor Template ---"
head build/build-bachelor.tex

echo "--- Master Template ---"
head build/build-master.tex

latexmk $@ -outdir=build build/build-*.tex
