#!/bin/bash
echo Running: $0

data=/home/student/Classes/Cs275/files/log


usageMessage() {
	echo
	echo "Options:"
	echo "-h displays a usage message"
	echo "-a counts the number of total valid logins in the log"
	echo "-b counts the number of total invalid login attempts in the log"
	echo "-c (userID) counts the number of times a provided login has logged in"
	echo "-d (login) displays all the successful log lines for a provided login"
	echo "-e (login) displays all the log lines for a provided login"
	echo "-f (host) displays all the successful log lines for a provided host"
	echo "-g (host) displays all the log lines for a provided host"
	echo "-i runs the program interactively"
	echo "-j (remote IP address) displays all the successful log lines for a provided remote IP address"
	echo "–k (remote IP address) displays all the log lines for a provided remote IP address"
	echo "–m (remote IP address) displays all the IP addresses that were blocked by the hosts, uniquely sorted"
	#Option -s is optional
	echo "-s (date) restricts/filters search to a single date {optional}"
	echo "-t displays login information in a table (date, login, lab host, IP)"
	#Option -u is optional
	echo "-u (host) restricts search to a single host {optional}"
	echo
}


while getopts "abc:d:e:f:g:hij:k:m:" opt; do
	case $opt in
		a)
			echo "-a: count the number of total valid logins in the log"
			grep -i "logged in" $data > t0.tmp
			loginCount=$(wc -l < t0.tmp)
			echo "The total number of logins in this log is: $loginCount"
			rm t0.tmp
			;;
		b)
			echo "-b counts the number of total invalid login attempts in the log"
			grep -i "failed" $data > t0.tmp
			grep -i "login" t0.tmp > t1.tmp
			failedLogins=$(wc -l < t1.tmp)
			grep -i "password" t0.tmp > t2.tmp
			failedPasswords=$(wc -l < t2.tmp)
			totalFailed=$(($failedLogins+$failedPasswords))
			echo "The count of total invalid logins is: $totalFailed"
			rm t0.tmp
			rm t1.tmp
			rm t2.tmp
			;;
		c)
			echo "-c (userID) counts the number of times a provided login has logged in"
			user=$OPTARG
			grep -i $user $data > t0.tmp
			grep -i "logged in" t0.tmp > t1.tmp
			loginCount=$(wc -l < t1.tmp)
			echo "The total number of logins for $user is : $loginCount"
			rm t0.tmp
			rm t1.tmp
			;;
		d)
			echo "-d (login) displays all the successful log lines for a provided login"
			user=$OPTARG
			grep -i $user $data > t0.tmp
			grep -i "logged in" t0.tmp > t1.tmp
			echo "These are the successful logs for $user:"
			cat t1.tmp
			rm t0.tmp
			rm t1.tmp
			;;
		e)
			echo "-e (login) displays all the log lines for a provided login"
			user=$OPTARG
			grep -i $user $data > t0.tmp
			echo "These are all log lines for $user:"
			cat t0.tmp
			rm t0.tmp
			;;
		f)
			echo "-f (host) displays all the successful log lines for a provided host"
			host=$OPTARG
			grep -i $host $data > t0.tmp
			grep -i "logged in" t0.tmp > t1.tmp
			echo "These are the successful logins for $host:"
			cat t1.tmp
			rm t0.tmp
			rm t1.tmp
			;;
		g)
			echo "-g (host) displays all the log lines for a provided host"
			host=$OPTARG
			grep -i $host $data > t0.tmp
			echo "These are all the log lines for $host:"
			cat t0.tmp
			rm t0.tmp
			;;
		h)
			echo "-h displays a usage message"
			usageMessage
			;;
		i)
			echo "-i runs the program interactively"
			echo "(-a) counts the number of total valid logins in the log"
			echo "(-b) counts the number of total invalid login attempts in the log"
			echo "(-c) (userID) counts the number of times a provided login has logged in"
			echo "(-d) (login) displays all the successful log lines for a provided login"
			echo "(-e) (login) displays all the log lines for a provided login"
			echo "(-f) (host) displays all the successful log lines for a provided host"
			echo "(-g) (host) displays all the log lines for a provided host"
			echo "(-h) displays a usage message (how to use script noninteractively"
			echo "(-i) runs the program interactively"
			echo "(-j) (remote IP address) display all the successful log lines for a provided remote IP address"
			echo "(–k) (remote IP address) displays all the log lines for a provided remote IP address"
			echo "(–m) (remote IP address) displays all the IP addresses that were blocked by the hosts, uniquely sorted"
			echo "(-s) (date) restricts/filters search to a single date {optional}"
			echo "(-t) displays login information in a table (date, login, lab host, IP)"
			echo "(-u) (host) restricts search to a single host {optional}"
			echo
			read -p "Which option would you like (use dash with option)? " option passedArgument
				if [ -z $passedArgument ]
				then
					./extraWork.sh $option
				
				elif [ -n $passedArgument ]
				then
					./extraWork.sh $option $passedArgument
				
				fi
			;;
		j)
			echo "-j (remote IP address) displays all the successful log lines for a provided remote IP address"
			IPAddress=$OPTARG
			echo "These are all the successful log lines for $IPAddress:"
			grep $IPAddress $data | grep -i "logged in" | cat
			;;
		k)
			echo "–k (remote IP address) displays all the log lines for a provided remote IP address"
			IPAddress=$OPTARG
			echo "These are all the log lines for $IPAddress:"
			grep $IPAddress $data | cat
			;;
		m)
			echo "–m (remote IP address) displays all the IP addresses that were blocked by the hosts, uniquely sorted"
			IPAddress=$OPTARG
			echo "These are all the instances where $IPAddress was blocked:"
			grep $IPAddress $data | grep -i "blocked" | cat
			;;


		esac
	done


echo Finished running: $0
