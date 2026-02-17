#! /bin/bash
# Script to adjust atlaslatex documents to use atlaslatexpath style file.

# Copyright (C) 2002-2021 CERN for the benefit of the ATLAS collaboration.

# Changes:
# 2020-11-23 Ian Brock (ian.brock@cern.ch): First version to get round TeX Live 2020 problem with directories in \usepackage etc.

function cf_files {
    # echo "Compare ${afile} with ${lfile}"
    cmp --silent "$1" "$2"
    cmpStatus=$?
    # echo "cmp status is $cmpStatus" 
    if [ $cmpStatus -eq 0 ]; then
        echo "No change to file $1"
    else
        echo "Running diff on $1 vs $2"
        diff "$1" "$2"
        echo "Will try to copy $2 to $1"
        cp -i "$2" "$1"
    fi
}

DIR=`basename ${PWD}`
echo $DIR

# Check we are in the right directory
if [ -e ${DIR}.tex ]; then
    echo "We are in directory ${PWD}"
else
    echo "We do not appear to be in the main directory: ${PWD}"
    echo "There should be a tex file with the same name as the directory"
    exit 1
fi

# Save a copy of the main file
for lfile in ${DIR}.tex; do
    npath=$(grep -c ATLASLATEXPATH ${lfile})
    echo "ATLASLATEXPATH occurs ${npath} times in ${lfile}"
    if [ $npath -le 0 ]; then
        echo "\\ATLASSLATEXPATH not used - no changes needed"
        exit 0
    fi
    cp ${DIR}.tex ${DIR}.tex.bak
    bfile=${DIR}.tex.bak 
    ATLASLATEXPATHDEF=$(grep -E '^\\newcommand\*\{\\ATLASLATEXPATH\}' ${bfile})
    echo "ATLASLATEXPATH definition: ${ATLASLATEXPATHDEF}"
    if [ -n ${ATLASLATEXPATHDEF} ]; then
        sed -E 's|^\\newcommand\*\{\\ATLASLATEXPATH\}.*|\\RequirePackage\{latex/atlaslatexpath\}|' ${bfile} >${lfile}.tmp1
    else
        echo "ATLASLATEXPATH definition not found in ${lfile}"
        exit 1
    fi        
    sed -E 's|\\ATLASLATEXPATH ||' ${lfile}.tmp1 >${lfile}.tmp2
done

# Old and new main file
for mfile in ${DIR}.tex; do
    ofile=${DIR}.tex
    tfile=${DIR}.tex.tmp2
    cf_files "${ofile}" "${tfile}"
done

# Clean up temporary files
test -e ${lfile}.tmp1 && rm ${lfile}.tmp1
test -e ${lfile}.tmp2 && rm ${lfile}.tmp2
