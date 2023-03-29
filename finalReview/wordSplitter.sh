#!/bin/bash
echo Running $0
file=~/Cs275/finalReview/evinemeth.txt



cat $file | tr [:space:] "\n" | 
tr -d [0-9] | 
tr -d ',' | 
tr -d '(' | 
tr -d ')' |
tr -d "'" |
tr -d '.' |
tr -d '"' |
tr '-' "\n" |
tr '–' "\n" |
tr -d ':' |
grep -v "^s*$"
#cat t0.tmp

























echo Finished Running $0
