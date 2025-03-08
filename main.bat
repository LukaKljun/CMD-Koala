@echo off
title Koala Quest
color 0A
setlocal EnableDelayedExpansion

:START
cls
echo Welcome to Koala Quest!
echo You are a koala in search of eucalyptus leaves. Your stomach growls, and you must find food to survive.
echo Commands: look, go [direction], take [item], inventory, eat (at Eucalyptus Tree), quit
echo.
echo Press any key to begin your journey...
pause >nul

:: Initialize stats and inventory
echo life=100> PlayerData.txt
echo hunger=100>> PlayerData.txt
::restarta inventory
echo. > Inventory.txt

set "location=Forest"

:GAMELOOP
:: Load stats
::explain next line of code in this comment -> next line does a for loop to read the PlayerData.txt file and set the variables to the values in the file
for /f "tokens=1,2 delims==" %%a in (PlayerData.txt) do set "%%a=%%b"

:: Display stats
echo Life: %life%  Hunger: %hunger%
echo Location: %location%
echo.
echo press any key to continue...
pause >nul
:: Clear previous valid exits
set "valid_exit_north="
set "valid_exit_east="
set "valid_exit_south="
set "valid_exit_west="
call locations\%location%.bat
echo.
set "command="
set /p command="> "

:: Survival mechanics: decrease stats each turn only if command is a go command
if "%command:~0,2%"=="go" (
    if defined valid_exit_%direction% (
        set /a hunger=%hunger%-5
        if %hunger% leq 0 set /a life=%life%-10
        if %life% leq 0 goto :GAMEOVER
    )
)

:: Update stats file
echo life=%life%> PlayerData.txt
echo hunger=%hunger%>> PlayerData.txt

:: Parse commands
if /i "%command%"=="look" goto :GAMELOOP
if /i "%command:~0,2%"=="go" call :MOVE "%command:~3%"
if /i "%command:~0,4%"=="take" call :TAKE "%command:~5%"
if /i "%command%"=="inventory" call :SHOW_INVENTORY
if /i "%command%"=="eat" call :EAT
if /i "%command%"=="quit" call :QUIT
::command use item
if /i "%command:~0,3%"=="use" call :USE "%command:~4%"

goto :GAMELOOP

:GAMEOVER
    cls
    echo You have died. Game over.
    pause
    exit

:MOVE
    set "direction=%~1"
    if defined valid_exit_%direction% (
        set "location=!valid_exit_%direction%!"
    ) else (
        echo Invalid direction.
    )
    goto :GAMELOOP

:TAKE
    set "item=%~1"
    if defined available_%item% (
        echo %item%>> Inventory.txt
        set "available_%item%="
        echo You take the %item%.
    ) else (
        echo There is no %item% here.
    )
    goto :GAMELOOP

:SHOW_INVENTORY
    cls
    echo Inventory:
    type Inventory.txt
    pause
    goto :GAMELOOP

:EAT
    if "%location%"=="EucalyptusTree" (
        if "eucalyptus leaves"=="%item%" (
            set /a hunger=%hunger%+30
            echo You eat the eucalyptus leaves and feel satisfied.
        ) else (
            echo You can't eat that here.
        )
    ) else (
        echo You can't eat here.
    )
    goto :GAMELOOP

:USE
    set "item=%~1"
    if not defined item (
        echo What do you want to use? Type "use [item]".
        pause
        goto :GAMELOOP
    )
    :: Check if item is in inventory
    set "has_item="
    for /f "tokens=*" %%i in (Inventory.txt) do (
        if /i "%%i"=="%item%" set "has_item=1"
    )
    if defined has_item (
        if exist "items\%item%.bat" (
            call "items\%item%.bat"
        ) else (
            echo You can not use the %item% like that.
        )
    ) else (
        echo You don not have a %item% in your inventory.
    )
    pause
    goto :GAMELOOP

:QUIT
    exit /b


