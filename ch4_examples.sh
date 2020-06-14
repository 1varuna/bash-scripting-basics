#!/bin/bash

# This script deals with user inputs while running scripts

# Using a for loop to print out n number of user inputs
i=1
for n in $@
do
	echo Argument $i: $n
	((i+=1))
done

echo -e Total number of arguments received : $# "\n"

# Using getops function

while getopts :u:p:ab option; do
	case $option in
		u) user=$OPTARG;;
		p) pass=$OPTARG;;
		a) echo A flag enabled;;
		b) echo B flag enabled;;
		?) echo $OPTARG is an unknown flag!;;
	esac
done

echo User: $user / Pass: $pass

# Usage ./ch4_examples.sh -u username -p password
# optional flags a and b, they do not accept inputs

# Getting inputs when the script is running
echo Enter your name
# Uncomment below to check
#read name

echo Enter your pin code
# Uncomment below to check
#read -s pin	# s indicates silent, the input values are not shown

# Uncomment below to check
#read -p "Which country do you come from?" country

# Uncomment Lines 35, 39 and 42 to check

#echo -e "\t"Name:"\t"$name "\n \t"Pin:"\t"$pin "\n \t"Country of Origin:"\t"$country

# using select to choose from a list of values

#select city in "Bangalore" "Cambridge" "London" "Bristol"
#do
#	echo -e You selected $city!
#	break
#done


# using select to choose from a list of values

# Uncomment Lines 60-70 to check
#select cuisine in "Indian" "Italian" "Chinese" "Thai" "Exit menu"
#do
#	case $cuisine in
#		Indian) echo -e On menu: Indian Cuisine;;
#		Italian) echo -e On menu: Italian Cuisine;;
#		Chinese) echo -e On menu: Chinese Cuisine;;
#		Thai) echo -e On menu: Thai Cuisine;;
#		"Exit menu") echo -e Quitting menu "\n"; break;;
#		*) echo -e Not sure which cuisine you chose!;;
#	esac
#done

# Preventing getting an empty input from user
# Usage ./ch4_examples.sh <Name> <ID> <Number>

# Uncomment Lines 77-86 to check

#if [ $# -lt 3 ]; then
#	cat <<- EOM
#	This command requires three arguments:
#	username, userid and favorite number.
#	EOM
#else
#	echo Username is $1
#	echo User ID is $2
#	echo Favorite number is $3
#fi

# Preventing an empty response #2, provide a default answer for unselected option

# Uncomment Lines 92-97 to check

#read -p "Favorite Football Player?" player
#while [[ -z $player ]]; do
#	read -p " Name any player " player
#done
#
#echo -e your favorite player is $player "\n"


# Preventing an empty response #2, provide a default answer for unselected option

read -p "Favorite Football Player?" player
while [[ -z $player ]]; do
	player=Pele	# default value will be displayed	
done

echo -e your favorite player is $player "\n"

# Matching the user input to the expected number of inputs
read -p "What year? [nnnn]" year
while [[ ! $year =~ [0-9]{4} ]]; do
	read -p "A year, please! [nnnn]" year
done
echo -e "Selected year: $year"
