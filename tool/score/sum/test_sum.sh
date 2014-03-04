#!/bin/bash

PROBLEM='sum';
NUMTEST=5;

source ./config.sh

function markProb () {
	if [ $# -ne 1 ]; then return 0; fi;
	
	cd ./tmp;	
	cp "$1" -f -t ./;
	
	score=0;
	for (( i = 1; i <= $NUMTEST; i++ )); do 
		echo -e "\ttest $i :" >> "$log_file" 2>&1;
		rm ./$PROBLEM.out -f;
		
		cp "$input_dir/$i.in" -f "./$PROBLEM.in"
		cp "$output_dir/$i.out" -f "./$PROBLEM.correct"
		
		php -f $PROBLEM.php >> "$log_file" 2>&1
		res=$?;
		
		if [ "$res" -eq 0 -a -f "$PROBLEM.out" ]; then
			diff ./$PROBLEM.out ./$PROBLEM.correct >> "$log_file" 2>&1
			if [ $? -eq 0 ]; then 
				echo -e "\t\tOK" >> "$log_file" 2>&1;
				score=$(($score + 1)); 
			fi
		fi;
	done;
	
	cd - > /dev/null;
	return $score;
}

rm -Rf ./tmp;
mkdir ./tmp;
[ -d `dirname "$log_file"` ] || mkdir -p `dirname "$log_file"`;

for user in `ls "$USER_PATH"`; do
	user_dir="$USER_PATH/$user";
	prob="$user_dir/${PROBLEM}.php";
	
	echo "============= $user :" >> "$log_file" 2>&1;

	if [ ! -d "$user_dir" -o ! -f "$prob" ]; then continue; fi;
	
	if [ -f "$prob" ]; then 
		markProb "$prob";
		userScore=$?;
		
		echo "$user $userScore";
	fi
done;

