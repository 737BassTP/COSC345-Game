@echo off
echo Paste Codecov token:
set /p token=""
codecov.exe -B main -f *.c.txt -t %token%
pause