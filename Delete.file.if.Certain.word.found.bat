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

        choice /C DK /M "Do you want to delete the file or keep it? (D/K)"
        if errorlevel 2 (
            echo Keeping file.
        ) else (
            echo Deleting file: !filename!
            del "%%F"
        )
    )
)

echo Total number of files with "%Word%" in the title: %count%

endlocal
pause