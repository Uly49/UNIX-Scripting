#!/bin/bash
echo Running $0
echo
directory=$1



echo The oldest file in $directory is:
ls -rt $directory | head -n 1 | gawk '{print $NF}'




















echo
echo Finished Running $0
