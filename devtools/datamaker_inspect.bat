REM If running with Github Actions, remove the "pause" command at the end.
mode con: cols=128 lines=32
python devtools_datamaker.py quiz inspect -1
python devtools_datamaker.py chat inspect -1
python devtools_datamaker.py quest inspect -1
python devtools_datamaker.py event inspect -1
pause