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

# for local builds
# download MicrosoftEdgeWebView2RuntimeInstallerX64.exe & Fusion Admin Install.exe
# place in /content/ folder to be included by snapcraft

rm fusion360_1.5_amd64.snap

# clean build content
snapcraft clean content

# build snap
snapcraft --verbose

# purge old install
sudo snap remove --purge fusion360
# install the snap
sudo snap install fusion360_1.5_amd64.snap --dangerous --devmode

# check connections
snap connections fusion360

# fix connections
sudo snap connect fusion360:wine-9-staging-c22 wine-platform-9-staging-core22
sudo snap connect fusion360:wine-runtime-c22 wine-platform-runtime-core22

# copy winetricks cache from /snap/winetricks to prevent downloading everytime
mkdir -p "${HOME}/snap/fusion360/common/.cache/" &&
cp -R "${HOME}/snap/winetricks/" "${HOME}/snap/fusion360/common/.cache/"

# enable wine debugging output
export WINEDEBUG=err+all

# run fusion360 installer
fusion360

# check EdgeWebView2 installer log
cat ${HOME}/snap/fusion360/common/.wine/drive_c/ProgramData/Microsoft/EdgeUpdate/Log/MicrosoftEdgeUpdate.log

# check fusion installer log
cat ${HOME}/snap/fusion360/common/.wine/drive_c/users/`whoami`/AppData/Local/Autodesk/autodesk.webdeploy.streamer.log

#export XDG_CACHE_HOME="/tmp/.cache"

#export SOMMELIER_DEBUG=1 
#export WINEDEBUG=err+all

# snap run --shell fusion360 -c 'env' | grep XDG
# fusion360.dxvk-setup
# fusion360.updater
# fusion360.wine uninstaller
# fusion360.wine --version
