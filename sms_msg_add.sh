#!/bin/bash
DATA=`cat /tmp/sms_send`
#/home/pi/bin/sms.py -t "${DATA}" -m "$1"
#echo "/home/pi/bin/sms.py -t \"${DATA}\" -m \"$1\"" >> /tmp/debug_sms
echo "/home/pi/bin/sms.py -t \"${DATA}\" -m \"$1\"" >> /tmp/execute
echo "Le message va être envoyé !"
rm /tmp/sms_send
