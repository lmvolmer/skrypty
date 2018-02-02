#!/bin/bash
#cmd=(dialog --menu "Wybierz opcje:" 22 76 16)
cmd=(dialog --backtitle "CPU Selection" --radiolist "Select CPU type:" 10 40 4)

	1 386SX off 
        2 386DX on 
        3 486SX off 
        4 486DX off
        
#options=(1 "Option 1" off    # any option can be set to default to "on"
#         2 "Option 2" off
#         3 "Option 3" off
#         4 "Option 4" off)

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            echo "First Option"
            ;;
        2)
            echo "Second Option"
            ;;
        3)
            echo "Third Option"
            ;;
        4)
            echo "Fourth Option"
            ;;
    esac
done
