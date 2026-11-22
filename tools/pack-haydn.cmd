@echo off
mkdir ..\..\RedmiK40Pro-Drivers-Release
del ..\..\RedmiK40Pro-Drivers-Release\RedmiK40Pro-Drivers-Desktop.7z

echo @echo off > ..\OnlineUpdater.cmd
echo ^(NET FILE^|^|^(powershell -command Start-Process '%%0' -Verb runAs -ArgumentList '%%* '^&EXIT /B^)^)^>NUL 2^>^&1 >> ..\OnlineUpdater.cmd
echo pushd "%%~dp0" ^&^& cd %%~dp0 >> ..\OnlineUpdater.cmd
echo .\tools\DriverUpdater\%%PROCESSOR_ARCHITECTURE%%\DriverUpdater.exe -r . -d .\definitions\Desktop\ARM64\Internal\haydn.xml >> ..\OnlineUpdater.cmd
echo pause >> ..\OnlineUpdater.cmd

echo @echo off > ..\OfflineUpdater.cmd
echo ^(NET FILE^|^|^(powershell -command Start-Process '%%0' -Verb runAs -ArgumentList '%%* '^&EXIT /B^)^)^>NUL 2^>^&1 >> ..\OfflineUpdater.cmd
echo pushd "%%~dp0" ^&^& cd %%~dp0 >> ..\OfflineUpdater.cmd
echo set /P DrivePath=Enter Drive letter ^^^(with the colon!^^^) of the connected device in mass storage mode ^^^(e.g. D:^^^): >> ..\OfflineUpdater.cmd
echo .\tools\DriverUpdater\%%PROCESSOR_ARCHITECTURE%%\DriverUpdater.exe -r . -d .\definitions\Desktop\ARM64\Internal\haydn.xml -p %%DrivePath%% >> ..\OfflineUpdater.cmd
echo pause >> ..\OfflineUpdater.cmd

echo apps\IPA\Chat >> filelist_haydn.txt
echo apps\IPA\CommsEnhancement >> filelist_haydn.txt
echo apps\IPA\Dialer >> filelist_haydn.txt
echo apps\IPA\Messaging >> filelist_haydn.txt
echo apps\IPA\Phone >> filelist_haydn.txt
echo apps\IPA\Frameworks >> filelist_haydn.txt
echo CODE_OF_CONDUCT.md >> filelist_haydn.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.BASE >> filelist_haydn.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_BRIDGE >> filelist_haydn.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_COMPONENTS >> filelist_haydn.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL >> filelist_haydn.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL_EXTRAS >> filelist_haydn.txt
echo components\Devices\haydn >> filelist_haydn.txt
echo components\QC8350 >> filelist_haydn.txt
echo definitions\Desktop\ARM64\Internal\haydn.xml >> filelist_haydn.txt
echo tools\DriverUpdater >> filelist_haydn.txt
echo LICENSE.md >> filelist_haydn.txt
echo OfflineUpdater.cmd >> filelist_haydn.txt
echo OnlineUpdater.cmd >> filelist_haydn.txt
echo README.md >> filelist_haydn.txt

cd ..
"tools\7z.exe" a -t7z ..\RedmiK40Pro-Drivers-Release\RedmiK40Pro-Drivers-Desktop.7z @tools\filelist_haydn.txt -scsWIN
cd tools

del ..\OfflineUpdater.cmd
del ..\OnlineUpdater.cmd
del filelist_haydn.txt