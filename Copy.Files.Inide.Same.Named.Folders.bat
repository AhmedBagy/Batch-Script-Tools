@echo off
setlocal enabledelayedexpansion

set "sourceFolder=%~1"
set "destinationFolder=%sourceFolder%\Gathered.Episodes"

for /R "%sourceFolder%" %%F in (*) do (
    set "commonName=%%~nF"
    set "folderName=!commonName!"

    if defined commonName (
        md "%destinationFolder%\!folderName!" 2>nul
        copy "%%F" "%destinationFolder%\!folderName!\"
    )
)

echo Files successfully copied to destination folders.

endlocal
pause