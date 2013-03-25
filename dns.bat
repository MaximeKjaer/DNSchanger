@echo off
title Change your DNS

:menu
cls
echo Please choose a DNS server:
echo.
echo 0. DHCP / Disable
echo 1. Google DNS
echo 2. Open DNS
echo 3. CensurfriDNS
echo 4. FoolDNS
echo 5. OpenDNS Family Shield
echo 6. Level 3
echo 7. Symantec
echo 8. ScrubIt
echo 9. dnsadvantage
echo.
echo.

:menu_choice
set /p choice_1=Enter your choice: 
if %choice_1%==0 goto reset

if %choice_1%==1 set dns=Google DNS
if %choice_1%==1 set primary=8.8.8.8
if %choice_1%==1 set secondary=8.8.4.4
if %choice_1%==1 goto exec

if %choice_1%==2 set dns=Open DNS
if %choice_1%==2 set primary=208.67.222.222
if %choice_1%==2 set secondary=208.67.220.220
if %choice_1%==2 goto exec

if %choice_1%==3 set dns=CensurfriDNS
if %choice_1%==3 set primary=89.233.43.71
if %choice_1%==3 set secondary=89.104.194.142
if %choice_1%==3 goto exec

if %choice_1%==4 set dns=FoolDNS
if %choice_1%==4 set primary=87.118.111.215
if %choice_1%==4 set secondary=80.79.54.55
if %choice_1%==4 goto exec

if %choice_1%==5 set dns=OpenDNS Family Shield
if %choice_1%==5 set primary=208.67.222.123
if %choice_1%==5 set secondary=208.67.220.123
if %choice_1%==5 goto exec

if %choice_1%==6 set dns=Level 3
if %choice_1%==6 set primary=4.2.2.1
if %choice_1%==6 set secondary=4.2.2.2
if %choice_1%==6 goto exec

if %choice_1%==7 set dns=Symantec
if %choice_1%==7 set primary=198.153.192.1
if %choice_1%==7 set secondary=198.153.194.1
if %choice_1%==7 goto exec

if %choice_1%==8 set dns=ScrubIt
if %choice_1%==8 set primary=67.138.54.100
if %choice_1%==8 set secondary=207.225.209.66
if %choice_1%==8 goto exec

if %choice_1%==9 set dns=dnsadvantage
if %choice_1%==9 set primary=156.154.70.1
if %choice_1%==9 set secondary=156.154.71.1
if %choice_1%==9 goto exec

echo Invalid choice: %choice_1%
echo.
echo.
goto menu_choice

:reset
title DHCP / Disable
cls
echo Obtaining a DNS server automatically
netsh interface ip delete dns "Wireless Network Connection 2" all
title Connected
goto end

:exec
cls
title Connecting to %dns%...
echo Connecting to %dns%:
echo.
echo Connecting to primary server at [%primary%]
netsh interface ip set dns "Wireless Network Connection 2" static %primary% primary
echo Connecting to secondary server at [%secondary%]
netsh interface ip add dns "Wireless Network Connection 2" %secondary% index=2
title Connected
:end
netsh interface ip show dns
pause
exit
