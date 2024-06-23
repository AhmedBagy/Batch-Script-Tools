@echo off
setlocal enabledelayedexpansion

set /p "word=Enter the word to add: "
set "folder=%1"

for %%F in ("%folder%\*") do (
    set "filename=%%~nF"
    set "extension=%%~xF"
    ren "%%F" "!filename!_%word%!extension!"
)

echo Done! The word "%word%" has been added to the filenames inside "%folder%".
pause