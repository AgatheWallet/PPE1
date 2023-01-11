#!/usr/bin/env bash

#=======================================================================
# script pour créer les tableaux à partir des fichiers URL
# Pour lancer le script, se placer dans le répertoire ./Exercices/Corpus/programme: 
# ./base_tableaux_fichier.sh
#=======================================================================

fichier_urls=$1 # le fichier d'URL en entrée
fichier_tableau=$2 # le fichier HTML en sortie
fichier_concordancier=$3

if [[ $# -ne 3 ]]
then
	echo "Ce programme demande exactement trois arguments : <fichier URL> <tableau html> <concordancier html>"
	exit
fi

mot="페미니즘" # à modifier

echo $fichier_urls;
basename=$(basename -s .txt $fichier_urls)

######

# Tableau URLs

echo "<html><body>" > $fichier_tableau
echo "<h2>Tableau $basename :</h2>" >> $fichier_tableau
echo "<br/>" >> $fichier_tableau
echo "<table>" >> $fichier_tableau
echo "<tr><th>ligne</th><th>code</th><th>URL</th><th>encodage</th><th>occurrences</th></tr>" >> $fichier_tableau

######

# Concordancier

echo "<html><body>" > $fichier_concordancier
echo "<h2>Tableau $basename :</h2>" >> $fichier_concordancier
echo "<br/>" >> $fichier_concordancier
echo "<table>" >> $fichier_concordancier
echo "<tr><th>Contexte gauche</th><th>$mot</th><th>Contexte droit</th></tr>" >> $fichier_concordancier





lineno=1;
while read -r URL; do
	echo -e "\tURL : $URL";
	# la façon attendue, sans l'option -w de cURL
	code=$(curl -ILs $URL | grep -e "^HTTP/" | grep -Eo "[0-9]{3}" | tail -n 1)
	charset=$(curl -ILs $URL | grep -Eo "charset=(\w|-)+" | tail -n 1 | cut -d= -f2)

	# autre façon, avec l'option -w de cURL
	# code=$(curl -Ls -o /dev/null -w "%{http_code}" $URL)
	# charset=$(curl -ILs -o /dev/null -w "%{content_type}" $URL | grep -Eo "charset=(\w|-)+" | cut -d= -f2)



	echo -e "\tcode : $code";

	if [[ ! $charset ]]
	then
		echo -e "\tencodage non détecté, on prendra UTF-8 par défaut.";
		charset="UTF-8";
	else
		echo -e "\tencodage : $charset";
	fi
	if [[ $code -eq 200 ]]
	then
		dump=$(lynx -dump -nolist -assume_charset=$charset -display_charset=$charset $URL)
		
		
		if [[ $charset -ne "UTF-8" && -n "$dump" ]]
		then
			dump=$(echo "$dump" | iconv -f $charset -t UTF-8//IGNORE)
		fi
		curl $URL > ../aspirations/$basename-$lineno.html
		echo "$dump" > ../dumps-text/$basename-$lineno.txt
		contexte=$(echo "$dump" | egrep -A 1 -B 1 "$mot")
		echo "$contexte" > ../contextes/$basename-$lineno.txt
		
		occurrence=$(echo "$dump" | egrep -o "$mot" | wc -w)
		
		dump_continu=$(echo "$dump" | sed ':a;N;$!ba;s/\n\n/§/g')
		dump_continu=$(echo "$dump_continu" | sed ':a;N;$!ba;s/\n//g')
		#echo "$dump_continu"
		
		contexte_concordance=$(echo "$dump_continu" | egrep -o "[.?!…§]\s[^.?!…§]*$mot[^.?!…§]*[§.?!…]")
		#contexte_concordance=$(echo "$contexte" | egrep -o "$mot")
		
		while read -r line ; do
			contexte_gauche=$(echo "$line" | sed -s "s/[.?!…§]\([^.?!…§]*\)$mot\([^.?!…§]*[.?!…§]\)/\1/g")
			contexte_droit=$(echo "$line" | sed -s "s/[.?!…§]\([^.?!…§]*\)$mot\([^.?!…§]*[.?!…§]\)/\2/g")
			echo "<tr><td>$contexte_gauche</td><td>|$mot|</td><td>$contexte_droit</td></tr>" >> $fichier_concordancier
		done <<< $contexte_concordance
		

	else
		echo -e "\tcode différent de 200 utilisation d'un dump vide"
		dump=""
		charset=""
	fi

	echo "<tr><td>$lineno</td><td>$code</td><td><a href=\"$URL\">$URL</a></td><td>$charset</td><td>$occurrence</td></tr>" >> $fichier_tableau
	echo -e "\t--------------------------------"
	lineno=$((lineno+1));
done < $fichier_urls
echo "</table>" >> $fichier_tableau
echo "</body></html>" >> $fichier_tableau

echo "</table>" >> $fichier_concordancier
echo "</body></html>" >> $fichier_concordancier






