@echo off
setlocal enabledelayedexpansion

set "targetFolder=%~1\gathered"


for /f "delims=" %%a in ('dir /b /a-d "%~1\*.*"') do (
    set "fileName=%%a"
    set "fileExt=!fileName:~-4!"
    set "fileName=!fileName:~0,-4!"
    set "folderName=!fileName:~0,-2!"
    md "%targetFolder%\!folderName!" 2>nul
    copy "%~1\%%a" "%targetFolder%\!folderName!\!fileName!!fileExt!" >nul
)

echo Done.

pause