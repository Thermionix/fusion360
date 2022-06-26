#!/bin/sh

fusion360.winetricks -q dxvk

cd $(snap run --shell fusion360 -c 'echo $SNAP_USER_COMMON') 
cd ".wine/drive_c/users/$USER/AppData/Roaming/Autodesk/Neutron Platform/Options/"
cat > "NMachineSpecificOptions.xml" << "E"
<?xml version="1.0" encoding="UTF-16" standalone="no" ?>
<OptionGroups>
  <BootstrapOptionsGroup SchemaVersion="2" ToolTip="Special preferences that require the application to be restarted after a change." UserName="Bootstrap">
    <driverOptionId ToolTip="The driver used to display the graphics" UserName="Graphics driver" Value="VirtualDeviceDx9"/></BootstrapOptionsGroup>
</OptionGroups>
E

fusion360.wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v d3d9 /d builtin /f
fusion360.wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v d3d10core /d "" /f
fusion360.wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v d3d11 /d native /f
fusion360.wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v dxgi /d native /f
