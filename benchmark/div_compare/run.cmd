@echo off
setlocal
set "DIV_TEST_ROOT=%~dp0..\.."
if exist "%DIV_TEST_ROOT%\.venv\Scripts\python.exe" (
    "%DIV_TEST_ROOT%\.venv\Scripts\python.exe" "%~dp0run.py" %*
) else (
    python "%~dp0run.py" %*
)
exit /b %errorlevel%
