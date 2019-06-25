# Makefile for SJTUThesis

PACKAGE = sjtuthesis

SOURCE_DIR = source
LOGO_DIR = logos
RELEASE_DIR = release
SAMPLE_DIR = sample
THESIS = thesis

SOURCE = $(SOURCE_DIR)/$(PACKAGE).dtx
SCRIPTS = $(SOURCE_DIR)/latexmkrc.pl $(SOURCE_DIR)/sample.bat $(SOURCE_DIR)/sample.mk
LOGOS = $(LOGO_DIR)/sjtu-badge.pdf $(LOGO_DIR)/sjtu-logo.pdf $(LOGO_DIR)/sjtu-name.pdf

VERSION = $(shell git describe --tags)
TEXMF = $(shell kpsewhich --var-value TEXMFHOME)

TDS_ARCHIVE = $(RELEASE_DIR)/$(PACKAGE).tds.zip
PACK = scripts/pack.sh

.PHONY : all install

all : $(TDS_ARCHIVE)

$(TDS_ARCHIVE) : $(PACK) $(SOURCE) $(SCRIPTS) $(LOGOS)
	@$(PACK) $(SOURCE_DIR) $(LOGO_DIR) $(SAMPLE_DIR) $(RELEASE_DIR) $(VERSION)

install : $(TDS_ARCHIVE)
	unzip -o -q $(TDS_ARCHIVE) -d $(TEXMF)/
