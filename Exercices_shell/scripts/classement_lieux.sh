#!/usr/bin/bash

ANNEE=$1
MOIS=$2


#recherche un type d'entités nommées pour une année
echo "en $MOIS $ANNEE, le classement des lieux est :" > Classement_lieux_$2_$1.txt
grep "Location" $1_$2_*.ann | sed -e "s/2016_12_[0-9]*-[0-9]*.ann:T[0-9]*\tLocation\ [0-9]* [0-9]*\t//g" | sort | uniq -ic |sort -nr >> Classement_lieux_$2_$1.txt


