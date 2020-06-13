#!/bin/bash

# This is a basic bash script

#ls 

greeting="hello"

echo $greeting, world \(planet\)!

echo '$greeting, world (planet)!'

echo "$greeting, world (planet)!"

declare -i d=123	# d is an integer
declare -r e=456	# e is read only
declare -l f="LOLcats"	# f is lolcats
declare -u g="LOLcats"	# f is LOLCATS

echo "$f is all lower case "
echo "$g is all upper case"

echo "Home is $HOME"
echo "PWD is $PWD"
echo "Machine type is $MACHTYPE"
echo "Host name is $HOSTNAME"
echo "Bash version in use is $BASH_VERSION"
echo "Bash session has been running for $SECONDS seconds"
echo "Name of the script is $0"

pwd_var=$(pwd)
echo "Printing PWD: $pwd_var"

a=$(ping -c 1 example.com | grep 'bytes from' | cut -d = -f 4)
echo "This ping was $a"

x=2
y=$((x+2))
echo "x is $x x+2 is $y"
echo
f=$((1/3))
echo $f
g=$(echo 1/3 | bc -l)
echo $g
echo

[[ "cat" == "dog" ]]
echo $?

[[ "cat" == "cat" ]]
echo $?

[[ 20 -gt 100 ]]
echo $?

a=""
b="dog"
[[ -z $a && -n $b ]]	# z - checks if the string is null or not (-n)
echo $?

flashred=$(tput setab 0; tput setaf 1; tput blink)
red=$(tput setab 0; tput setaf 1)
none=$(tput sgr0)
echo -e $flashred"ERROR: "$none$red"Something went wrong."$none

printf "Name:\t%s\nID:\t%05d\n" "Varun Anand" "1395"

today=$(date +"%d-%m-%Y")
time=$(date +"%H:%M:%S")
printf -v new_v "Current User:\t%s\nDate:\t\t%s @ %s\n" $USER $today $time
echo "$new_v"

# creating an associative array
declare -A myarray
myarray[color]=blue
myarray["office building"]="HQ West"

echo ${myarray["office building"]} is ${myarray[color]}
echo

# Reading a file
i=1
while read f; do
	echo "Line $i: $f"
	((i++))
done < file.txt

# Example of a here document
cat <<- EndOfText
	This is a
		multiline
	text string
EndOfText

# Using here documents to upload/retrieve files from ftp
ftp -n <<- DoneWithTheUpdate
	open mirrors.xmission.com
	user anonymous nothinghere
	ascii
	cd gutenburg
	get GUTINDEX.01
	bye
DoneWithTheUpdate

echo -e END OF CHAPTER 2
