#!/bin/bash

while true
	do 
		if [[ -f /tmp/execute ]]
			then
				DATA=`cat /tmp/execute`
				if  [[ ! -z $DATA ]] && [[ ! -f /tmp/execute_lock ]]
					then
						touch /tmp/execute_lock
						echo "[$(date "+%Y%m%d %H%M%s")] : $DATA" >> /tmp/debug_watch_and_launch
						bash /tmp/execute
						rm -f /tmp/execute
						rm -f /tmp/execute_lock
				fi
		fi
		sleep 3
		echo "."
	 done
