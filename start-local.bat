@echo off
cd /d "%~dp0"
set HOST=127.0.0.1
set PORT=3000
REM Optional: set the folder containing "MTA Server.exe" below.
REM Example: set "MTA_SERVER_DIR=C:\MTA Server"
REM Keep this panel local only.
node server.js
pause
