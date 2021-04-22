#!/usr/bin/env bash

set -e

# Change default package repository
export REPO=https://mirrors.rit.edu/CTAN/systems/win32/miktex

# Install MiKTeX
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
echo "deb ${REPO}/setup/deb/ $(lsb_release -cs) universe" | sudo tee /etc/apt/sources.list.d/miktex.list
sudo apt-get update -qq
sudo apt-get install -y --no-install-recommends ghostscript miktex

# Finish the setup
sudo miktexsetup finish
sudo initexmf --admin --set-config-value=[MPM]AutoInstall=1
sudo mpm --admin --set-repository=$REPO/tm/packages/
sudo mpm --admin --update-db
sudo initexmf --admin --update-fndb

# Set user-specific TEXMF root directories
export MIKTEX_USERCONFIG=$HOME/.miktex/texmfs/config
export MIKTEX_USERDATA=$HOME/.miktex/texmfs/data
export MIKTEX_USERINSTALL=$HOME/.miktex/texmfs/install

# Synchronize user-specific databases
mpm --update-db
initexmf --update-fndb

# Update MiKTeX
sudo mpm --admin --update --verbose
mpm --update --verbose
