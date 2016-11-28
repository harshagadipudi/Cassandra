for nd in casdbnp207 casdbnp208 casdbnp209
do


tmstmp=`date +'%Y%m%d%H%M%S' `


ech "Nodetool Status and Info " > mondata.$nd.$tmstmp
nodetool -h $nd status  >> mondata.$nd.$tmstmp
nodetool -h $nd info  >> mondata.$nd.$tmstmp
echo "Nodetool cfstats "
#nodetool -h cfstats | egrep -i "keyspace|sstablecount|columnfamily"  >> mondata.$nd.$tmstmp
nodetool -h $nd cfstats  >> cfstats.$nd.$tmstmp
echo "Nodetool tpstats "
nodetool -h $nd tpstats  >> mondata.$nd.$tmstmp
echo "Nodetool compactionstats "
nodetool -h compactionstats  >> mondata.$nd.$tmstmp
echo "Nodetool netstats "
nodetool -h $nd netstats  >> mondata.$nd.$tmstmp
echo "Nodetool proxyhistograms "
nodetool -h proxyhistograms  >> mondata.$nd.$tmstmp




done




