#!/bin/bash


source /home/pi/.mysql_authentification


#all_affiche (){
num_affiche (){

re='^[0-9]+$'


if ! [[ $$3 =~ $re ]]
	then
		echo "je n'ai pas compris le numéro de tache"
	else
	
	WHAT="$(Mselect.sh "select what FROM JARVIS.todolist where id=$1"| grep -v what)"
	DESC="$(Mselect.sh "select description FROM JARVIS.todolist where id=$1" | grep -v description)"

	if [[ "$2" == 'what' ]]
		then
			echo "la tache numéro $1 est ${WHAT}"
	fi
	if [[ "$2" == 'desc' ]]
		then
			echo "la tache numéro $1 est  ${WHAT} et contient ${DESC}"
	fi
	fi


}








if [[  "$2" == 'all' ]]
	then
		all_affiche

fi
if [[  "$2" == 'desc' ]]
	then

		NUM=`trans_num.sh $1`
		num_affiche "$NUM" "$2" "$1"
fi
if [[  "$2" == 'what' ]]
	then

		NUM=`trans_num.sh $1`
		num_affiche "$NUM" "$2" "$1"
fi






