#! /bin/bash
# Script to update atlaslatex version from the Git master.

# Copyright (C) 2002-2021 CERN for the benefit of the ATLAS collaboration.

# Changes:
# 2018-08-14 Ian Brock (ian.brock@cern.ch): BASENAME should be set correctly if Makefile is overwritten.
# 2019-04-16 Ian Brock (ian.brock@cern.ch): Only overwrite "BASENAME = ..." and not occurences without a space (in help)
# 2020-11-21 Ian Brock (ian.brock@cern.ch): Check for use of \ATLASLATEXPATH and say atlaslatex_2020.sh should be run

# Decide how to clone atlaslatex - ssh is default
ATLASLATEXGIT=ssh://git@gitlab.cern.ch:7999/atlas-physics-office/atlaslatex.git
BRANCH=''
CLONE=1
while getopts shkcd opt; do
    case $opt in
        s)
            ATLASLATEXGIT=ssh://git@gitlab.cern.ch:7999/atlas-physics-office/atlaslatex.git
            ;;
        h)
            ATLASLATEXGIT=https://gitlab.cern.ch/atlas-physics-office/atlaslatex.git
            ;;
        k)
            ATLASLATEXGIT=https://:@gitlab.cern.ch:8443/atlas-physics-office/atlaslatex.git
            ;;
        c)
            CLONE=0
            ;;
        d)
            BRANCH=devel
            ;;
        \?)
            echo "$0 [-h] [-k] [-s]"
            echo "  -h use https GitLab link"
            echo "  -k use krb5 GitLab link"
            echo "  -s use ssh GitLab link"
            echo "  -d use devel branch instead of master"
            exit 1
            ;;
    esac
done

# Check we are in the right directory
DIR=$(basename ${PWD})
if [ -e ${DIR}.tex ]; then
    echo "We are in directory ${PWD}"
else
    echo "We do not appear to be in the main directory: ${PWD}"
    echo "There should be a tex file with the same name as the directory"
    exit 1
fi

# Remove temporary directory if it exists
test -d tmp-atlaslatex && rm -r tmp-atlaslatex

# Clone OR copythe ATLAS LaTeX Git repository.
if [ ${CLONE} == 1 ]; then
    # Switch to devel branch for testing
    if [ -n "${BRANCH}" ]; then
        git clone ${ATLASLATEXGIT} tmp-atlaslatex
        cd tmp-atlaslatex 
        git checkout devel
        cd ..
    else
        git clone --depth 1 ${ATLASLATEXGIT} tmp-atlaslatex
    fi
else
    cp -r ${HOME}/atlas/LaTeX/atlaslatex tmp-atlaslatex
fi
function cf_files {
    # echo "Compare ${afile} with ${lfile}"
    cmp --silent "$1" "$2"
    cmpStatus=$?
    # echo "cmp status is $cmpStatus" 
    extension="${1##*.}"
    # echo "File $1, Extension $extension"
    if [ $cmpStatus -eq 0 ]; then
        echo "No change to file $1"
    else
        echo "Running diff on $1 vs $2"
        diff "$1" "$2"
        echo "Will try to copy $2 to $1"
        cp -i "$2" "$1"
        # Make sure file is executable
        if [ ${extension} == "sh" ]; then
            echo "Making $1 executable"
            chmod u+x $1
        fi
    fi
}

# Self-update scripts first
test -d scripts || mkdir scripts
scriptupdate=0
for lfile in scripts/atlaslatex_update.sh scripts/atlaslatex_2020.sh; do
    afile=tmp-atlaslatex/scripts/$(basename $lfile)
    if [ -e ${lfile} ]; then
        cmp --silent ${lfile} ${afile}; cmpStatus=$?
        echo "Comparing ${lfile} with ${afile}"
        # echo "Status is ${cmpStatus}"
        if [ $cmpStatus -eq 0 ]; then
            echo "No change to file ${lfile}"
        else
            scriptupdate=1
            cf_files "${lfile}" "${afile}"
            echo "+++ ${lfile} updated. You should now run ${lfile}"
        fi
    else
        scriptupdate=1
        cp ${afile} ${lfile}
        # Make sure file is exectuable
        chmod u+x ${lfile}
        echo "+++ ${lfile} updated. You should now run ${lfile}"
    fi
done
if [ $scriptupdate -eq 1 ]; then
    # Remove temporary directory
    rm -rf tmp-atlaslatex
    exit 1
fi

# Class and style files
for lfile in latex/*.cls latex/*.sty; do
    afile=tmp-atlaslatex/latex/$(basename $lfile)
    cf_files "${lfile}" "${afile}"
done

# atlaslatexpath.sty should be there
if [ -e latex/atlaslatexpath.sty ]; then
    lfile=latex/atlaslatexpath.sty
    afile=tmp-atlaslatex/latex/atlaslatexpath.sty
    cf_files "${lfile}" "${afile}"
else
    echo "Copying atlaslatexpath.sty to latex directory"
    cp tmp-atlaslatex/latex/atlaslatexpath.sty latex/
fi

# Bibliography files
for lfile in bib/*.bib; do
    afile=tmp-atlaslatex/bib/$(basename $lfile)
    cf_files "${lfile}" "${afile}"
done

# Logos
for lfile in logos/*; do
    afile=tmp-atlaslatex/logos/$(basename $lfile)
    cf_files "${lfile}" "${afile}"
done

# Makefile
for lfile in Makefile; do
    BASENAME=$(grep '^BASENAME.*=' ${lfile})
    echo "BASENAME definition is: <$BASENAME>"
    afile=tmp-atlaslatex/$(basename $lfile)
    cf_files "${lfile}" "${afile}"
    # Assume definition of BASENAME is of the form BASENAME =
    echo "Replacing BASENAME definition with <${BASENAME}> in ${lfile}"
    sed -i '.bak' -e "s/^BASENAME =.*/${BASENAME}/" ${lfile}
    # The folllowing should only change the first occurence of BASENAME =..., but has not been tested everywhere
    # sed -i '.bak' -e "0,/${BASENAME}/ s/BASENAME[ \t]+=.*/${BASENAME}/" ${lfile}
done

# Acknowledgements - if the directory exists
if [ -d acknowledgements ]; then
    for lfile in acknowledgements/*.tex acknowledgements/*.bib; do
        afile=tmp-atlaslatex/acknowledgements/$(basename $lfile)
        cf_files "${lfile}" "${afile}"
    done
fi

# Remove temporary directory
rm -rf tmp-atlaslatex

# 2020-11-21 ATLASLATEXPATH should no longer be used
mfile=${DIR}.tex
if [ $(grep -c ATLASLATEXPATH ${DIR}.tex) -gt 0 ]; then
    echo "*** IMPORTANT ***"
    echo "*** If you have not already done so, please run scripts/atlaslatex_2020.sh."
    echo "*** This adapts your main tex file to avoid problems with TeX Live 2020."
    echo "*** It replaces the use of \ATLASLATEXPATH with a style file latex/atlaslatexpath.sty."
    echo "*** IMPORTANT ***"
fi
