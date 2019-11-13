#!/bin/bash -x

read -p "Read Number of Days :" totalDays
inital_stake=100
bet=1

function betResult()
{
	for(( counter=1; counter<=$totalDays; counter++ ))
	do
		read -p "Enter the Number of Game" totalGame
		for(( j=1; j<=$totalGame; j++ ))
		do
			betValue=$((RANDOM%2))
			if [ $betValue -eq 1 ]
			then
				initial_stake=$((initial_stake+1))	
				result="WIN"
			else
				initial_stake=$((initial_stake-1))
				result="LOOSE"
			fi
		done
		initial_stake=$((initial_stake+100))
	done
}

bet_result="$( betResult )"

