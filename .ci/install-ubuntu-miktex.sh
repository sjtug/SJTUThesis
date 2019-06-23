#!/usr/bin/env bash

# Change default package repository
export REPO=https://mirrors.rit.edu/CTAN/systems/win32/miktex

# Install MiKTeX
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
echo "deb ${REPO}/setup/deb/ xenial universe" | sudo tee /etc/apt/sources.list.d/miktex.list
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

# Install MiKTeX packages
mpm --set-repository=$REPO/tm/packages/
mpm --verbose --install boondox

# Update MiKTeX
mpm --update --verbose

# Refresh the whole file name database again
initexmf --update-fndb --verbose
