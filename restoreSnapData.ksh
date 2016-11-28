DataDir=/data/cassandra/data
timeStamp=`date +'%Y%m%d%H%M%S' `
LogDir=/root/cron-scripts/logs
LOGFILE=$LogDir/restoreSnapData.log.$timeStamp




for keySpace in `ls $DataDir`
do
        for cf in `ls $DataDir/$keySpace `
        do
                if [ -d "$DataDir/$keySpace/$cf/snapshots/snap-backup-full" ]; then
                        echo "Moving snapshot files from $DataDir/$keySpace/$cf/snapshots/snap-backup-full to $DataDir/$keySpace/$cf " >>$LOGFILE
                        #find $DataDir/$keySpace/$cf/backups -mtime +7 -type f -exec rm {} \;
                        mv  $DataDir/$keySpace/$cf/snapshots/snap-backup-full/* $DataDir/$keySpace/$cf/
                        if [[ $? != 0 ]]
                        then
                           echo "Error removing older files in directory $DataDir/$keySpace/$cf/backups" >> $LOGFILE
                        fi




                else
                        echo "$DataDir/$keySpace/$cf/backups is empty" >> $LOGFILE
                fi
        done


done




echo "Cleaning log files " >> $LOGFILE
find $LogDir -mtime +10 -type f -exec rm  {} \;




