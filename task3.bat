@echo off
title 任务便签挂件

:: 如果运行脚本时带了参数，就用参数；否则使用默认路径
if not "%~1"=="" (
    set "HTML_PATH=%~1"
) else (
    :: 这里填写默认的绝对路径
    set "HTML_PATH=D:\GitProjects\task-widget\task.html"
)

:: 检查文件是否存在
if not exist "%HTML_PATH%" (
    echo 错误：找不到文件 "%HTML_PATH%"
    pause
    exit
)

set "WIDTH=300"
set "HEIGHT=450"
set "PROFILE=%~dp0.task-profile"

:: 计算位置
for /f "tokens=2 delims==" %%a in ('wmic path Win32_VideoController get CurrentHorizontalResolution /value') do set SCREEN_W=%%a
for /f "tokens=2 delims==" %%a in ('wmic path Win32_VideoController get CurrentVerticalResolution /value') do set SCREEN_H=%%a
set /a POS_X=%SCREEN_W%-%WIDTH%-20
set /a POS_Y=%SCREEN_H%-%HEIGHT%-80

start chrome.exe --app="%HTML_PATH%" --user-data-dir="%PROFILE%" --window-size=%WIDTH%,%HEIGHT% --window-position=%POS_X%,%POS_Y%
exit