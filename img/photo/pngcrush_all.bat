REM To install pngcrush, download executable version 1.8.11 and place its residing folder into the user PATH environment variable.
REM https://sourceforge.net/projects/pmt/files/pngcrush-executables/1.8.11/pngcrush_1_8_11_w64.exe/download

REM "Signal Hill Lookout"
pngcrush signalhill.png signalhill2.png
del signalhill.png
ren signalhill2.png signalhill.png

REM "?"
