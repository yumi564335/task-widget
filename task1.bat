@echo off
title 任务便签挂件
:: 你的本地HTML文件路径，自动读取当前脚本所在目录下的文件
set "HTML_PATH=%~dp0task.html"
:: 窗口宽高，和你之前设置的参数保持一致
set "WIDTH=300"
set "HEIGHT=450"
set "PROFILE=%~dp0.task-profile"
:: 调用Chrome的应用模式启动，生成独立无边框小窗口
:: --user-data-dir 使用独立 profile，清主浏览器数据不会影响本应用
start chrome.exe --app="%HTML_PATH%" --user-data-dir="%PROFILE%" --window-size=%WIDTH%,%HEIGHT% --window-position=%errorlevel%,%errorlevel%
exit