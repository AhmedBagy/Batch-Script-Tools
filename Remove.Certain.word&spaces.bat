@echo off
setlocal enabledelayedexpansion

set folder=%~1
set count=0
set /p Word="Write the word you're looking for and press ENTER: "

echo Searching for files with "%Word%" in the title...

for /R "%folder%" %%F in (*) do (
    set "filename=%%~nxF"
    echo !filename! | find /i "%Word%" >nul
    if not errorlevel 1 (
        echo Found: !filename!
        set /a count+=1

        choice /C YN /M "Do you want to remove the word from the filename? (Y/N)"
        if errorlevel 2 (
            echo Skipping renaming.
        ) else (
            set "newname=!filename:%Word%=!"
            set "newname=!newname: =!"
            set "newname=!newname: =!"
            if not "!newname!"=="!filename!" (
                echo Renaming file to: !newname!
                ren "%%F" "!newname!"
            ) else (
                echo Word or spaces not found in the filename. Skipping renaming.
            )
        )
    )
)

echo Total number of files with "%Word%" in the title: %count%

endlocal
pause