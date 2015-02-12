#!/bin/bash
# Measures the end-to-end maximal latency of a hard drive (which includes seek time, a.k.a. random access time)
#
# Usage:
#			~ $ sudo ./seeker.sh
#			~ $ sudo ./seeker.sh /dev/vda
#			~ $ sudo ./seeker.sh /dev/sda 300
# 
# Inspired from seeker.c at http://www.linuxinsight.com/how_fast_is_your_disk.html
# See http://www.monperrus.net/martin/precisely+measuring+the+maximal+disk+latency



if [[ ! -z $1 ]]
then
  F=$1
else
  F=/dev/sda
fi

if [[ ! -z $2 ]]
then
  N=$2
else
  N=100
fi

ofile="latency.dat"

DISKSIZE=`blockdev --getsize64 $F`
echo disk size: $DISKSIZE bytes >&2

# ext3 block size: 4096
BLOCKSIZE=4096
echo block size: $BLOCKSIZE >&2

MAXSEEK=$((DISKSIZE/BLOCKSIZE))
echo max dd seek index: $MAXSEEK >&2

# bash constant of $RANDOM
RANDOM_MAX=32767

TIMEFORMAT="%E"

for i in `seq 1 $N`
do
  SEEK=$(((RANDOM*MAXSEEK)/RANDOM_MAX))
  A=`time dd if=$F of=/dev/null ibs=$BLOCKSIZE skip=$SEEK count=1 2>&1`
done > $ofile 2>&1

gnuplot histogram.gnuplot && echo "'histogram.png' is generated."
[[ -e $ofile ]] && rm -rf $ofile




