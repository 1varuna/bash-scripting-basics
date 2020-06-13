#!/bin/bash
a=4
if [ $a -gt 4 ]; then
	echo $a is greater than 4!
else
	echo $a is not greater than 4!
fi
echo
# Comparison using regular expressions
echo -e Using Regular Expressions in Bash "\n"
b="This is my string 123"
if [[ $b =~ [0-9]+ ]]; then
	echo "There are numbers in this string : $b"
else
	echo "there are no numbers in this string: $b"
fi

# Using a while loop
echo -e While Loop usage "\n"
i=0
while [ $i -le 10 ]; do
	echo i:$i
	((i++))
done
echo

# Using an until loop
echo -e until Loop usage "\n"
j=0
until [ $j -ge 10 ]; do
	echo j:$j
	((j++))
done
echo


# Using a for loop
echo -e for Loop usage "\n"
#k=0
#for k in  ["1" "2" "3"]
#for k in  {1..5..2}
#for (( k=0;k<=5;k=k+2 ))
k_arr=("volkswagon" "skoda" "audi" "mercedes")
for k in ${k_arr[@]}
do
	echo $k
done
echo

# Working with associative arrays using for loops
echo For loops and associative arrays

declare -A k_arr2
k_arr2["name"]="Varun Anand"
k_arr2["id"]="1395"
for l in ${!k_arr2[@]}
do
	echo "$l : ${k_arr2[$l]}"
done
echo
# Using command line options to loop through
#echo Printing the contents of $(pwd)
#for m in $(ls)
#do
#	echo $m
#done
echo

# Using case statements in bash
echo -e Using case statements in bash "\n"
#case_word=("dog" "cat")
case_word="dog"
case $case_word in
	cat) echo Feline;;
	dog|puppy) echo Canine;;
	*) echo No match! ;;
esac
echo

# Writing functions in bash
function greet {
	echo -e Hello there! "\n"
}

echo -e Using the greet function without arguments
greet
# Writing functions with arguments in bash
function greet2 {
	echo -e Hi $1! What a great $2!"\n"
}

echo -e Using the greet function with multiple arguments
greet2 Varun Evening
greet2 Everyone Morning

echo -e numberthings function "\n"
function numberthings {
	i=1
	for f in $@; do
		echo $i: $f
		((i+=1))
	done
	echo -e "\n"
}

echo -e Using numberthings function to list contents of $(pwd) directory
numberthings $(ls)

echo -e Using numberthings function to list names of cities
numberthings "Bristol" "Cambridge" "London" "Manchester"
echo END OF CHAPTER 3
