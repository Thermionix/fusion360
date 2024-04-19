#!/bin/sh

##arch-linux snapcraft setup##
# yay -S snapd
# sudo systemctl enable --now snapd.socket
# sudo ln -s /var/lib/snapd/snap /snap
# sudo snap install snapcraft --classic
# sudo snap install lxd --classic
# sudo usermod -aG lxd `whoami`
#### reboot to group change, don't build using sudo
# lxd init --auto
# snapcraft --verbose  # in fusion360 snap dir

# wine-platform repo list
# https://github.com/mmtrt?tab=repositories&q=wine-platform&type=&language=&sort=

rm fusion360_1.5_amd64.snap

snapcraft clean content
snapcraft --verbose

sudo snap remove --purge fusion360
sudo snap install fusion360_1.5_amd64.snap --dangerous --devmode

mkdir -p "${HOME}/snap/fusion360/common/.cache/" &&
cp -R "${HOME}/snap/winetricks/" "${HOME}/snap/fusion360/common/.cache/"

export WINEDEBUG=err+all

#export XDG_CACHE_HOME="/tmp/.cache"

#export SOMMELIER_DEBUG=1 
#export WINEDEBUG=err+all

# snap run --shell fusion360 -c 'env' | grep XDG
# fusion360.dxvk-setup
# fusion360.updater
