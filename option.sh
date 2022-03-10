#!/bin/bash



source functions.sh
if [ $# -gt 0 ]; then
    while getopts "hgmvsl" option; do
        case $option in

        h)  HELP;;
        g)  menu_graph;;
        m)  show_user;;
        v)  compresser100;;
        s)  comsup;;
        l)  lister;;
        

        *) echo "ERROR:Invalid arguments" ;;

        esac
    done
else
    echo -e "Please insert at least one argument"
show_usage
fi
