#!/bin/bash  
PATH=/bin:/sbin:/usr/bin:/usr/sbin
export PATH  
i=1
#while [ $i -lt 3 ]
#do
j=`echo $i|awk '{printf "%c",97+$i}'`
parted /dev/vd$j <<FORMAT               
mklabel gpt
mkpart primary 0 -1
ignore
quit
FORMAT
parted /dev/vd$j set 1 lvm on
#i=$(($i+1))
#done
