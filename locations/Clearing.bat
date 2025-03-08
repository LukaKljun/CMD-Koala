@echo off
cls
echo A small clearing in the forest. It is peaceful here.
if defined clearing_path_opened (
    echo Exits: west to Forest, east to Eucalyptus Tree (path revealed)
    set "valid_exit_west=Forest"
    set "valid_exit_east=EucalyptusTree"
) else (
    echo Exits: west to Forest (more exits may be revealed)
    set "valid_exit_west=Forest"
)
echo Items: none
exit /b