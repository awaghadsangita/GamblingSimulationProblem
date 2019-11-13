#!/bin/bash -x

read -p "Read Number of Days :" totalDays
inital_stake=100
bet=1

function calculatePercentage()
{
	value=$1
	percentage=$((value*50/100))
	echo $percentage
}
function betResult()
{
	for(( counter=1; counter<=$totalDays; counter++ ))
	do
		read -p "Enter the Number of Game" totalGame
		maxPercentage="$( calculatePercentage $((initial_stake)) )"
		maxPercentage=$((maxPercentage+initial_stake))
		if [ $totalGame -gt 100 ]
		then
			echo "sorry you can not play more than 100 game"
			read -p "Enter the Number of Game" totalGame
		fi
		if [ $totalGame -lt 100 ]
		then

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
				if [ $initial_stake -gt $maxPercentage ]
				then
					break;
				fi
			done
			initial_stake=$((initial_stake+100))
		fi
	done
}

bet_result="$( betResult )"

