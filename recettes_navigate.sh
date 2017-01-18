#!/bin/bash

STATUS=$1


ACTUAL=`cat /tmp/liste_recette_html_unique | head -n1|cut -d"|" -f2` 
MAX=`cat /tmp/liste_recette|wc -l`

NEW=${ACTUAL}

if [[ "$STATUS" == "next" ]]
	then
		text="suivante"
		NEW=$((NEW+1))

		if [[ ${NEW} -gt ${MAX} ]]
			then
				NEW=1
		fi
fi

if [[ "$STATUS" == "previous" ]]
	then
		text="précédente"
		NEW=$((NEW-1))
		if [[ "${NEW}" -le "0" ]]
			then
				NEW=${MAX}
		fi
fi


[[ "${NEW}" == "1" ]] && TPAGE='un'
[[ "${NEW}" == "2" ]] && TPAGE='deux'
[[ "${NEW}" == "3" ]] && TPAGE='trois'
[[ "${NEW}" == "4" ]] && TPAGE='qutre'
[[ "${NEW}" == "5" ]] && TPAGE='cinq'
[[ "${NEW}" == "6" ]] && TPAGE='six'
[[ "${NEW}" == "7" ]] && TPAGE='sept'
[[ "${NEW}" == "8" ]] && TPAGE='huit'
[[ "${NEW}" == "9" ]] && TPAGE='neuf'
[[ "${NEW}" == "10" ]] && TPAGE='dix'


recettes_affiche.sh ${TPAGE} ${text}






