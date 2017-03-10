@echo off
@setlocal enableextensions
@cd /d "%~dp0"
COLOR 0A
net session >nul 2>&1
if %errorLevel% == 0 (
goto adminfound
) else (
goto adminnotfound
)
:adminfound
if "%PATH%"=="%PATH:ADB=%" (
xcopy ADB c:\ADB\ /y
setx.exe PATH "%PATH%;C:\ADB" -m
SET PATH "%PATH%;C:\ADB"
cls
echo Exclusively For www.CoolesTech.com
echo By Mostafa Dafer
echo v0.8.2
@echo:
@echo:
@echo:
echo ADB Installed Successfully. Please re-run CSigner again.
pause
exit
)
rem java check
if "%PATH%"=="%PATH:Java=%" (
goto addjava
) else (
goto endofchecks
)
:addjava
FOR /F "skip=2 tokens=2*" %%A IN ('REG QUERY "HKLM\Software\JavaSoft\Java Development Kit" /v CurrentVersion') DO SET javaver=%%B
FOR /F "skip=2 tokens=2*" %%A IN ('REG QUERY "HKLM\Software\JavaSoft\Java Development Kit\%javaver%" /v JavaHome') DO set JAVA_HOME=%%B
REG QUERY "HKLM\Software\JavaSoft\Java Development Kit\%javaver%">nul
if "%ERRORLEVEL%" EQU "0" (
setx.exe PATH "%PATH%;%JAVA_HOME%\bin" -m
SET PATH "%PATH%;%JAVA_HOME%\bin"
cls
COLOR 0A
echo Exclusively For www.CoolesTech.com
echo By Mostafa Dafer
echo v0.8.2
@echo:
@echo:
@echo:
echo Java jdk Installed Successfully. Please re-run CSigner again.
pause
exit
) else (
cls
COLOR 0C
echo Exclusively For www.CoolesTech.com
echo By Mostafa Dafer
echo v0.8.2
@echo:
@echo:
@echo:
echo Java was not found. Please download and install Java ^(JDK^) manually then run this script as Administrator to add the path to the environment variables automatically.
Pause
exit
)
:adminnotfound
if "%PATH%"=="%PATH:ADB=%" (
COLOR 0C
echo Exclusively For www.CoolesTech.com
echo By Mostafa Dafer
echo v0.8.2
@echo:
@echo:
@echo:
echo ADB was not found. Run this script as Administrator to install ADB automatically, or install ADB manually then run this script.
pause
exit
)
if "%PATH%"=="%PATH:Java=%" (
COLOR 0C
echo Exclusively For www.CoolesTech.com
echo By Mostafa Dafer
echo v0.8.2
@echo:
@echo:
@echo:
echo Java was not found. Please download and install Java ^(JDK^) manually then run this script as Administrator to add the path to the environment variables automatically.
pause
exit
)
:endofchecks
cls
set message=0
set message2=0
COLOR 0A
echo Exclusively For www.CoolesTech.com
echo By Mostafa Dafer
echo v0.8.2
@echo:
@echo:
echo Apk's found in "place-apk-here":
@echo:
cd "%~dp0"
:filesel
setlocal EnableDelayedExpansion
set /A count=0
FOR %%F IN (place-apk-here/*.apk) DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo ^ !count!- %%F )
if /I !count! GTR 10 (echo !count!- %%F )
)
echo.
if '!count!'=='0' (
COLOR 0C
cls
echo Exclusively For www.CoolesTech.com
echo By Mostafa Dafer
echo v0.8.2
@echo:
@echo:
@echo:
@echo:
echo copy your apk files to "place-apk-here" folder 
pause
COLOR 0A
cls
echo Exclusively For www.CoolesTech.com
echo By Mostafa Dafer
echo v0.8.2
@echo:
@echo:
@echo:
goto filesel
)
set INPUT=0
set /P INPUT=Choose the app to be set as current project: %=%
if /I %INPUT% GTR %count% (goto chc)
if /I %INPUT% LSS 1 (goto chc)
set capp=!a%INPUT%!
set capp=%capp:~0,-4%
cls
goto javasearch
:chc
cls
echo Exclusively For www.CoolesTech.com
echo By Mostafa Dafer
echo v0.8.2
@echo:
@echo:
echo Apk's found in "place-apk-here":
@echo:
goto filesel
:javasearch
if "%PATH%"=="%PATH:java=%" (
goto notfound
) else (
cls
goto start
)
:notfound
cls
set /p answer= "Java not found ^(JDK^). After you install it you must add its path to environment variables. Continue anyway ^(not recommended^)^? [y,n]: "
if not '!choice!'=='' set choice=%answer:~0,1%
if '%answer%'=='y' goto anyway
if '%answer%'=='n' goto exit
@echo:
goto javasearch
:anyway
cls
COLOR 0C
echo WARNING: RUNNING WHILE JAVA NOT FOUND
@echo:
:start
echo Exclusively For www.CoolesTech.com
echo By Mostafa Dafer
echo v0.8.2
@echo:
if '!message!'=='0' (
@echo:
) else (
echo !message!
)
@echo:
if '!message2!'=='0' (
@echo:
) else (
echo !message2!
)
cd "%~dp0\bin"
set opnum=0
set already=0
if exist "%~dp0\place-apk-here\%capp%_unsigned.apk" (
set already=unsigned
) else (
if exist "%~dp0\place-apk-here\%capp%_signed_zipaligned.apk" (
set already=signed_zipaligned
)
)
if '%already%'=='0' (
set /a opnum=opnum+1
ECHO !opnum!. Sign "%capp%.apk" with a new certificate
set /a opnum=opnum+1
ECHO !opnum!. Sign "%capp%.apk" using last created certificate
set /a opnum=opnum+1
ECHO !opnum!. Decompile "%capp%.apk"
if exist "%~dp0\projects\%capp%" (
set /a opnum=opnum+1
ECHO !opnum!. Compile "%capp%" folder
)
set choice=0
@echo:
set /p choice=Type the number of an option: 
if '!choice!'=='1' goto new
if '!choice!'=='2' goto update
if '!choice!'=='3' goto decompile
if exist "%~dp0\projects\%capp%" (
if '!choice!'=='4' goto compile
cls
goto start
)
) else (
set /a opnum=opnum+1
ECHO !opnum!. Sign "%capp%_%already%.apk" with a new certificate
set /a opnum=opnum+1
ECHO !opnum!. Sign "%capp%_%already%" using last created certificate
set /a opnum=opnum+1
ECHO !opnum!. Decompile "%capp%.apk"
if exist "%~dp0\projects\%capp%" (
set /a opnum=opnum+1
ECHO !opnum!. Compile "%capp%" folder
)
@echo:
set /p choice=Type the number of an option: 
if '!choice!'=='1' goto newcompiled
if '!choice!'=='2' goto updatecompiled
if '!choice!'=='3' goto decompile
if exist "%~dp0\projects\%capp%" (
if '!choice!'=='4' goto compile
)
cls
goto start
)
:new
cd "%~dp0\bin"
cls
openssl genrsa -out key.pem 1024
openssl req -new -key key.pem -out request.pem
openssl x509 -req -days 9999 -in request.pem -signkey key.pem -out certificate.pem
openssl pkcs8 -topk8 -outform DER -in key.pem -inform PEM -out key.pk8 -nocrypt
java -jar SignApk.jar certificate.pem key.pk8 "%~dp0\place-apk-here\%capp%.apk" "%~dp0\place-apk-here\%capp%_signed.apk"
jarsigner -verify -verbose -certs "%~dp0\place-apk-here\%capp%_signed.apk"
zipalign 4 "%~dp0\place-apk-here\%capp%_signed.apk" "%~dp0\place-apk-here\%capp%_signed_zipaligned.apk"
goto endsign
:update
cd "%~dp0\bin"
cls
java -jar SignApk.jar certificate.pem key.pk8 "%~dp0\place-apk-here\%capp%.apk" "%~dp0\place-apk-here\%capp%_signed.apk"
jarsigner -verify -verbose -certs "%~dp0\place-apk-here\%capp%_signed.apk"
zipalign 4 "%~dp0\place-apk-here\%capp%_signed.apk" "%~dp0\place-apk-here\%capp%_signed_zipaligned.apk"
:endsign
if exist "%~dp0\place-apk-here\%capp%_signed.apk" (
del "%~dp0\place-apk-here\%capp%_unsigned.apk"
) else (
COLOR 0C
@echo:
echo an error occurred, can't sign apk
@echo:
echo you may try again... 
Pause
Cls
COLOR 0A
goto start
)
cls
if exist "%~dp0\place-apk-here\%capp%_signed_zipaligned.apk" (
del "%~dp0\place-apk-here\%capp%_signed.apk"
set message=%capp%_signed_zipaligned.apk" created in "place-apk-here" folder.
) else (  
set message=ADB was not found, "%capp%" was not ZipAligned... Please include ADB in Environment Variable "PATH".
set message2="%capp%_signed.apk" created in "place-apk-here" folder.
)
goto start
:decompile
cls
java -jar "%~dp0\bin\apktool.jar" %1 %2 %3 %4 %5 %6 %7 %8 %9 d "%~dp0\place-apk-here\%capp%.apk" "%~dp0\projects\%capp%"
set message="%capp%" folder can be found in "projects"
cls
goto start
:compile
if exist "%~dp0\place-apk-here\%capp%_signed_zipaligned.apk" (
del "%~dp0\place-apk-here\%capp%_signed_zipaligned.apk"
)
cls
java -jar "%~dp0\bin\apktool.jar" %1 %2 %3 %4 %5 %6 %7 %8 %9 b "%~dp0\projects\%capp%" "%~dp0\place-apk-here\%capp%_unsigned.apk"
cls
if exist "%~dp0\place-apk-here\%capp%_unsigned.apk" (
set message="%capp%_unsigned.apk" created in "place-apk-here" folder
) else (
COLOR 0C
@echo:
echo an error occurred, can't sign apk
@echo:
echo you may try again... 
Pause
Cls
COLOR 0A
goto start
)
goto start
:newcompiled
cd "%~dp0\bin"
cls
openssl genrsa -out key.pem 1024
openssl req -new -key key.pem -out request.pem
openssl x509 -req -days 9999 -in request.pem -signkey key.pem -out certificate.pem
openssl pkcs8 -topk8 -outform DER -in key.pem -inform PEM -out key.pk8 -nocrypt
java -jar SignApk.jar certificate.pem key.pk8 "%~dp0\place-apk-here\%capp%_%already%.apk" "%~dp0\place-apk-here\%capp%_signed.apk"
jarsigner -verify -verbose -certs "%~dp0\place-apk-here\%capp%_signed.apk"
zipalign 4 "%~dp0\place-apk-here\%capp%_signed.apk" "%~dp0\place-apk-here\%capp%_signed_zipaligned.apk"
goto endsign
:updatecompiled
cd "%~dp0\bin"
cls
java -jar SignApk.jar certificate.pem key.pk8 "%~dp0\place-apk-here\%capp%_%already%.apk" "%~dp0\place-apk-here\%capp%_signed.apk"
jarsigner -verify -verbose -certs "%~dp0\place-apk-here\%capp%_signed.apk"
zipalign 4 "%~dp0\place-apk-here\%capp%_signed.apk" "%~dp0\place-apk-here\%capp%_signed_zipaligned.apk"...
goto endsign
:exit
PAUSE
exit