@echo off
setlocal
python "%~dp0build.py" %*
set "build_status=%errorlevel%"
if not "%build_status%"=="0" echo Board CoreMark build failed.
exit /b %build_status%
