@echo off
if "%location%"=="EucalyptusTree" (
    set /a hunger=%hunger%+30
    if %hunger% gtr 100 set "hunger=100"
    echo You eat the leaves and feel refreshed!
    :: Remove leaves from inventory
    findstr /v /i "leaves" Inventory.txt > temp.txt
    move /y temp.txt Inventory.txt >nul
    if %hunger% geq 100 (
        cls
        echo Your hunger is satisfied! You’ve won Koala Quest!
        echo Final Life: %life%
        pause
        exit
    )
) else (
    echo You can’t eat the leaves here; you need to be at the Eucalyptus Tree.
)
exit /b