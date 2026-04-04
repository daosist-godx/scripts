@echo off
setlocal EnableExtensions

set /p "remoteIP=Enter the target IP address: "
if not defined remoteIP exit /b 1

set /p "userName=Enter the username (include domain if required): "
if not defined userName exit /b 1

if not exist "%~dp0PsExec.exe" (
    echo PsExec.exe not found next to the script.
    exit /b 1
)

echo Launching remote cmd.exe on %remoteIP%...
"%~dp0PsExec.exe" \\%remoteIP% -accepteula -i -s -u "%userName%" cmd.exe

endlocal
