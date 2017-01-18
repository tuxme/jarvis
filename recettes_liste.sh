#!/bin/bash


[[ ! -z `ps axf| grep midori| grep -v grep ` ]] && killall midori

FIND=`echo "$1" | sed "s# #-#g"`

FILE="/tmp/liste_recette"
FILEHTML="/tmp/liste_recette_html"

curl -sq "http://www.marmiton.org/recettes/recherche.aspx?aqt=${FIND}" | grep -A"10000" m_resultats_liste_recherche| grep aspx | grep '/recettes/' |cut -d"\"" -f4,6| sed "s#\"#|#g" | grep -B1000 recherche.aspx | grep -v recherche.aspx> ${FILE}

cat /home/pi/html/header > ${FILEHTML}
CPT=1

while read LineRecette
	do
		NAME=`echo $LineRecette| cut -d"|" -f1`
		URL="http://www.marmiton.org/`echo $LineRecette| cut -d"|" -f2`"

		echo "<div>* ${CPT} : <a href='$URL' style='text-decoration:none; color:white;'>${NAME}</a></div>" >> ${FILEHTML}
		CPT=$((CPT+1))
		if [[ "$CPT" == "11" ]]
			then
				break
		fi
	done < ${FILE}


#echo "export DISPLAY=:0 ; nohup /usr/bin/surf  ${FILEHTML}"  > /tmp/execute
open_html.sh ${FILEHTML}

			



