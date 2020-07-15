#! /bin/bash -x

#CONSTANTS
START=0;
ROW=2;
COLUMN=2;
HEAD=0;
TALE=1;

#ARRAY
declare -a playBoard;

function reset(){

player=$((START));
for((columnIndex=0;columnIndex<=$COLUMN;columnIndex++))
do
	for((rowIndex=0;rowIndex<=$ROW;rowIndex++))
	do
		playBoard[$rowIndex,$columnIndex]='BLANK';
	done
done
echo "Board Resetted";
}

function tossCoin(){
toss=$((RANDOM%2));
case $toss in 
	$HEAD)
			selectionSymbol;;
	$TALE)
			alottedSymbol;;
		*)
			echo "Wrong Turn";;
esac
}

function selectionSymbol(){

read -p "Choose a Symbol 'X' or 'O':" playerSymbol;
if [[ $playerSymbol =~ 'X' || $playerSymbol =~ 'x' ]]
then
	computerSymbol='O';
elif [[ $playerSymbol =~ 'O' || $playerSymbol =~ 'o' ]]
then
	computerSymbol='X';
fi
$(winTieNextMove $playerSymbol $computerSymbol)
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
 echo "player symbol:" $playerSymbol "computer symbol:" $computerSymbol;
$(winTieNextMove $playerSymbol $computerSymbol)

}

function displayBoard(){

for((columnIndex=0;columnIndex<=$COLUMN;columnIndex++))
do
   for((rowIndex=0;rowIndex<=$ROW;rowIndex++))
   do
      echo ${playBoard[$rowIndex,$columnIndex]};
   done
done

}

function winTieNextMove(){

computerSymbol=$2;
playerSymbol=$1;

if [[ (${playBoard[0,0]} -eq ${playBoard[0,1]} && ${playBoard[0,1]} -eq ${playBoard[0,2]}) || (${playBoard[0,0]} -eq ${playBoard[1,0]} && ${playBoard[1,0]} -eq ${playBoard[2,0]}) ]]
	then
		echo "You Win";
elif [[ (${playBoard[1,0]} -eq ${playBoard[1,1]} && ${playBoard[1,1]} -eq ${playBoard[1,2]}) || (${playBoard[0,1]} -eq ${playBoard[1,1]} && ${playBoard[1,1]} -eq ${playBoard[2,1]}) ]]
	then
		echo "You Win";
elif [[ (${playBoard[2,0]} -eq ${playBoard[2,1]} && ${playBoard[2,1]} -eq ${playBoard[2,2]}) || (${playBoard[0,2]} -eq ${playBoard[1,2]} && ${playBoard[1,2]} -eq ${playBoard[2,2]}) ]]
	then
		echo "You Win";
elif [[ (${playBoard[0,0]} -eq ${playBoard[1,1]} && ${playBoard[1,1]} -eq ${playBoard[2,2]}) || (${playBoard[0,2]} -eq ${playBoard[1,1]} && ${playBoard[1,1]} -eq ${playBoard[2,0]}) ]]
	then
		echo "You Win";
elif [[ (${playBoard[0,0]} -eq ${playBoard[0,1]} || ${playBoard[0,1]} -eq ${playBoard[0,2]}) && (${playBoard[0,0]} -eq ${playBoard[1,0]} || ${playBoard[1,0]} -eq ${playBoard[2,0]}) ]]
   then
      echo "Game Tie";
elif [[ (${playBoard[1,0]} -eq ${playBoard[1,1]} || ${playBoard[1,1]} -eq ${playBoard[1,2]}) && (${playBoard[0,1]} -eq ${playBoard[1,1]} || ${playBoard[1,1]} -eq ${playBoard[2,1]}) ]]
   then
      echo "Game Tie";
elif [[ (${playBoard[2,0]} -eq ${playBoard[2,1]} || ${playBoard[2,1]} -eq ${playBoard[2,2]}) && (${playBoard[0,2]} -eq ${playBoard[1,2]} || ${playBoard[1,2]} -eq ${playBoard[2,2]}) ]]
   then
      echo "Game Tie";
elif [[ (${playBoard[0,0]} -eq ${playBoard[1,1]} || ${playBoard[1,1]} -eq ${playBoard[2,2]}) && (${playBoard[0,2]} -eq ${playBoard[1,1]} || ${playBoard[1,1]} -eq ${playBoard[2,0]}) ]]
   then
      echo "Game Tie";
else
	echo "You Lost";
fi
}




reset
tossCoin
displayBoard
winTieNextMove
