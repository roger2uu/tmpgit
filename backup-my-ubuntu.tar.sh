#!/bin/bash


###########################
# Example
###########################

#sudo su
#cd /


#tar cvpzf backup.tgz --exclude=/proc --exclude=/lost+found --exclude=/backup.tgz --exclude=/mnt --exclude=/sys /
#tar xvpzf backup.tgz -C /; 		# RESTOR gzip tar ball

# OR

#tar cvpjf backup.tar.bz2 --exclude=/proc --exclude=/lost+found --exclude=/backup.tar.bz2 --exclude=/mnt --exclude=/sys /
#tar xvpjf backup.tar.bz2 -C /		# RESTOR bz2 tar ball


###########################
# Example BIOSTAR
###########################



EXLUDE_DIR="--exclude=/proc --exclude=/lost+found --exclude=/backup.tgz --exclude=/backup.tar.bz2 --exclude=/mnt --exclude=/media --exclude=/sys --exclude=/home/aromazhou"
DEST=/media/9c1de7be-f9f9-4b7e-88d1-5267c7705349

tar cvpzf $DEST/backup.tgz $EXLUDE_DIR / >/dev/null 2>$DEST/backup.tgz.err.log
#tar xvpzf backup.tgz -C /; 		# RESTOR gzip tar ball

#tar cvpjf $DEST/backup.tar.bz2  $EXLUDE_DIR / >/dev/null 2>$DEST/backup.tar.bz2.err.log
#tar xvpjf backup.tar.bz2 -C /		# RESTOR bz2 tar ball

rsync -aqu --delete $EXLUDE_DIR / $DEST/ 2>$DEST/rsync.err.log


