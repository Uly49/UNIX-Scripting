#!/bin/bash
echo Running $0
file=~/Cs275/finalReview/evinemeth.txt




tr -cs "a-zA-Z'-" "[\n*]" < "evinemeth.txt" > filter1.tmp
cat filter1.tmp | gawk ' { print tolower($1) } ' | sort -u | gawk ' 
{count[$1]++} END {for (item in count) printf"[$-15s]=%3s\n", item, count[item]} '







rm filter1.tmp


















echo Finished Running $0
