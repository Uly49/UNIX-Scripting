#!/bin/bash
#Ulysses Palomar
#CSCI 275
#Anthony Aiello
#11/21/2022

echo Running: $0
data=/home/student/Classes/Cs275/files/log


usageMessage() {
	echo
	echo "Options:"
	echo "-a (host) counts the number of times a host has been logged into"
	echo "-b (login) counts the number of times a provided login has logged in"
	echo "-c (login) displays all the log lines for a provided login"
	echo "-d (host) displays all the log lines for a provided host"
	echo "-h displays a usage message"
	echo "-i runs program interactively"
	echo
}


while getopts "a:b:c:d:hi" opt; do
	case $opt in
		a)
			echo "-a: counts the number of times a host has been logged into"
			host=$OPTARG
			grep -i $host $data | grep -i "logged in" > t0.tmp
			loginCount=$(wc -l < t0.tmp)
			echo "The total number of times this $host has been logged into is: $loginCount"
			rm t0.tmp
			;;
		b)
			echo "-b (login) counts total logins for provided login"
			user=$OPTARG
			grep -i $user $data | grep -i "logged in" > t1.tmp
			loginCount=$(wc -l < t1.tmp)
			echo "The total number of logins for $user is : $loginCount"
			rm t1.tmp
			;;
		c)
			echo "-c (login) displays all the log lines for a provided login"
			user=$OPTARG
			grep -i $user $data > t0.tmp
			echo "These are all log lines for $user:"
			cat t0.tmp
			rm t0.tmp
			;;
		d)
			echo "-d (host) displays all the log lines for a provided host"
			host=$OPTARG
			grep -i $host $data > t0.tmp
			echo "These are all the log lines for $host:"
			cat t0.tmp
			rm t0.tmp
			;;
		h)
			echo "-h displays usage message:"
			usageMessage
			;;
		i)
                        echo "-i provides an interactive menu:"
			echo "-a counts the number of times a host has been logged into"
			echo "-b (login) counts the number of times a provided login has logged into"
			echo "-c (login) displays all the log lines for a provided login"
			echo "-d (host) displays all the log lines for a provided host"
			echo "-h displays a usage message (how to use script noninteractively"
			echo "-i provides an interactive menu"
                        echo
                        read -p "Which option would you like (use dash with option)? " option passedArgument

                        if [ -z $passedArgument ]
                        then
                                ./hw3.sh $option

                        elif [ -n $passedArgument ]
                        then
                                ./hw3.sh $option $passedArgument

                        fi
                        ;;
		*)
			;;


		esac
	done



echo Finished running: $0
