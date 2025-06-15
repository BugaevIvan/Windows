@echo off
:: Activating Windows without GUI
cscript //nologo %windir%\system32\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
cscript //nologo %windir%\system32\slmgr.vbs /skms kms.digiboy.ir
cscript //nologo %windir%\system32\slmgr.vbs /ato

:: Creating a folder under Office
mkdir "C:\Office 2024" 2>nul

:: Downloading and quietly unpacking ODT
curl -o odt.exe https://download.microsoft.com/download/6c1eeb25-cf8b-41d9-8d0d-cc1dbc032140/officedeploymenttool_18730-20142.exe
odt.exe /quiet /extract:"C:\Office 2024"

:: Downloading the Office configuration
curl -o "C:\Office 2024\configuration.xml" https://raw.githubusercontent.com/BugaevIvan/Windows/main/configuration.xml

:: Installing Office
"C:\Office 2024\setup.exe" /configure "C:\Office 2024\configuration.xml"

:: Clearing
rd /s /q "C:\Office 2024"
del /f /q odt.exe
