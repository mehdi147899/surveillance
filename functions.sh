#!/bin/bash
var=--field 

function show_help()
{
less help.txt
}
function show_usage() 
{
echo "surveiller.sh :  [-h] [-d] [-s] [-j] [-v] [-g] [-m] "
}
function usage_graph() {
usage_graph=(
    yad --geometry=600x400 --center
    --title="Nombre d'utulisateurs"
    --text="<span font_desc='Ubuntu Mono Bold Italic 14' foreground='#14006c'>Nombre d'utulisateurs :</span>
    <span font_desc='Ubuntu Mono Bold Italic 10' foreground='#D20240'>`echo "surveiller.sh :  [-h] [-d] [-s] [-j] [-v] [-g] [-m] "`</span>
   "--text-align="center"
    --button="Retour":'bash -c menu_gr'
    
)
"${usage_graph[@]}"
}
function show_user()
{
yad --width=600 --title"afficher utulisateur"
INPUTTEXT=` yad --entry --entry-label="saisr le nom"`

recherche=$(cut -d":" -f1 /etc/passwd | grep $INPUTTEXT)

if [[ "$recherche" == "$INPUTTEXT" ]];
then echo "l'utilisateur existe";
yad --list --multiple --rows --column=`last -R $INPUTTEXT`
else echo "l'utilisateur n'existe pas";
fi

}

function show_date()
{
yad --width=600 --title"afficher connexion journaliere"
INPUTDATE=` yad --entry --entry-label="saisr la date"`
 echo "saisir la date sous forme yyyy-mm-dd"
yad --list --multiple --rows --column=`last -t $INPUTDATE`

}

function menu_graph ()
{
menu_graph=(
    yad --width=800
    --title="Choose your options"
    --form
  --field="usage_graph":BTN 'bash -c usage_graph'
	--field="afficher help":BTN 'bash -c show_help'
	--field="afficher par utulisateur":BTN 'bash -c show_user'
	--field="afficher utulisateur par date":BTN 'bash -c show_date'
    --button="gtk-close"
)
"${menu_graph[@]}"
}
export -f menu_graph usage_graph show_help show_user show_date


