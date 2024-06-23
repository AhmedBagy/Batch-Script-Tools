@echo off
setlocal enabledelayedexpansion

set folder="%~1"
set count=0

echo Replacing spaces with underscores (_) in filenames and subfolders...

for /R %folder% %%F in (*) do (
    set "filename=%%~nxF"
    set "newname=!filename: =_!"
    if not "!newname!"=="!filename!" (
        echo Renaming file: !filename!
        set "newname=!newname: =_!"
        ren "%%F" "!newname!"
        set /a count+=1
    )
)

for /R %folder% %%D in (.) do (
    set "dirname=%%~nxD"
    set "newdirname=!dirname: =_!"
    if not "!newdirname!"=="!dirname!" (
        echo Renaming subfolder: !dirname!
        set "newdirname=!newdirname: =_!"
        ren "%%D" "!newdirname!"
        set /a count+=1
    )
)

echo Total number of files and subfolders with spaces replaced with underscores: %count%

endlocal
pause