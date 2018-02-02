#!/bin/bash
#skrypt do manipulowania stanem uslug w okienkach  menu whiptail
#przyjmuje parametr nazwa_service
#np menu_withapil.sh smbd
#volmer
 
nazwa_service="$1"

#funkcja do usruchmiania i zatrzymywania service
function f1(){
ZM1="start"
if (whiptail --title "TAK/NIE" --yesno "start | stop dla uslugi: $nazwa_service" 10 60) then
ZM1=$(whiptail --title "Wprowadzanie - $nazwa_service" --inputbox "wpisz strt | stop" 10 60 $ZM1 3>&1 1>&2 2>&3) 
exitstatus=$?
if [ $exitstatus = 0 ]; then
	czy_dziala=`service $nazwa_service status | grep Active | awk '{print$2}'`
        whiptail --title "INFO OKNO - $nazwa_service" --msgbox "Service $nazwa_service jest w statusie $czy_dziala proba wlaczania/wylaczenia." 10 60
        service $nazwa_service $ZM1
        whiptail --title "INFO OKNO - $nazwa_service" --msgbox "Service: $nazwa_service: `service $nazwa_service status | grep Active | awk '{print$2}'`" 10 60
else
    echo "Anulowano."
fi
else
    echo "ZM1=$ZM1."
fi
}

#funkcja do restartu service
function f2(){
czy_dziala=`service $nazwa_service status | grep Active | awk '{print$2}'`
if [ $czy_dziala == "inactive" ]
 then
        whiptail --title "INFO OKNO - $nazwa_service" --msgbox "Service $nazwa_service stan: $czy_dziala Restart niemozliwy" 10 60
elif [ $czy_dziala == "active" ]
 then
	whiptail --title "INFO OKNO - $nazwa_service" --msgbox "Service $nazwa_service jest w statusie $czy_dziala proba resetu." 10 60
        service $nazwa_service restart
	whiptail --title "INFO OKNO" --msgbox "Service: $nazwa_service: `service $nazwa_service status | grep Active | awk '{print$2}'`" 10 60
fi
}

#funkcja do wyswietlaniu stanu service
function f3(){
whiptail --title "INFO OKNO - $nazwa_service" --msgbox "Service: $nazwa_service: `service $nazwa_service status | grep Active`" 10 60
}

#funkcja dla wylistowania wszystkich service
function f4(){
#whiptail --title "INFO OKNO" --textbox "`service --status-all`" 20 60
service --status-all | less
}

###################################33
OPTION=$(whiptail --title "MENU service :$nazwa_service" --menu "Wybierz opcje" 15 60 4 \
"1" "ON/OFF service " \
"2" "restart service " \
"3" "Status service " \
"4" "Status wszystkich "  3>&1 1>&2 2>&3)


exitstatus=$?
if [ $exitstatus = 0 ]; then
	if [ $OPTION = "1" ]; then f1
fi
    	if [ $OPTION = "2" ]; then f2
fi
        if [ $OPTION = "3" ]; then f3
fi
        if [ $OPTION = "4" ]; then f4
fi

else
    echo "Zakonczono MENU"
fi

