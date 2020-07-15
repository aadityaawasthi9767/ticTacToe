#! /bin/bash -x

#variables
START=0;
ROW=2;
COLUMN=0;

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
reset
