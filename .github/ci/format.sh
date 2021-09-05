#!/bin/bash

set -e

git ls-files | grep .tex$ | xargs -n1 latexindent -w $@
