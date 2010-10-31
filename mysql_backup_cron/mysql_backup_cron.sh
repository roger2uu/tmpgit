#!/bin/sh
###########################################################################
#
#   Roger Zhou, 2008/5, Initial version
#
#   $Id: mysql.dailybackup,v 1.5 2009/12/28 10:57:24 zzhou Exp $
#
#   NAME: 
#   DESC: 
#         
###########################################################################

DBNAME="rth_turbo"
DB_USR=root
DB_PWD=123456
BAK_DIR=/home/rth_dbbackup

###########################################################################

mkdir -p $BAK_DIR; cd $BAK_DIR

SYSLOG_FN=dbbackups.${DBNAME}.log
DT=`/bin/date '+%F-%H%M%S'`
FN="${DBNAME}.${DT}.sql"

/opt/lampp/bin/mysqldump -u ${DB_USR} -p${DB_PWD} ${DBNAME} > $FN

/bin/bzip2 $FN

/bin/echo "`/bin/date '+%F'`: database '${DBNAME}' was backuped to $FN.bz2 " >> $SYSLOG_FN


ls -r |sed -n "/${DBNAME}.[0-9]\{4\}-[0-9]\{2\}-[0-9][0-9]-[0-9]\{6\}.sql.bz2/p"|sed '1,14d'|sed "/${DBNAME}.[0-9]\{4\}-[0-9]\{2\}-[0-9][16]-[0-9]\{6\}/d"|xargs -i echo "{} removed" >> $SYSLOG_FN
ls -r |sed -n "/${DBNAME}.[0-9]\{4\}-[0-9]\{2\}-[0-9][0-9]-[0-9]\{6\}.sql.bz2/p"|sed '1,30d'|sed "/${DBNAME}.[0-9]\{4\}-[0-9]\{2\}-11-[0-9]\{6\}/d"|xargs -i echo "{} removed" >> $SYSLOG_FN

ls -r |sed -n "/${DBNAME}.[0-9]\{4\}-[0-9]\{2\}-[0-9][0-9]-[0-9]\{6\}.sql.bz2/p"|sed '1,14d'|sed "/${DBNAME}.[0-9]\{4\}-[0-9]\{2\}-[0-9][16]-[0-9]\{6\}/d"|xargs rm -rf
ls -r |sed -n "/${DBNAME}.[0-9]\{4\}-[0-9]\{2\}-[0-9][0-9]-[0-9]\{6\}.sql.bz2/p"|sed '1,30d'|sed "/${DBNAME}.[0-9]\{4\}-[0-9]\{2\}-11-[0-9]\{6\}/d"|xargs rm -rf



