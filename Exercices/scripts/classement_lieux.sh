#!/usr/bin/bash

if [[ $1 != '*' &&  $2 != '*' ]]
then
	ANNEE=$1
	MOIS=$2
fi

#recherche un type d'entités nommées pour une année

if [[ $1 = '*' &&  $2 = '*' ]]
then
	grep "Location" 201*.ann | sed -e "s/[0-9]*_[0-9]*_[0-9]*-[0-9]*.ann:T[0-9]*\tLocation\ [0-9]* [0-9]*\t//g" | sort | uniq -ic |sort -nr > Classement_lieux.txt
elif [[ $1 = '*' ]]
then
	grep "Location" 201?_$2_*.ann | sed -e "s/[0-9]*_[0-9]*_[0-9]*-[0-9]*.ann:T[0-9]*\tLocation\ [0-9]* [0-9]*\t//g" | sort | uniq -ic |sort -nr > Classement_lieux_$2.txt
elif [[ $2 = '*' ]]
then
	grep "Location" $1_*.ann | sed -e "s/[0-9]*_[0-9]*_[0-9]*-[0-9]*.ann:T[0-9]*\tLocation\ [0-9]* [0-9]*\t//g" | sort | uniq -ic |sort -nr > Classement_lieux_$1.txt
else
	grep "Location" $1_$2_*.ann | sed -e "s/[0-9]*_[0-9]*_[0-9]*-[0-9]*.ann:T[0-9]*\tLocation\ [0-9]* [0-9]*\t//g" | sort | uniq -ic |sort -nr > Classement_lieux_$2_$1.txt
fi


# Me détecte tous les fichiers malgré regexp dès qu'un des arguments est une étoile
