@echo off
title Klassenarbeit Filter
setlocal enabledelayedexpansion
set /p "input_path=Enter a Filepath: "
set "desktop_path=%USERPROFILE%\Desktop\result.txt"
if exist "%desktop_path%" del "%desktop_path%"
set "file_count=0"
for /r "%input_path%" %%f in (*) do (
    set "filename=%%f"
    set "extension=%%~xf"
    if not "!extension!"==".exe" if not "!extension!"==".bat" if not "!extension!"==".msi" (
        if not exist "%%f\" (
            echo %%f >> "%desktop_path%"
            set /a "file_count+=1"
        )
    )
)
cls
echo %file_count% >> "%desktop_path%" Files Found!
echo result saved in %desktop_path% in Desktop.
pause
