@echo off
mkdir ..\..\RedmiK20Pro-Drivers-Release
del ..\..\RedmiK20Pro-Drivers-Release\RedmiK20Pro-Drivers-Desktop.7z

echo @echo off > ..\OnlineUpdater.cmd
echo ^(NET FILE^|^|^(powershell -command Start-Process '%%0' -Verb runAs -ArgumentList '%%* '^&EXIT /B^)^)^>NUL 2^>^&1 >> ..\OnlineUpdater.cmd
echo pushd "%%~dp0" ^&^& cd %%~dp0 >> ..\OnlineUpdater.cmd
echo .\tools\DriverUpdater\%%PROCESSOR_ARCHITECTURE%%\DriverUpdater.exe -r . -d .\definitions\Desktop\ARM64\Internal\raphael.xml >> ..\OnlineUpdater.cmd
echo pause >> ..\OnlineUpdater.cmd

echo @echo off > ..\OfflineUpdater.cmd
echo ^(NET FILE^|^|^(powershell -command Start-Process '%%0' -Verb runAs -ArgumentList '%%* '^&EXIT /B^)^)^>NUL 2^>^&1 >> ..\OfflineUpdater.cmd
echo pushd "%%~dp0" ^&^& cd %%~dp0 >> ..\OfflineUpdater.cmd
echo set /P DrivePath=Enter Drive letter ^^^(with the colon!^^^) of the connected device in mass storage mode ^^^(e.g. D:^^^): >> ..\OfflineUpdater.cmd
echo .\tools\DriverUpdater\%%PROCESSOR_ARCHITECTURE%%\DriverUpdater.exe -r . -d .\definitions\Desktop\ARM64\Internal\raphael.xml -p %%DrivePath%% >> ..\OfflineUpdater.cmd
echo pause >> ..\OfflineUpdater.cmd

echo apps\IPA\Chat >> filelist_raphael.txt
echo apps\IPA\CommsEnhancement >> filelist_raphael.txt
echo apps\IPA\Dialer >> filelist_raphael.txt
echo apps\IPA\Messaging >> filelist_raphael.txt
echo apps\IPA\Phone >> filelist_raphael.txt
echo apps\IPA\Frameworks >> filelist_raphael.txt
echo CODE_OF_CONDUCT.md >> filelist_raphael.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.BASE >> filelist_raphael.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_BRIDGE >> filelist_raphael.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_COMPONENTS >> filelist_raphael.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL >> filelist_raphael.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL_EXTRAS >> filelist_raphael.txt
echo components\Devices\Raphael >> filelist_raphael.txt
echo components\QC8150 >> filelist_raphael.txt
echo definitions\Desktop\ARM64\Internal\raphael.xml >> filelist_raphael.txt
echo tools\DriverUpdater >> filelist_raphael.txt
echo LICENSE.md >> filelist_raphael.txt
echo OfflineUpdater.cmd >> filelist_raphael.txt
echo OnlineUpdater.cmd >> filelist_raphael.txt
echo README.md >> filelist_raphael.txt

cd ..
"tools\7z.exe" a -t7z ..\RedmiK20Pro-Drivers-Release\RedmiK20Pro-Drivers-Desktop.7z @tools\filelist_raphael.txt -scsWIN
cd tools

del ..\OfflineUpdater.cmd
del ..\OnlineUpdater.cmd
del filelist_raphael.txt