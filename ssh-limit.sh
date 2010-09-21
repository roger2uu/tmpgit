#!/bin/bash
###########################################################################
#
#   Roger Zhou, 2009/12, Initial version
#
#   $Id: ssh-limit.sh,v 1.1 2009/12/22 01:47:08 zzhou Exp $
#
#   NAME: 
#   DESC: 
#         
###########################################################################

h_from="`hostname`"
h_to="$h_from"
#h_to="wr-taf@pek-autotest.wrs.com"
#h_to="ala-tuxlab.wrs.com"
#h_to="pek-lpgbuild1.wrs.com"
#h_to="wr-taf@pek-autotest.wrs.com"

foo ()
{
ret="`ssh $h_to 'sleep 20' 2>&1`"
r1="${ret}Ah"

[ "$r1" != "Ah" ] && echo "[$1] ssh errorinfo '$ret' @ `date +%F_%T` @ $h_from to $h_to" | tee -a ssh-limit.log
}


a=1
while [ $a -le 20 ]
do 
a=$(($a+1))
foo $a &
#sleep 2
done





