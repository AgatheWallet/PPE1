#!/usr/bin/bash

ANNEE=$1
TYPE=$2

#recherche un type d'entités nommées pour une année
echo "pour l'année $ANNEE, le nombre de $TYPE :" > Compte_$2_$1.txt
grep "$TYPE" $ANNEE*.ann | wc -l >> Compte_$2_$1.txt

