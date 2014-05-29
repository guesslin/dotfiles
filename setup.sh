#!/bin/bash

USERNAME=`whoami`

function banner() {
cat <<EOF
   ______                     ___
  / ____/_  _____  __________/ (_)___
 / / __/ / / / _ \\/ ___/ ___/ / / __ \\
/ /_/ / /_/ /  __(__  |__  ) / / / / /
\\____/\\__,_/\\___/____/____/_/_/_/ /_/

EOF
}

function usage() {
cat <<EOF
usage: $0 options

This script helps you to setup dotfiles in default locations.

OPTIONS:
  -h    show this message
  -q    do not display banner
  -b    backup old dotfiles with a PATH
        Default: ~/.backup

  -c    show colours if front

EOF
}

function make_backup() {
    if [ -z $1 ]; then
        echo -e "No path pass to me!!"
    fi
    read -p "Do you want backup old configs? Y/n [Y] " backup
    if [ -z "$backup" -o "$backup" == "Y" -o "$backup" == "y" ]; then
        backup="y"
    else
        backup="n"
    fi
    echo $backup
}

function show_colours() {
    for i in {0..255};
    do
        printf "\x1b[38;5;${i}mcolour${i}  \t";
        declare -i loop=10
        declare -i test=$i%$loop;
        if [ $test -eq $(($loop-1)) ]; then
            printf "\x1b[0m\n";
        fi;
    done;
    printf "\x1b[0m\n";
}

function backup_old() {
if [ ! -e "$1" ]; then
    mkdir -p $1
fi
echo -e "Backup old dotfile to $1"
cp ~/.vimrc "$1/"
cp ~/.tmux.conf "$1/"
}

function install() {
echo -e "Copy dotfiles"
cp ./config/vimrc ~/.vimrc
cp ./config/tmux.conf ~/.tmux.conf
}

quiet=0
backup=
while getopts "hqb:c" OPTION
do
    case $OPTION in
        h)
            usage
            exit 1
            ;;
        q)
            quiet=1
            ;;
        b)
            backup=$OPTARG
            ;;
        c)
            show_colours
            exit 1
            ;;

    esac
done
if [ "$quiet" == 0 ]; then
    banner
fi
if [ -z "$backup" ]; then
    backup="/home/$USERNAME/.backup"
fi
echo -e "$backup"
backup_old $backup
install
