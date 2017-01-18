#!/bin/bash

listetmp=`date +%s`_film_liste_tmp.html
[[ ! -z \`ps axf | grep midori | grep -v grep \` ]] && killall midori

cat /home/pi/html/header > /tmp/$listetmp

for var in `ssh berzerking@192.168.0.101 "ls -alrt  /DATA_SMB/TMP/| grep -Ei 'avi$|mkv$|mp4$'| tail -n 3"| awk '{print $9}'`
	do
		echo  "<div> $var </div>"  >> /tmp/$listetmp
	done

open_html.sh  /tmp/$listetmp




