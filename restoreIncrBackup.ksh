DataDir=/var/lib/cassandra/data
timeStamp=`date +'%Y%m%d%H%M%S' `
incrTmstmp="2016-11-04 11:54:00"
LogDir=/root/logs
LOGFILE=$LogDir/restoreIncrBackup.log.$timeStamp




#for keySpace in `ls $DataDir`
for keySpace in keyspace1
do
        for cf in standard1-6c312630aae211e693e2ed1e37548694
        do
                if [ -d "$DataDir/$keySpace/$cf/backups" ]; then
                        echo "Moving incremental files from $DataDir/$keySpace/$cf/backups to $DataDir/$keySpace/$cf " >>$LOGFILE
                        #for fName in `find $DataDir/$keySpace/$cf/backups -newermt "$incrTmstmp" -type f `
                        for fName in `find $DataDir/$keySpace/$cf/backups -newermt "$incrTmstmp" -type f`
                        do
                           mv  $fName $DataDir/$keySpace/$cf/
                        if [[ $? != 0 ]]
                        then
                           echo "Error moving files from directory $DataDir/$keySpace/$cf/backups" >> $LOGFILE
                        fi
                        done
                else
                        echo "$DataDir/$keySpace/$cf/backups is empty" >> $LOGFILE
                fi
        done


done




echo "Cleaning log files " >> $LOGFILE
find $LogDir -mtime +10 -type f -exec rm  {} \;




