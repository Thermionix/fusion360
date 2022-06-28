#!/bin/sh

snapcraft clean content
snapcraft

sudo snap remove --purge fusion360
sudo snap install fusion360_1.0_amd64.snap --dangerous --devmode

mkdir -p "${HOME}/snap/fusion360/common/.cache/"
cp -R "${HOME}/snap/.cache/winetricks/" "${HOME}/snap/fusion360/common/.cache/"
#export XDG_CACHE_HOME="/tmp/.cache"

#export SOMMELIER_DEBUG=1 
#export WINEDEBUG=err+all

# snap run --shell fusion360 -c 'env' | grep XDG
# fusion360.dxvk-setup
# fusion360.updater
