@echo off
cls
echo You are in a dense forest. The trees are tall and the underbrush is thick. Sunlight filters through the canopy above.
echo Exits: north to River, east to Clearing, south to Beach
echo Items: leaves, sticks
set "available_leaves=1"
set "available_sticks=1"   
set "valid_exit_north=River"
set "valid_exit_east=Clearing"
set "valid_exit_south=Beach"
exit /b