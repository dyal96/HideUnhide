@echo off
set folder_path="C:\path\to\your\folder"

rem Change directory to the specified folder
cd /d %folder_path%

rem Hide all files and folders within the specified folder
attrib +s +h *.*

echo Contents of %folder_path% are now hidden.
pause
