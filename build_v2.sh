#!/bin/bash

set -e

# Before running this script, clone v2 of SJTUTeX into project root

cd SJTUTeX && make generate && cd ..
rm -rf texmf/tex/latex/sjtuthesis
ln -s $(pwd)/SJTUTeX/sjtuthesis/build/unpacked texmf/tex/latex/sjtuthesis
make
