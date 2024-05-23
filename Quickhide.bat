@echo off
setlocal

rem Set the path of the folder to the directory where the batch file is located
set folder_path="%~dp0"

rem Ask the user whether they want to hide or unhide the contents
:menu
echo.
echo What would you like to do?
echo [H] Hide the contents
echo [U] Unhide the contents
echo [E] Exit
set /p choice=Enter your choice: 

if /i "%choice%"=="H" goto hide
if /i "%choice%"=="U" goto unhide
if /i "%choice%"=="E" goto end
echo Invalid choice. Please enter H, U, or E.
goto menu

:hide
rem Change directory to the specified folder
cd /d %folder_path%

rem Hide all files and folders within the specified folder
attrib +s +h *.*

echo Contents of %folder_path% are now hidden.
pause
goto end

:unhide
rem Change directory to the specified folder
cd /d %folder_path%

rem Unhide all files and folders within the specified folder
attrib -s -h *.*

echo Contents of %folder_path% are now visible.
pause
goto end

:end
endlocal
exit /b
