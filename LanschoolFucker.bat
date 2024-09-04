@echo off
:: Stop LanSchool processes
taskkill /F /IM teacher.exe
taskkill /F /IM student.exe

:: Uninstall LanSchool via its uninstaller but some newer builds dont have it so if exist is there
if exist "C:\Program Files (x86)\LanSchool\uninstall.exe" (
    "C:\Program Files (x86)\LanSchool\uninstall.exe" /S
)

:: Delete LanSchool files
rd /s /q "C:\Program Files (x86)\LanSchool"
rd /s /q "C:\ProgramData\LanSchool"
rd /s /q "C:\Users\%username%\AppData\Local\LanSchool"
rd /s /q "C:\Users\%username%\AppData\Roaming\LanSchool"

:: Remove any registry keys (be cautious with registry edits)
reg delete "HKLM\SOFTWARE\LanSchool" /f
reg delete "HKCU\Software\LanSchool" /f

:: Confirmation message
echo Lanschool removed.
pause