#!/bin/bash
#skrypt grepuje log auth.log z aktualnego dnia

# cat za 2 dni wczesniej:  date  -R --date="2 days ago"
#data2dni=`date -R --date="2 days ago" | awk '{print$3,$2}'`

#cat za  dzisiaj 
data=`date -R | awk '{print$3,$2}'`
data2="'"$data"'"

date > /var/www/vol/auth.log
cat /var/log/auth.log | grep "$data" | grep sshd* >> /var/www/vol/auth.log
chmod 644 /var/www/vol/auth.log
#cos tam dodamy
