#!/usr/bin/bash


#recherche Location pour année 2016
echo "pour l'année 2016" > Compte_location.txt
grep "Location" 2016*.ann | wc -l >> Compte_location.txt
#recherche Location pour année 2017
echo "pour l'année 2017" >> Compte_location.txt
grep "Location" 2017*.ann | wc -l >> Compte_location.txt
#recherche Location pour année 2018
echo "pour l'année 2018" >> Compte_location.txt
grep "Location" 2018*.ann | wc -l >> Compte_location.txt
