@echo off
if "%location%"=="Clearing" (
    if not defined clearing_path_opened (
        set "clearing_path_opened=1"
        echo You throw the stone at a noisy bird perched nearby. It flies off, revealing a hidden path west to the Eucalyptus Tree!
        :: Remove stone from inventory after use
        findstr /v /i "stone" Inventory.txt > temp.txt
        move /y temp.txt Inventory.txt >nul
    ) else (
        echo The path west is already open.
    )
) else (
    echo The stone doesn’t seem useful here.
)
exit /b