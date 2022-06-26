#!/bin/sh

# snapcraft clean
# snapcraft

sudo snap remove --purge fusion360
sudo snap install fusion360_0.9_amd64.snap --dangerous --devmode

mkdir -p "${HOME}/snap/fusion360/common/.cache/"
cp -R "${HOME}/snap/.cache/winetricks/" "${HOME}/snap/fusion360/common/.cache/"
#export XDG_CACHE_HOME="/tmp/.cache"

#export SOMMELIER_DEBUG=1 
#export WINEDEBUG=err+all

fusion360
