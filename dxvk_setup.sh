#!/bin/sh

#### 1) Install dxvk

fusion360.winetricks -q dxvk


#### 2) Change Fusion 360 from OpenGL to DirectX9

# Either from within Fusion 360:
# Preferences > General > Graphics driver > select DirectX 9.
# Relaunch Fusion 360.

# or run the following:
cd $(snap run --shell fusion360 -c 'echo $SNAP_USER_COMMON') 
cd ".wine/drive_c/users/$USER/AppData/Roaming/Autodesk/Neutron Platform/Options/"
cat NMachineSpecificOptions.xml | iconv -f UTF16 -t UTF8 | sed 's/VirtualDeviceGLCore/VirtualDeviceDx9/' | tee NMachineSpecificOptions.xml


#### 3) Add wine dll overrides with:
fusion360.wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v d3d9 /d builtin /f
fusion360.wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v d3d10core /d "" /f
fusion360.wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v d3d11 /d native /f
fusion360.wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v dxgi /d native /f
