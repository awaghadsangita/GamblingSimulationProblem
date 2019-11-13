#!/bin/bash -x

read -p "Read Number of Days :"total_days
inital_stake=100
bet=1

function  betResult()
{
	betValue=$((RANDOM%2))
	if [ $betValue -eq 1 ]
	then
		result="WIN"
	else
		result="LOOSE"
	fi
	echo $result
}

bet_result="$( betResult )"

