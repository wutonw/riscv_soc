@echo off
setlocal

set "ROOT=%~dp0"
set "PYTHON=%ROOT%.venv\Scripts\python.exe"

if not exist "%PYTHON%" (
    echo Creating Python virtual environment...
    py -3 -m venv "%ROOT%.venv"
    if errorlevel 1 (
        echo Failed to create virtual environment.
        pause
        exit /b 1
    )
)

echo Installing or checking dependencies from Tsinghua mirror...
"%PYTHON%" -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r "%ROOT%requirements.txt"
if errorlevel 1 (
    echo Failed to install dependencies.
    pause
    exit /b 1
)

echo Starting RV32IM serial monitor...
"%PYTHON%" "%ROOT%main.py"
set "STATUS=%ERRORLEVEL%"

if not "%STATUS%"=="0" (
    echo Serial monitor exited with code %STATUS%.
    pause
)
exit /b %STATUS%
