<h1 align="center">
  <img src="snap/gui/fusion360.png" alt="Project">
  <br />
  Autodesk Fusion 360
</h1>

<b>This is the snap of [Autodesk Fusion 360](https://www.autodesk.com.au/products/fusion-360/overview)</b>
  
<i>Fusion 360 is Integrated CAD, CAM, CAE, and PCB software. developed by Autodesk</i>
  
It works on Arch, Ubuntu, Fedora, Debian, and other major Linux distributions.

[![fusion360](https://snapcraft.io/fusion360/badge.svg)](https://snapcraft.io/fusion360)



## Install

`$ sudo snap install --edge fusion360 --devmode`

([Don't have snapd installed?](https://snapcraft.io/docs/core/install))

## Update the snap

`$ sudo snap refresh fusion360 --devmode`

## Update Fusion360 within the snap

`$ fusion360.updater`

## Known Issues:

- [DXVK](https://github.com/doitsujin/dxvk) will not currently work [Wine bug# 45277](https://bugs.winehq.org/show_bug.cgi?id=45277)
>006b:fixme:vulkan:X11DRV_vkCreateWin32SurfaceKHR Application requires child window rendering, which is not implemented yet!

- Fusion360.exe hangs after window being closed
[Wine bug# 53286](https://bugs.winehq.org/show_bug.cgi?id=53286)

- Floating toolbars
