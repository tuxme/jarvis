#!/bin/bash


[[ ! -z `ps axf| grep midori| grep -v grep ` ]] && killall midori

LETTRE="$1"

[[ "$LETTRE" == "un" ]] &&  CHIFFRE=1
[[ "$LETTRE" == "deux" ]] &&  CHIFFRE=2
[[ "$LETTRE" == "trois" ]] &&  CHIFFRE=3
[[ "$LETTRE" == "quatre" ]] &&  CHIFFRE=4
[[ "$LETTRE" == "cinq" ]] &&  CHIFFRE=5
[[ "$LETTRE" == "six" ]] &&  CHIFFRE=6
[[ "$LETTRE" == "sept" ]] &&  CHIFFRE=7
[[ "$LETTRE" == "huit" ]] &&  CHIFFRE=8
[[ "$LETTRE" == "neuf" ]] &&  CHIFFRE=9
[[ "$LETTRE" == "dix" ]] &&  CHIFFRE=10




FILE="/tmp/liste_recette"
FILEHTML="/tmp/liste_recette_html"
FILEHTMLUNIQ="/tmp/liste_recette_html_unique"


CPT=1

while read line
	do
		if [[ "$CPT" == "$CHIFFRE" ]]
			then
				
				
				NAME=`echo $line| cut -d"|" -f1`
				URL="http://www.marmiton.org/`echo $line| cut -d"|" -f2`"
				break
		fi
		CPT=$((CPT+1))
	done < ${FILE}




echo  "<!-- ___RECETTE|${CPT}| --> " > ${FILEHTMLUNIQ}
echo "<!-- $URL -->" >> ${FILEHTMLUNIQ}
cat /home/pi/html/header >> ${FILEHTMLUNIQ}
curl -sq "${URL}" | grep -A10000 'm_content_recette_main' | grep -B10000 m_content_recette_ps | grep -v m_content_recette_ps >> ${FILEHTMLUNIQ}


#echo "export DISPLAY=:0 ;killall surf; nohup /usr/bin/surf  ${FILEHTMLUNIQ}; sleep 1;xte "key F11" -x:0"  > /tmp/execute
open_html.sh ${FILEHTMLUNIQ}

echo "La recette $2 va s'afficher"
			



