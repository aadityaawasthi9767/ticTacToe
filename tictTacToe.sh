#! /bin/bash

#CONSTANTS
START=0;
ROW=2;
COLUMN=2;
HEAD=0;
TAIL=1;

#ARRAY
declare -a playBoard;

function reset(){

player=$((START));
for((rowIndex=0;rowIndex<=$ROW;rowIndex++))
do
	for((columnIndex=0;columnIndex<=$COLUMN;columnIndex++))
	do
		playBoard[$rowIndex,$columnIndex]=0;
	done
done
echo "Board Resetted";
}

function tossCoin(){
toss=$((RANDOM%2));
case $toss in 
	$HEAD)
			selectionSymbol;;
	$TAIL)
			alottedSymbol;;
		*)
			echo "Wrong Turn";;
esac
}

function selectionSymbol(){

read -p "Choose a Symbol 'X' or 'O':" playerSymbol;
if [[ $playerSymbol =~ 'X' ]]
then
	computerSymbol='O';
elif [[ $playerSymbol =~ 'O' ]]
then
	computerSymbol='X';
fi
 echo "player symbol:" $playerSymbol;
 echo "computer symbol:" $computerSymbol;
}

function alottedSymbol(){

check=$((RANDOM%2))
if [[ $check -eq 0 ]]
then
	computerSymbol='O';
	playerSymbol='X';
elif [[ $check -eq 1 ]]
then
	computerSymbol='X';
	playerSymbol='O';
fi
 echo "player symbol:" $playerSymbol;
 echo "computer symbol:" $computerSymbol;
}

reset
tossCoin
