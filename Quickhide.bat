@echo off
setlocal

rem Set the path of the folder to the directory where the batch file is located
set folder_path="%~dp0"

rem Set the name of the batch file to be excluded
set batch_file="secret.bat"

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

rem Hide all files and folders except the batch file
for /f "delims=" %%i in ('dir /b /a-d') do (
    if /i not "%%i"=="%batch_file%" (
        attrib +s +h "%%i"
    )
)
for /f "delims=" %%i in ('dir /b /ad') do (
    attrib +s +h "%%i"
)

echo Contents of %folder_path% are now hidden, except %batch_file%.
pause
goto end

:unhide
rem Change directory to the specified folder
cd /d %folder_path%

rem Unhide all files and folders except the batch file
for /f "delims=" %%i in ('dir /b /a-d') do (
    if /i not "%%i"=="%batch_file%" (
        attrib -s -h "%%i"
    )
)
for /f "delims=" %%i in ('dir /b /ad') do (
    attrib -s -h "%%i"
)

echo Contents of %folder_path% are now visible, except %batch_file%.
pause
goto end

:end
endlocal
exit /b
