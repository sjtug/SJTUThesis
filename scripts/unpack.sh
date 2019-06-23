#!/usr/bin/env bash

cd logos

cp sjtu-badge.pdf           ../sample
cp sjtu-logo.pdf            ../sample
cp sjtu-name.pdf            ../sample

cd -

cd source

xetex -interaction=batchmode sjtuthesis.dtx
cp sjtuthesis.cls           ../sample
cp sjtuthesis-bachelor.ltx  ../sample
cp sjtuthesis-graduate.ltx  ../sample

cd -
