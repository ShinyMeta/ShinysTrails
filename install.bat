@echo off
setlocal

:: Variables - Change these
set "blishLocation=C:\Program Files\Guild Wars 2\3rd Party Tools\Blish\Blish.HUD.0.11.7\settings\blishhud.1\markers"
set "tacoPOIsLocation=C:\Program Files\Guild Wars 2\3rd Party Tools\TacO GW2 overlay\POIs"
set "fileName=shinystrails"

:: Delete old TacO file at target location
if exist "%blishLocation%\%fileName%.taco" (
    del /F "%blishLocation%\%fileName%.taco"
)

:: Build the TacO file
powershell -NoProfile -Command "Get-ChildItem -Recurse .\* | Where-Object { $_.FullName -notmatch '.git' -and $_.FullName -notmatch '.github' -and $_.Name -ne 'install.bat' } | Compress-Archive -DestinationPath .\%fileName%.zip -Force"
rename %fileName%.zip %fileName%.taco

:: Move the TacO file to the target location
move /Y "%fileName%.taco" "%blishLocation%"

:: same for taco pois
:: Delete old TacO file at target location
if exist "%tacoPOIsLocation%\%fileName%.taco" (
    del /F "%tacoPOIsLocation%\%fileName%.taco"
)
:: Build the TacO file
powershell -NoProfile -Command "Get-ChildItem -Recurse .\* | Where-Object { $_.FullName -notmatch '.git' -and $_.FullName -notmatch '.github' -and $_.Name -ne 'install.bat' } | Compress-Archive -DestinationPath .\%fileName%.zip -Force"
rename %fileName%.zip %fileName%.taco

:: Move the TacO file to the target location
move /Y "%fileName%.taco" "%tacoPOIsLocation%"

endlocal
