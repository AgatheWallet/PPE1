# Journal de bord du projet encadré


---
## 28/09/2022

Création du repository sur GitHub et des fichiers Readme.md et journal-de-bord.md
Attendre un petit peu après commit avant de faire status, sinon ne détecte pas les modifications

### Les commandes utilisées :  
- `git clone` : clone le repository sur la machine  
- `git status` : affiche statut de repository sur la machine vs repository en ligne  
- `git log` : affiche historique des commits  

Autre.s commande.s :  
- `git push` : ajouter modif faites sur ordi dans le repository en ligne  


---
## 05/10/2022

Exercices sur Shell : 
- Exercice 1 : Créer une arborescence pour classer les documents et y copier les documents
- Exercice 2 : Compter le nombres d'annotations par année, limiter le comptage aux lieux et enregistrer les résultats, établir le classement des lieux les plus cités, trouver les annotations les plus fréquentes pour le mois de décembre

### Les commandes utilisées :  

#### Exercice 1
- `mkdir repository` : création répertoire
- `cp rep1/file.txt rep2/file.txt` : copie du fichier file.txt depuis le rep 1 dans le rep 2
- `ls (-l et/ou -a)`: visualiser le contenu du répertoire dans lequel on se trouve
- `cd rep` : se déplacer dans rep (si se trouve dans le répertoire actuel)

#### Exercice 2
- `ls 2016*.ann |wc -l` : pour compter le nombre d'annotation dans faites en 2016
- `cat 2016*.ann | egrep Location | wc -l` : compte le nombre de ligne contenant Location parmi les annotations faites en 2016 (problème de passage à la ligne entre 2 fichiers)
- `touch file.txt` : création d'un fichier file.txt
- `echo "Bonjour" > file.txt` : remplace le contenu du fichier file.txt par "Bonjour"
- `echo "Je m'appelle Agathe"` >> file.txt : ajoute "Je m'appelle Agathe" au contenu de file.txt
- `sed -e "s/T1\t/\nT1\t/g"` : remplace "T1 suivi d'une tabulation" par "T1 précédé d'un passage à la ligne et suivi d'une tabulation"
- `sed -e "s/^T[0-9]*\t[A-Za-z]*\s[0-9]*\s[0-9]*//g"` : utilisé pour normaliser les fichiers d'annotations → retire tout ce qui précède le nom correspondant au type d'annotation (nom de lieu, nom d'organisation, etc)
- `sort file.txt | uniq -ic | sort -nr` : trie le fichier pour qu'il soit dans l'ordre alphabétique, retire les doublons et compte le nombre d'occurences, en ignorant la casse et trie à nouveau le fichier par la fréquence, du plus grand au plus petit


---
## 25/10/2022
- Création de scripts pour compter les annotations de lieux (compte_loc.sh), classer les lieux (classement_lieux.sh) et compter le nombre de tel type d'annotations pour telle année (compte.sh).


### Les commandes utilisées : 
- `#!/usr/bin/bash` : appelle bash
- `ANNEE=$1` : permet de renommer l'argument 1 ANNEE (plus explicite dans le programme)
- $ANNEE : appel de la variable ANNEE, correspondant à l'argument 1
```bash
for condition
do
	# what we have to do
done
```
```bash
if [[condition1]]
then
	# what we do
elif [[condition2]]
then
	# what we do
else
	# what we do
fi
```


---
## 09/11/2022

Création de pages github
Création index.html avec ajout d'un lien
Création tableau.html avec différents titres et liens et création d'une liste

### Les commandes utilisées : 
```html
<p>texte<p> : création paragraphe
<ul>  
	<li>élément 1</li>  
	<li>élément 2</li>  
</ul> : création liste
<a href=lien>Texte</a> : création lien
<h1>Titre1</h1> : création gros titre (jusqu'à h6)
```


---
## 15/11/2022
Mise à jour du journal de bord



