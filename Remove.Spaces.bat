@echo off
setlocal enabledelayedexpansion

set folder="%~1"
set count=0

echo Removing spaces from filenames and subfolders...

for /R %folder% %%F in (*) do (
    set "filename=%%~nxF"
    set "newname=!filename: =!"
    if not "!newname!"=="!filename!" (
        echo Renaming file: !filename!
        set "newname=!newname: =!"
        ren "%%F" "!newname!"
        set /a count+=1
    )
)

for /R %folder% %%D in (.) do (
    set "dirname=%%~nxD"
    set "newdirname=!dirname: =!"
    if not "!newdirname!"=="!dirname!" (
        echo Renaming subfolder: !dirname!
        set "newdirname=!newdirname: =!"
        ren "%%D" "!newdirname!"
        set /a count+=1
    )
)

echo Total number of files and subfolders with spaces removed from names: %count%

endlocal
pause