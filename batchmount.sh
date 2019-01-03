#!/bin/bash  
PATH=/bin:/sbin:/usr/bin:/usr/sbin
export PATH  
i=1
#while [ $i -lt 13 ]                  #硬盘数量,除系统盘之外是12块
#do
j=`echo $i|awk '{printf "%c",97+$i}'` #系统盘是sda,如果是其它的需要修改脚本 
parted /dev/vd$j <<FORMAT               
mklabel gpt
mkpart primary 0 -1
ignore
quit
FORMAT
#mkfs.ext4 -T largefile  /dev/vd${j}1    #格式化磁盘
#mkdir -p /mnt/vd${j}
#mount="/dev/vd${j}1       /mnt/vd${j}  ext4    defaults        0       0" 
#echo $mount >>/etc/fstab                #写入分区表 
#i=$(($i+1))
#done
#echo "/n/n*****Formating  and Mounting have finished****/n/n"
#mount -a                                #挂载
