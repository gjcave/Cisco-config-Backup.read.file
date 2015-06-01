#!/bin/bash


#Declare Cisco suffixes
ARRAY=( 'enta' 'entb' 'com01' 'com02' 'com03' 'adm01' 'adm02')
# get number of elements in the array
getArray() {
           i=0
           while read line # Read a line
           do
               SITEARRAY[i]=$line # Put it into the array
               i=$(($i + 1))
           done < $1
}
getArray "sites.txt"
ELEMENTS=${#ARRAY[@]}
COUNT=${#SITEARRAY[@]}
COUNTUP="0"
# Site Loop
for f in ${SITEARRAY[@]}; do
       #               nested loop for devices
                for (( i=0;i<$ELEMENTS;i++)); do
#                 IP=`dig +short  $f'-'${SITEARRAY[${COUNTUP}]}'-'.lyondell.com'`
#                 if [ -n "$IP" ]; then
                     echo ${SITEARRAY[${COUNTUP}]}'-'${ARRAY[${i}]}
#                    sshpass -f /home/gcave/.keys/lbpw scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no a_gxcave@${SITEARRAY[${COUNTUP}]}'-'${ARRAY[${i}]}:system:running-config /home/gcave/tftp/router_switch/${SITEARRAY[${COUNTUP}]}'-'${ARRAY[${i}]}
                 done
   let COUNT=COUNT-1 
   let COUNTUP=COUNTUP+1           
        if [ $COUNT -gt 0 ]; then
           echo $COUNT "more site(s) to go"
        else
           echo "Backup Complete"
        fi
done
