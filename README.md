<h1 align="center">
  <img src="snap/gui/fusion360.png" alt="Project">
  <br />
  Autodesk Fusion 360 for Ubuntu
</h1>

<b>This is the snap of [Autodesk Fusion 360](https://www.autodesk.com.au/products/fusion-360/overview)</b>
  
It works on Arch, Ubuntu, Fedora, Debian, and other major Linux distributions.


## Install

`$ sudo snap install --beta fusion360 --devmode`

([Don't have snapd installed?](https://snapcraft.io/docs/core/install))

- You might now be able to see the fusion 360 screen, but it asks you to login via web, but is unable to open a prompt on web
- Close Fusion 360, Open a new terminal,

`$ fusion_idsdk=false snap run fusion360`

Ohh yes! You now will be able to see the Login Screen!
- For FusiontoURDF plugins refer the following
ROS1: https://github.com/syuntoku14/fusion2urdf.git
ROS2: https://github.com/kartiksoni01/fusion2urdf-ros2
