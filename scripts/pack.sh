#!/usr/bin/env bash

# This script is used for creating CTAN archive of sjtuthesis.

if [ "$#" -ne 5 ]; then
  echo "Usage: $0 SOURCE_DIR LOGO_DIR SAMPLE_DIR RELEASE_DIR VERSION" >&2
  exit 1
fi

JOB_NAME=sjtuthesis
WORKING_DIR=$PWD
VERSION=$5

TEMP_DIR=/tmp/$JOB_NAME

SOURCE_DIR=$WORKING_DIR/$1
LOGO_DIR=$WORKING_DIR/$2
SAMPLE_DIR=$WORKING_DIR/$3
RELEASE_DIR=$WORKING_DIR/$4
OUTPUT_DIR=$RELEASE_DIR/$JOB_NAME-$VERSION

TDS_DIR=$TEMP_DIR/TDS
CTAN_DIR=$TEMP_DIR/$JOB_NAME

SRC_DIR=$TDS_DIR/source/latex/$JOB_NAME
TEX_DIR=$TDS_DIR/tex/latex/$JOB_NAME
DOC_DIR=$TDS_DIR/doc/latex/$JOB_NAME

mkdir -p $TEMP_DIR
mkdir -p $TDS_DIR
mkdir -p $CTAN_DIR

if [ -d $RELEASE_DIR ]; then
  echo "Directory ${4} already exists"
  exit 1
else
  mkdir -p $RELEASE_DIR
fi

cp -r $SAMPLE_DIR                       $OUTPUT_DIR

mkdir -p $SRC_DIR
mkdir -p $TEX_DIR
mkdir -p $DOC_DIR

cp $SOURCE_DIR/$JOB_NAME.dtx            $TEMP_DIR/
cp $SOURCE_DIR/latexmkrc.pl             $TEMP_DIR/latexmkrc
cp $SAMPLE_DIR/thesis.tex               $TEMP_DIR/
cp $LOGO_DIR/sjtu-badge.pdf             $TEMP_DIR/
cp $LOGO_DIR/sjtu-logo.pdf              $TEMP_DIR/
cp $LOGO_DIR/sjtu-name.pdf              $TEMP_DIR/

cd $TEMP_DIR
xetex --interaction=batchmode $JOB_NAME.dtx >/dev/null
latexmk -silent $JOB_NAME.dtx     >/dev/null
latexmk -silent -c $JOB_NAME.dtx  >/dev/null

# All files should be rw-r--r--
chmod 644 $TEMP_DIR/*.*

cp $TEMP_DIR/*.dtx                      $SRC_DIR/
cp $TEMP_DIR/*.ins                      $SRC_DIR/
cp $TEMP_DIR/sjtudoc.cls                $SRC_DIR/

cp $TEMP_DIR/$JOB_NAME.cls              $TEX_DIR/
cp $TEMP_DIR/*.ltx                      $TEX_DIR/

# These files should not be put in doc/
cp $TEMP_DIR/sjtu-badge.pdf             $TEX_DIR/
cp $TEMP_DIR/sjtu-logo.pdf              $TEX_DIR/
cp $TEMP_DIR/sjtu-name.pdf              $TEX_DIR/

cp $TEMP_DIR/$JOB_NAME.pdf              $DOC_DIR/
cp $TEMP_DIR/$JOB_NAME.pdf              $RELEASE_DIR/

# Overleaf
cp $TEX_DIR/*.*                         $OUTPUT_DIR/
cp $(kpsewhich gb7714-2015.bbx)         $OUTPUT_DIR/
cp $(kpsewhich gb7714-2015.cbx)         $OUTPUT_DIR/

# Make Overleaf zip
cd $RELEASE_DIR
zip -q -r -9 $JOB_NAME-overleaf-v$VERSION.zip $JOB_NAME-$VERSION

rm $OUTPUT_DIR/gb7714-2015.*
cp $SOURCE_DIR/latexmkrc.pl             $OUTPUT_DIR/latexmkrc
cp $SOURCE_DIR/sample.mk                $OUTPUT_DIR/Makefile
cp $SOURCE_DIR/sample.bat               $OUTPUT_DIR/compile.bat

zip -q -r -9 $JOB_NAME-v$VERSION.zip    $JOB_NAME-$VERSION

# Make TDS zip
cd $TDS_DIR
zip -q -r -9 $JOB_NAME.tds.zip .

cp $TEMP_DIR/*.dtx                      $CTAN_DIR/
cp $TEMP_DIR/*.ins                      $CTAN_DIR/
cp $TEMP_DIR/*.pdf                      $CTAN_DIR/

rm $TEMP_DIR/*.*
cp $TDS_DIR/*.zip                       $TEMP_DIR/
rm -r $TDS_DIR

# Make CTAN zip
cd $TEMP_DIR
rm $TEMP_DIR/latexmkrc
zip -q -r -9 $JOB_NAME.zip .

cd $WORKING_DIR
cp -f $TEMP_DIR/*.zip                   $RELEASE_DIR/

rm -r $TEMP_DIR
rm -r $OUTPUT_DIR
