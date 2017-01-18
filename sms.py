#!/usr/bin/python
from pushbullet import Pushbullet
api_key="[API KEY pushbullet]"
pb = Pushbullet(api_key)
device = pb.devices[1]
device = pb.get_device('HTC HTC One M9')


VerfiTEL="NA"

#print device 

#push = pb.push_sms(device, "0624881548", "06")

import sys, getopt, os

def main(argv):
	VerfiTEL="NA"
	TEL = ''
	TEXTE = ''
	try:
		opts, args = getopt.getopt(argv,"ht:m:",["tel=","msg="])
	except getopt.GetoptError:
		#print 'sms.py -tel <msisdn> -msg <message>'
		print "Mauvais parametre"
		sys.exit(2)
	for opt, arg in opts:
		if opt == '-h':
			print "Mauvais parametre"
			sys.exit()
		elif opt in ("-t", "--tel"):
			TEL = arg
		elif opt in ("-m", "--msg"):
			TEXTE = arg


	if TEL == "tony stark":
		RTEL="06xxxxxxxx"
		VerfiTEL="OK"

	if VerfiTEL == "OK":
		#push = pb.push_sms(device, "" + RTEL + "", "" + TEXTE + "")
		push = pb.push_sms(device, RTEL,TEXTE)
		print "le S M S pour " + TEL + " est partie "
		#push = pb.push_sms(device, "0624881548", "06")

	else:
		print "Aucun numero enregistre pour : " + TEL



if __name__ == "__main__":
	main(sys.argv[1:])

