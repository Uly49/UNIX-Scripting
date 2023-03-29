#!/bin/bash
# find file with longest filename
echo Running $0

echo -n "What directory would you like to search through: "
read directory
shortestName=255

for file in $directory/*;
do
    file=`echo -n $file | sed s,$directory/,,`
    size=`echo -n $file | wc -c`             # get filename length
    if [ $size -lt $shortestName ];
    then
        shortestName=`expr $size`      # reduce by 1 for carriage return
        shortName=$file
    fi
done

echo $shortestName:  $shortName














echo Finished Running $0
