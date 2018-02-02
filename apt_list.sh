#!/bin/bash
apt-get -s upgrade > /tmp/apt_list_out
lista=`cat /tmp/apt_list_out`
aktualizacje=`cat /tmp/apt_list_out | grep upgraded`
echo $aktualizacje
#echo "log ze sprawdzenia"
#echo $lista


