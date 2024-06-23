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
    )
)

echo Total number of files with "%Word%" in the title: %count%

endlocal
pause