#!/bin/bash
 

function f1(){
nazwa_service="domoticz"
ZM1="start"
if (whiptail --title "TAK/NIE" --yesno "uruchom - start | wylacz stop" 10 60) then
ZM1=$(whiptail --title "Wprowadzanie" --inputbox "wpisz strt | stop" 10 60 $ZM1 3>&1 1>&2 2>&3) 
exitstatus=$?
if [ $exitstatus = 0 ]; then
 service $nazwa_service $ZM1
 whiptail --title "INFO OKNO" --msgbox "Service $nazwa_service:`service $nazwa_service status | grep Active | awk '{print$2}'`" 10 60
else
    echo "Anulowano."
fi
else
    echo "NIE poprawiono zmiennej ZM1=$ZM1."
fi
}

function f2(){
#service domotucz stop
nazwa_service="domoticz"
czy_dziala=`service $nazwa_service status | grep Active | awk '{print$2}'`
if [ $czy_dziala == "inactive" ]
 then
        whiptail --title "INFO OKNO" --msgbox "Service $nazwa_service juz jest w statusie $czy_dziala." 10 60
elif [ $czy_dziala == "active" ]
 then
	whiptail --title "INFO OKNO" --msgbox "Service $nazwa_service jest w statusie $czy_dziala proba wylaczenia." 10 60
        service $nazwa_service stop
	whiptail --title "INFO OKNO" --msgbox "Service: $nazwa_service: `service $nazwa_service status | grep Active | awk '{print$2}'`" 10 60
fi
}

function f3(){
nazwa_service="domoticz"
whiptail --title "INFO OKNO" --msgbox "Service: $nazwa_service: `service $nazwa_service status | grep Active | awk '{print$2}'`" 10 60
}

###################################33
OPTION=$(whiptail --title "MENU" --menu "Wybierz opcje" 15 60 4 \
"1" "ON/OFF service DOMOTICZ" \
"2" "Wylaczenie service DOMOTOCZ" \
"3" "Status service DOMOTICZ" \
"4" "INNE"  3>&1 1>&2 2>&3)


exitstatus=$?
if [ $exitstatus = 0 ]; then
	if [ $OPTION = "1" ]; then f1
fi
    	if [ $OPTION = "2" ]; then f2
fi
        if [ $OPTION = "3" ]; then f3
fi

else
    echo "Zakonczono MENU"
fi

