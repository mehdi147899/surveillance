#!/bin/bash

export title='echo -e'\033[0;37m''
export blank= 'echo -e '\033[0;37;44m''
echo -e "${title}          ${normal}"
echo -e "${title}menu"

echo "tape h pour afficher help"
echo "tape g pour afficher un menu textuel"
echo " v pour afficher les noms des utulisateurs"
echo "d pour afficher les dernieres connexion"
echo " s pour supprimer"
echo " j pour journalier"
echo "q quiiter"
while getopts  " hgvdsjq: "
read -p "entrez votre choix" choix

do
case "$choix"
in
h) less help.txt
;;
v) echo "entrez un nom"
read  nom
recherche=$(cut -d":" -f1 /etc/passwd | grep $nom)

if [ "$recherche" == "$nom" ]
then echo "l'utilisateur existe";
last -R
else echo "l'utilisateur n'existe pas";
fi

;;
d) last -f connexion.txt
;;
j) echo "saisir la date sous forme yyyy-mm-dd"
read date
last -t $date
;;
q) exit
;;
esac 
done
