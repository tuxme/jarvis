#!/bin/bash
source /home/pi/.mysql_authentification
mysql -u${MUSER} -p${MPASS} -h ${MSERV} -e "$1"
