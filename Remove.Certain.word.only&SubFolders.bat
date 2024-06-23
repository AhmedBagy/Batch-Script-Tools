@echo off
setlocal enabledelayedexpansion

 

set folder=%~1
set count=0
set /p Word="Write the word you're looking for and press ENTER: "

 

echo Searching for files and folders with "%Word%" in the title...

 

for /R "%folder%" %%F in (*) do (
    set "filename=%%~nxF"
    echo !filename! | find /i "%Word%" >nul
    if not errorlevel 1 (
        echo Found: !filename!
        set /a count+=1

 

        choice /C YN /M "Do you want to remove the word from the filename/folder name? (Y/N)"
        if errorlevel 2 (
            echo Skipping renaming.
        ) else (
            set "newname=!filename:%Word%=!"
            if not "!newname!"=="!filename!" (
                echo Renaming file/folder to: !newname!

 

                if not "%%~aF"=="d" (
                    rem Rename file
                    ren "%%F" "!newname!"
                ) else (
                    rem Rename folder
                    ren "%%F" "!newname!"
                )
            ) else (
                echo Word not found in the file/folder name. Skipping renaming.
            )
        )
    )
)

 

echo Total number of files and folders with "%Word%" in the title: %count%

 

endlocal
pause