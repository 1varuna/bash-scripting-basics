#!/bin/bash

# Using some variable
a=3
echo "a has a value $a"
echo
echo "Using commands subsititutions"
echo
name="Varun Anand"
bold="\033[1m"
flashred=$(tput setab 7; tput setaf 1; tput blink)
red=$(tput setab 1; tput setaf 7)
none=$(tput sgr0)
echo -e $bold$red"Name is "$none$flashred$bold"Varun Anand"$none

# Writing information into a file and then printing contents using cat
filename="justafilename"
echo -e "First entry into the $filename.txt @ $bold$flashred$(date)$none" > $filename.txt
echo
echo "Printing some system information @ $(date)"
echo -e "\t Username is $bold$red$HOSTNAME$none" >> $filename.txt
echo
echo -e "\t Machine Type is $MACHTYPE" >> $filename.txt
echo
echo -e "\t Bash Version in use is $BASH_VERSION" >> $filename.txt

echo "Printing the contents of $filename.txt"
echo
cat $filename.txt

