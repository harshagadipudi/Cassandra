tmstmp=`date +'%Y%m%d%H%M%S' `
for nd in IP1 IP2 IP3 IP4 IP5 IP6 IP7 IP8 

 do

 for tab in `cat table.txt`
 do

  schema=`echo $tab | cut -d "." -f1 `
  tabnm=`echo $tab | cut -d "." -f2 `
  /opt/cassandra/bin/nodetool -u cassandra -pw <Password> -h $nd cfhistograms $schema $tabnm >> histogram.$nd.$tmstmp.out
  #echo $schema $tabnm
 done
done
