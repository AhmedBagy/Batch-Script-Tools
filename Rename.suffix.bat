@echo off
setlocal enabledelayedexpansion

set "folder=%~1"

if not defined folder (
    echo Please drag and drop the folder containing the files onto this script.
    pause
    exit /b
)

for /R "%folder%" %%F in (*) do (
    set "filename=%%~nxF"
    set "newFilename=!filename:1of4=_1!"
    set "newFilename=!newFilename:2of4=_2!"
    set "newFilename=!newFilename:3of4=_3!"
    set "newFilename=!newFilename:4of4=_4!"
    
    if not "!filename!"=="!newFilename!" (
        echo Renaming "%%F" to "!newFilename!"...
        ren "%%F" "!newFilename!"
    )
)

echo File names successfully modified.

endlocal
pause