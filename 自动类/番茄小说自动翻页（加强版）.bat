@echo Off
title 番茄小说自动翻页加强版 Made By 红色的球
echo 脚本名称：番茄小说自动翻页加强版
echo 作者：红色的球
echo 简介:随机数生成等待时间，随机数生成点击坐标，滑动坐标，最大限度逃避番茄小说的检测
echo 注：
echo 1.此脚本仅支持20.5:9 1080P手机
echo 2.使用前请将手机连接到电脑
REM 以下为脚本命令，不熟悉的请勿随意更改！
set /P adbpath=请输入含有adb.exe,AdbWinApi.dll,AdbWinUsbApi.dll的文件夹完整路径:
REM 随机数公式 %random%%%(max-min+1)+min
set /P nu=请输入执行次数：
set /a num=%nu%+1
:loop
set /a loop+=1
if %loop%==%num% goto exit
echo 第 %loop% 次循环
set /a choose=%random%%%(2-1+1)+1
if %choose%==1 goto tap
if %choose%==2 goto swipe
:tap
set /a x=%random%%%(1020-750+1)+750
set /a y=%random%%%(2245-320+1)+320
set /a time=%random%%%(50-25+1)+25
echo 等待%time%秒
choice /t %time% /d y /n >nul
echo 点击 %x% %y%
%adbpath%/adb.exe shell input tap %x% %y%
goto loop
:swipe
set /a x1=%random%%%(1020-750+1)+750
set /a y1=%random%%%(2245-320+1)+320
set /a xplus=%random%%%(400-100+1)+100
set /a yplus=%random%%%(100-10+1)+10
set /a x2=%x1%+%xplus%
set /a y2=%y1%+%yplus%
set /a time=%random%%%(50-25+1)+25
echo 等待%time%秒
choice /t %time% /d y /n >nul
echo 从 %x1% %y1% 滑动到 %x2% %y2% ，持续 %time% ms
%adbpath%/adb.exe shell input swipe %x1% %y1% %x2% %y2% %time%
goto loop
:exit
pause
exit