@echo off
if "%location%"=="Clearing" (
    if not defined clearing_path_opened (
        set "clearing_path_opened=1"
        echo You use the stick to clear a hidden path west to the Eucalyptus Tree!
        :: Remove stick from inventory after use
        findstr /v /i "stick" Inventory.txt > temp.txt
        move /y temp.txt Inventory.txt >nul
    ) else (
        echo The path west is already open.
    )
) else (
    echo The stick doesn’t seem useful here.
)
exit /b