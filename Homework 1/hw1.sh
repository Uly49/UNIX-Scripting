#!/bin/bash
echo
echo Running: $0
echo

#Test if the same file was entered twice
if test $1 == $2
then
	echo ERROR: These are the same files
	echo Please enter two different files
	exit
fi

#Test if files exist
if test -e $1
then
	:
else
	echo ERROR: $1 does not exist
	echo Please enter files that exist
	exit
fi

if test -e $2
then
	:
else
	echo ERROR: $2 does not exist
	echo Please enter files that exist
	exit
fi

#Test if files are regular
if test -f $1
then
	:
else
	echo ERROR: $1 is not a regular file
	echo Please enter regular files
	exit
fi

if test -f $2
then
	:
else
	echo ERROR: $2 is not a regular file
	echo Please enter regular files
	exit
fi

#Test if files are readable
echo
if test -r $1
then
	:
else
	echo ERROR: You do not have read permissions for $1
	exit
fi

if test -r $2
then
	:
else
	echo ERROR: You do not have read permissions for $2
	exit
fi

#Print names of files
echo First file entered: $1
echo Second file entered: $2
echo

#Print sizes of files
echo Size of $1 and $2 in bytes:
wc -c $1
wc -c $2
echo

#Test if files are writeable
if test -w $1
then
	echo You have write permissions for $1
else  
	echo You do not have write permissions for $1
fi

if test -w $2
then
	echo You have write permissions for $2
else
	echo You do not have write permissions for $2
fi
echo

#Test if files are executable
if test -x $1
then
	echo You have execute permissions for $1
else
	echo You do not have execute permissions for $1
fi

if test -x $2
then
	echo You have execute permissions for $2
else
	echo You do not have execute permissions for $2
fi
echo

#Guess contents of files
echo Estimated contents of files are:
file $1
file $2
echo

#Compare sizes of files
size1=$(stat -c%s $1)
size2=$(stat -c%s $2)
if test $size1 -eq $size2
then
	echo $1 and $2 are the same size
else
	echo $1 and $2 are not the same size
fi

if test $size1 -gt $size2
then
	echo $1 is larger than $2
else
	echo $2 is larger than $1
fi
echo

#Compare age of files
if test $1 -nt $2
then
	echo $1 is newer than $2
else
	echo $2 is newer than $1
fi
echo

echo
echo Finished running: $0
