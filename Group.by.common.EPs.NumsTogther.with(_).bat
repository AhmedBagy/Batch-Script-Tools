@echo off
setlocal enabledelayedexpansion

set "sourceFolder=%~1"
set "destinationFolder=%sourceFolder%\Gathered.Episodes"

for /R "%sourceFolder%" %%F in (*) do (
    set "filename=%%~nxF"
    set "commonName="

    REM Extract the number from the file name
    for /F "tokens=3 delims=_" %%N in ("!filename!") do (
        set "commonName=%%N"
    )

    if defined commonName (
        md "%destinationFolder%\!commonName!" 2>nul
        copy "%%F" "%destinationFolder%\!commonName!\"
    )
)

echo Files successfully copied to destination folders.

endlocal
pause