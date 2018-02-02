#!/bin/bash
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/menu$$
trap "rm -f $tempfile" 0 1 2 5 15

$DIALOG --clear --title "Menu Glowne" \
        --menu "Wybierz opcje:" 25 55 10 \
        "opcja1" "Opcja NR 1" \
        "opcja2" "Opcja NR 2" \
        "opcja3" "Opcja NR 3" \
        "opcja4" "Opcja NR 4" 2> $tempfile

retval=$?

choice=`cat $tempfile`

#tutaj wstawiamy funkcja dla menu
function opcja_1(){
zmienna_1="zmienna1"
dialog --title "info" \
--backtitle "INFO" \
--msgbox "$zmienna_1" 7 45
}

function opcja_2(){
zmienna_2="zmienna2"
dialog --title "info" \
--backtitle "INFO" \
--msgbox "$zmienna_2" 7 45
}

case $retval in
  0)	
  if [ $choice == "opcja1" ]
	then
	opcja_1
  elif [ $choice == "opcja2" ]
	then
	opcja_2

fi
;;  

  1)
    echo "Cancel pressed.";;
  255)
    echo "ESC pressed.";;
esac
