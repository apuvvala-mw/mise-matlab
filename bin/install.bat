@echo off
setlocal

REM Arguments: %1 = MATLAB_VERSION, %2 = INSTALL_DIR, %3 = TOOLBOXES (comma-separated)
set "MATLAB_VERSION=%1"
set "INSTALL_DIR=%2"
set "TOOLBOXES=%3"

REM Set working directory to script location
cd /d "%~dp0"

REM Download MPM if not present
if not exist "mpm.exe" (
    echo Downloading MPM...
    powershell -Command "Invoke-WebRequest -Uri https://www.mathworks.com/mpm/win64/mpm.exe -OutFile 'mpm.exe'"
)

REM Run MPM to install MATLAB and toolboxes
mpm.exe install --release=%MATLAB_VERSION% --destination="%INSTALL_DIR%" --products=%TOOLBOXES%

echo MATLAB %MATLAB_VERSION% with toolboxes [%TOOLBOXES%] installed at %INSTALL_DIR%
endlocal
