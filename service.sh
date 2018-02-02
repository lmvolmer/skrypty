#!/bin/bash
nazwa_service="$@"

service=`service $nazwa_service status | grep Active | awk '{print$2}'`
opis=`service $nazwa_service status | grep Active`

case $service in
 'active')
echo "OK - dziala: $nazwa_service $opis"
exit 0
;;
 'inactive')
echo "CRITICAL - NIE DZIALA: $nazwa_service $opis."
exit 2
;;
*)
echo "UNKNOWN - $service nietegens"
exit 3
esac
