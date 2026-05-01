@echo off
setlocal enabledelayedexpansion

set "ver=1.0"
set "jsonFile=apps.json"
set "rootName=%~1"
set "appID=%~n1"
set "executeKey=8b69y123"

echo [INFO OF THE EXECUTER]
echo Version: %ver%
echo Password: %executeKey%
echo.
echo Initializing... Please Wait...
echo ^(The speed usually depends on the computer's performance...^)

if "%~1"=="" (
    goto WARNONE
) else if "%~1"=="Menu_einstein-arena" (
    goto Menu
)

if not "%~2"=="%executeKey%" (
    cls
    echo [ERROR]
    echo The signature or key is invalid for the executer to start.
    echo.
    echo Press any key to exit...
    pause > nul
    exit
) else (
    goto ok
)

:ok
set "name="
set "web="
set "data="

for /f "tokens=1,2 delims==" %%I in ('powershell -Command "$json = Get-Content '%jsonFile%' -ErrorAction SilentlyContinue | ConvertFrom-Json; $app = $json.'%appID%'; if($app){echo name=$($app.name); echo web=$($app.web); echo data=$($app.data)}" ') do set "%%I=%%J"

if not "%name%"=="" (
    cls
    echo Please be patient... Starting %name%
    echo Data/App located in: %data%
    ping localhost -n 5 > nul
    start msedge --app="%web%" --user-data-dir="%data%"
    exit
)

if "%name%"=="" (
    cls
    echo [ERROR]
    echo Your executer cannot find any of the applications added from apps.json.
    echo Please check in apps.json to add your required application in a specified format given in Executer Menu.
    echo.
    echo Press any key to exit...
    pause > nul
    exit /b
)

goto WARNTWO

:WARNONE
cls
echo [WARNING]
echo This is the excecuter.
echo Without any file executing this, you are not allowed.
echo Please open (Any kind of name of the application given in apps.json).cmd to open it.
echo Or else open apps.json and check or add a new application in a specified format given in Executer Menu.
echo.
echo Press any key to exit...
pause > nul
exit

:WARNTWO
cls
echo [WARNING]
echo This is the excecuter.
echo Please open Legacy.cmd (Any kind of name of the app given in the YUVO Applications Manager) to open it.
echo Or else open apps.json and check or add a new application in a specified format given in Executer Menu.
echo.
echo Press any key to exit...
pause > nul

:Menu
cls
echo Welcome to the
echo ======================================
echo           Executer's Menu
echo ======================================
echo.
echo What do you want to do? Enter the number set beside the given menus and press [ENTER].
echo     1. About
echo     2. List Applications
echo     3. Help
echo     4. Open Website (Github)
echo.
echo     5. Exit/Close
set /P selection=^> 

If /I '%selection%'=='1' goto Menu1
If /I '%selection%'=='2' goto Menu2
If /I '%selection%'=='3' goto Menu3
If /I '%selection%'=='4' start
If /I '%selection%'=='5' cls & echo Good Bye! & ping localhost -n 2 > nul & cls & exit

:Menu1
echo =========
echo   ABOUT
echo =========