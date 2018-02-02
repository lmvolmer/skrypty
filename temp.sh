#!/bin/bash
temp=`cat temp_out.txt`
case $temp in
[1-44.0]*)
echo "OK - $temp malinki."
exit 0
;;
[45]*)
echo "WARNING - $temp temperatura malinki."
exit 1
;;
[60-70]*)
echo "CRITICAL - $temp temperatura malinki."
exit 2
;;
*)
echo "UNKNOWN - $temp temperatura malinki."
exit 3
;;
esac
