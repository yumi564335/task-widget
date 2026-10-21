@echo off
title 任务便签挂件
set "HTML_PATH=%~dp0task.html"
set "WIDTH=300"
set "HEIGHT=450"
set "PROFILE=%~dp0.task-profile"
:: 通过计算屏幕分辨率，自动把窗口定位到右下角
for /f "tokens=2 delims==" %%a in ('wmic path Win32_VideoController get CurrentHorizontalResolution /value') do set SCREEN_W=%%a
for /f "tokens=2 delims==" %%a in ('wmic path Win32_VideoController get CurrentVerticalResolution /value') do set SCREEN_H=%%a
set /a POS_X=%SCREEN_W%-%WIDTH%-20
set /a POS_Y=%SCREEN_H%-%HEIGHT%-80
start chrome.exe --app="%HTML_PATH%" --user-data-dir="%PROFILE%" --window-size=%WIDTH%,%HEIGHT% --window-position=%POS_X%,%POS_Y%
exit