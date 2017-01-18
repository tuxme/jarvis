#!/bin/bash
[[ -f /tmp/log_jarvis_discuss ]] && rm -f /tmp/log_jarvis_discuss
cd /home/pi/jarvis/
[[ ! -f /tmp/pulseOK ]] && pulseaudio -D && touch /tmp/pulseOK
./jarvis.sh -n|tee -a /tmp/log_jarvis_discuss
