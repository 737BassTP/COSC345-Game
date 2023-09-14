@echo off
echo Paste Codecov token:
set /p token=""
codecov.exe -B main -f coverage/*.c.txt -t %token%
pause