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

# for local repeated build testing
# download MicrosoftEdgeWebView2RuntimeInstallerX64.exe & Fusion Admin Install.exe
# place in users ~/Download/ folder to be used by pre-install hook

echo "### cleaning build content"
rm fusion360_*_amd64.snap
snapcraft clean content

echo "### building snap"
snapcraft --verbose

echo "### purge old snap"
sudo snap remove --purge fusion360

echo "### installing snap"
sudo snap install fusion360_*_amd64.snap --dangerous --devmode

echo "### fixing snap connections"
sudo snap connect fusion360:wine-9-devel wine-platform-9-devel-core22
sudo snap connect fusion360:wine-runtime-c22 wine-platform-runtime-core22

#snap known snap-declaration snap-name=wine-platform-runtime-core22
#snap known snap-declaration snap-name=wine-platform-9-devel-core22

snap connections fusion360

echo "### copying winetricks cache from /snap/winetricks"
mkdir -p "${HOME}/snap/fusion360/common/.cache/" &&
cp -R "${HOME}/snap/winetricks/" "${HOME}/snap/fusion360/common/.cache/"

#echo "### enabling wine debugging output"
#export WINEDEBUG=err+all
#export SOMMELIER_DEBUG=1
#export WINEDEBUG=-all

echo "### running fusion360 installer"
fusion360

#echo "### check fusion installer log"
#cat ${HOME}/snap/fusion360/common/.wine/drive_c/users/`whoami`/AppData/Local/Autodesk/autodesk.webdeploy.streamer.log

#export XDG_CACHE_HOME="/tmp/.cache"

# snap run --shell fusion360 -c 'env' | grep XDG
# fusion360.dxvk-setup
# fusion360.updater
# fusion360.wine uninstaller
# fusion360.wine --version
# fusion360.wine regedit
