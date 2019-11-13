#!/bin/bash -x

read -p "Read Number of Days :" totalDays
initial_stake=100
final_stake=100
bet=1
winValue=0
looseValue=0
two=2
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
		percentage="$( calculatePercentage $final_stake )"
		maxWinPercentage=$(( $percentage+$final_stake ))
		maxLoosePercentage=$(( $percentage-$final_stake ))
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
					((winValue++))
					final_stake=$(($final_stake+1))	
					total_winAmount=$(( $final_stake-$initial_stake ))
					result="WIN"
				else
					((looseValue++))
					final_stake=$(($final_stake-1))
					total_looseAmount=$(( $final_stake-$initial_stake ))
					result="LOOSE"
				fi
				if [ $final_stake > $maxWinPercentage ] || [ $final_Stake  < $maxLoosePercentage ]
				then
					break
				fi
			done
			final_stake=$((final_stake+100))
		fi
		if [ $counter -eq 20 ]
		then
			total_amount_after_20Days=$final_stake
			total_winValue_after_20Days=$total_winAmount
			total_looseValue_After_20Days=$total_looseAmount
		fi
	done
}

bet_result="$( betResult )"

