#!/usr/bin/env bash

#=======================================================================
# script pour rendre les fichiers textes traitables par iTrameur
# Demande 2 arguments : 
# - le répertoire contenant les fichiers à traiter
# - le nom du fichier de sortie sans l'extension
# Pour lancer le script, se situer dans programme/: 
# ./itrameur.sh <directory> 
#=======================================================================

if [[ $# -ne 1 ]]
then
	echo "Un argument attendu: <dossier>"
	exit
fi


folder=$1 # dumps-text/ OU contextes/ (attention, ne pas oublier le "/" après le nom du répertoire)
if [ $folder == "../dumps-text/" ]
then
	foldername="dumps"
elif [ $folder == "../contextes/" ]
then
	foldername="contextes"
fi
path="$folder*"
#echo "$path"

# création du fichier de concaténation
concatenationFile="../iTrameur/$foldername.txt"
touch $concatenationFile

for subpath in $path
do
	basename=$(echo "$subpath" | egrep -o "(fr)|(jp)|(kr)|(pt)")
	
	output="../iTrameur/$foldername-$basename.txt"
	
	echo "<lang=\"$basename\">" > $output
	for file in $subpath/*
	do
		filename=$(echo "$file" | basename -s .txt $file)
		echo "<page=\"$filename\">" >> $output
		contenu=$(cat "$file" | sed 's/\&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')
		echo "<text>$contenu</text>" >> $output
		echo "</page> §" >> $output
	done
	echo "</lang>" >> $output
	cat "$output" >> $concatenationFile
done
