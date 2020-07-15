#! /bin/bash -

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
			echo "Its HEAD! Its PLAYER Turn:";;
	$TAIL)
			echo "Its TAILS! Its COMPUTER Turn";;
	*)
			echo "Wrong Turn";;
esac
}


reset
tossCoin
