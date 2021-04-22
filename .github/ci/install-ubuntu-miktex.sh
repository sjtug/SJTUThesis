#!/usr/bin/env bash

set -e

# Change default package repository
export REPO=https://www.ctan.org/tex-archive/systems/win32/miktex

# Install MiKTeX
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
echo "deb http://miktex.org/download/ubuntu focal universe" | sudo tee /etc/apt/sources.list.d/miktex.list
sudo apt-get update -qq
sudo apt-get install -y --no-install-recommends ghostscript miktex

sudo miktexsetup finish
sudo initexmf --admin --set-config-value=[MPM]AutoInstall=1
sudo mpm --admin --update-db
sudo initexmf --admin --update-fndb

export MIKTEX_USERCONFIG=$HOME/.miktex/texmfs/config
export MIKTEX_USERDATA=$HOME/.miktex/texmfs/data
export MIKTEX_USERINSTALL=$HOME/.miktex/texmfs/install

# Refresh the whole file name database
initexmf --update-fndb --verbose

# Update MiKTeX
mpm --set-repository=$REPO/tm/packages/
mpm --update --verbose

# Refresh the whole file name database again
initexmf --update-fndb --verbose
