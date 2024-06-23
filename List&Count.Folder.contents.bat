@echo off

for %%F in ("%~1\*") do echo %%~nxF


@echo off
set count=0
for /R "%~1" %%F in (*) do set /a count+=1
echo Total files: %count%

pause