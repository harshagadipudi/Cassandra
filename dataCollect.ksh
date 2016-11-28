#!/bin/ksh


tmstmp=`date +'%Y%m%d%H%M%S' `
for nd in casdbnp207 casdbnp208 casdbnp209
 do




   echo "Nodetool Status " > mondata.$nd.$tmstmp
   echo "=========================" >> mondata.$nd.$tmstmp
   nodetool -h $nd  status  >> mondata.$nd.$tmstmp
   echo "Nodetool Info " >> mondata.$nd.$tmstmp
   echo "=========================" >> mondata.$nd.$tmstmp
   nodetool -h  $nd info  >> mondata.$nd.$tmstmp
   echo "Nodetool cfstats " >> mondata.$nd.$tmstmp
   echo "=========================" >> mondata.$nd.$tmstmp
   #nodetool cfstats | egrep -i "Keyspace|Column Family|SSTable|Read Latency|Write Latency" >> mondata.$nd.$tmstmp
   nodetool -h $nd cfstats >> mondata.cfstats.$nd.$tmstmp
   echo "Nodetool tpstats " >> mondata.$nd.$tmstmp
   echo "=========================" >> mondata.$nd.$tmstmp
   nodetool -h $nd tpstats  >> mondata.$nd.$tmstmp
   echo "Nodetool compactionstats " >>mondata.$nd.$tmstmp
   echo "=========================" >> mondata.$nd.$tmstmp
   nodetool -h compactionstats  >> mondata.$nd.$tmstmp
   echo "Nodetool netstats " >>mondata.$nd.$tmstmp
   echo "=========================" >> mondata.$nd.$tmstmp
   nodetool -h netstats  >> mondata.$nd.$tmstmp
   echo "Nodetool proxyhistograms " >> mondata.$nd.$tmstmp
   echo "=========================" >> mondata.$nd.$tmstmp
   nodetool -h proxyhistograms  >> mondata.$nd.$tmstmp




done




