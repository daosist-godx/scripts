@echo off
:: send-msg.bat — minimal interactive wrapper for msg.exe
:: Run as Administrator

setlocal EnableDelayedExpansion

rem ---- 1. Target computer --------------------------------------
set /p target=Enter the target IP address: 
if /i "%target%"=="" (
    set "srvFlag="
    set "showName=local machine"
) else (
    set "srvFlag=/server:%target%"
    set "showName=%target%"
)

rem ---- 2. Show sessions on that computer -----------------------
echo(
echo Active sessions on %showName%:
echo ------------------------------------------------------------
if defined srvFlag (
    quser %srvFlag%
) else (
    quser
)
echo ------------------------------------------------------------

rem ---- 3. Recipient and message --------------------------------
set /p rcpt=Enter session ID or * for all: 
set /p msg=Message text: 

rem ---- 4. Send the message -------------------------------------
echo(
echo Sending...
msg %rcpt% %srvFlag% /v /w /time:120 "%msg%"

pause
endlocal