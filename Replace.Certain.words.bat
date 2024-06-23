@echo off
setlocal enabledelayedexpansion

set folder=%~1
set count=0
set /p SearchWord="Write the word you want to replace and press ENTER: "
set /p ReplaceWord="Write the replacement word and press ENTER: "

echo Searching for files with "%SearchWord%" in the title...

for /R "%folder%" %%F in (*) do (
    set "filename=%%~nxF"
    echo !filename! | find /i "%SearchWord%" >nul
    if not errorlevel 1 (
        echo Found: !filename!
        set /a count+=1

        choice /C YN /M "Do you want to replace the word in the filename? (Y/N)"
        if errorlevel 2 (
            echo Skipping renaming.
        ) else (
            set "newname=!filename:%SearchWord%=%ReplaceWord%!"
            if not "!newname!"=="!filename!" (
                echo Renaming file to: !newname!
                ren "%%F" "!newname!"
            ) else (
                echo Word not found in the filename. Skipping renaming.
            )
        )
    )
)

echo Total number of files with "%SearchWord%" in the title: %count%

endlocal
pause