@echo off

REM Check if Ethernet is currently enabled
netsh interface show interface | findstr /C:"Ethernet" | findstr /C:"Enabled" > nul
if %errorlevel% == 0 (
  REM Ethernet is enabled, disable it and enable Cellular
  echo Ethernet is currently enabled. Disabling Ethernet and enabling Cellular...
  netsh interface set interface "Ethernet" admin=disable
  netsh interface set interface "Wi-Fi" admin=enable
  echo Ethernet disabled, Cellular enabled.
) else (
  REM Ethernet is disabled, enable it and disable Cellular
  echo Ethernet is currently disabled. Enabling Ethernet and disabling Cellular...
  netsh interface set interface "Ethernet" admin=enable
  netsh interface set interface "Wi-Fi" admin=disable
  echo Cellular disabled, Ethernet enabled.
)

REM Add a delay between each message
timeout /t 2 > nul
