@echo off
setlocal enabledelayedexpansion

set "sourcefolder=%~1"
set "destinationFolder=%sourcefolder%\Gathered.Episodes"

for /R "%sourceFolder%" %%F in (*) do (
    set "filename=%%~nxF"
    set "folderName="
    
    for /F "tokens=3" %%N in ("!filename!") do (
        set "folderName=%%N"
        md "%destinationFolder%\!folderName!" 2>nul
        copy "%%F" "%destinationFolder%\!folderName!\"
    )
)

echo Files successfully copied to destination folders.

endlocal
pause