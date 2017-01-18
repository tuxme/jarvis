#!/bin/bash


source /home/pi/.mysql_authentification


NAME=$(cat /tmp/todolist_name) 
DESC=$(cat /tmp/todolist_desc) 
mysql -u${MUSER} -p${MPASS} -h ${MSERV} -e "INSERT INTO JARVIS.todolist (what, description) VALUES ('${NAME}', '${DESC}');"


MAX=$(Mselect.sh "select max(id) FROM JARVIS.todolist" | grep -v max)

echo "la tache id ${MAX} a été insérée"
