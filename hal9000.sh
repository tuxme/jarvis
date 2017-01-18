#!/bin/bash

export DISPLAY=:0


red (){
	feh -x -g 192x266+$((816-192)) /home/pi/bin/img/button_red.png 
}
green (){
	feh -x -g 192x266+$((816-192)) /home/pi/bin/img/button_green.png 
}
blue (){
	feh -x -g 192x266+$((816-192)) /home/pi/bin/img/button_blue.png 
}






while true 
	do
		DATA=`tail  -n2 /tmp/log_jarvis_discuss | head -n1 | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"`

		if [[ ! -z "`echo ${DATA} | grep 'Waiting to hear'`" ]]
			then
				red &
				PID=$(ps axf| grep feh | grep button_red | grep -v grep | awk '{print $1}' )
			else

				NDATA=`tail  -n1 /tmp/log_jarvis_discuss | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"`
				if [[ ! -z `echo $NDATA | grep "^esteban"` ]]
					then
						blue &
						PID=$(ps axf| grep feh | grep button_red | grep -v grep | awk '{print $1}')
					else
						green &
						PID=$(ps axf| grep feh | grep button_red | grep -v grep | awk '{print $1}')
				fi
				
 
		fi
				
		while [[ "${DATA}" == "`tail  -n2 /tmp/log_jarvis_discuss | head -n1 | sed \"s,\x1B\[[0-9;]*[a-zA-Z],,g\"`" ]]
			do
				sleep 0.2
			done
		if [[ ! -z $PID ]]
			then
				if [[ ! -z "`ps axf|awk '{print $1}' | grep $PID`" ]]
					then
						kill ${PID}
				fi
		fi
	

done
		
