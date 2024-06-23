@echo off
setlocal enabledelayedexpansion

set "search=_"
set "replace="

set "folder=%~1"

if "%folder%"=="" (
    echo No folder path provided.
    pause
    exit /b
)

if not exist "%folder%" (
    echo Invalid folder path: "%folder%"
    pause
    exit /b
)

pushd "%folder%"

for /f "delims=" %%F in ('dir /b /a-d *%search%*') do (
    set "filename=%%~nF"
    set "ext=%%~xF"

    for %%N in (1 2 3 4) do (
        set "newname=!filename:%search%%%N=%replace%!"

        if not "!newname!"=="!filename!" (
            ren "%%F" "!newname!%search%%%N%.tiff"
            set "filename=!newname!"
        )
    )
)

popd

endlocal

pause