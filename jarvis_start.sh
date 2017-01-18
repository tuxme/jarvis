#!/bin/bash

/usr/bin/screen -d -m -S JARVIS "/home/pi/bin/screen_jarvis_start.sh"
/usr/bin/screen -d -m -S HAL9000 "/home/pi/bin/hal9000.sh"

