@echo Off
title ����С˵�Զ���ҳ��ǿ�� Made By ��ɫ����
echo �ű����ƣ�����С˵�Զ���ҳ��ǿ��
echo ���ߣ���ɫ����
echo ���:��������ɵȴ�ʱ�䣬��������ɵ�����꣬�������꣬����޶��ӱܷ���С˵�ļ��
echo ע��
echo 1.�˽ű���֧��20.5:9 1080P�ֻ�
echo 2.ʹ��ǰ�뽫�ֻ����ӵ�����
REM ����Ϊ�ű��������Ϥ������������ģ�
set /P adbpath=�����뺬��adb.exe,AdbWinApi.dll,AdbWinUsbApi.dll���ļ�������·��:
REM �������ʽ %random%%%(max-min+1)+min
set /P nu=������ִ�д�����
set /a num=%nu%+1
:loop
set /a loop+=1
if %loop%==%num% goto exit
echo �� %loop% ��ѭ��
set /a choose=%random%%%(2-1+1)+1
if %choose%==1 goto tap
if %choose%==2 goto swipe
:tap
set /a x=%random%%%(1020-750+1)+750
set /a y=%random%%%(2245-320+1)+320
set /a time=%random%%%(50-25+1)+25
echo �ȴ�%time%��
choice /t %time% /d y /n >nul
echo ��� %x% %y%
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
echo �ȴ�%time%��
choice /t %time% /d y /n >nul
echo �� %x1% %y1% ������ %x2% %y2% ������ %time% ms
%adbpath%/adb.exe shell input swipe %x1% %y1% %x2% %y2% %time%
goto loop
:exit
pause
exit