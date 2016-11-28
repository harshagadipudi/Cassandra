 cat /root/cron-scripts/cassandra-backup
#!/bin/bash


# Clear all snapshots
/opt/dse/bin/nodetool -u controlRole -pwf /etc/cassandra/jmxremote.password clearsnapshot


# Create a new snapshot
/opt/dse/bin/nodetool -u controlRole -pwf /etc/cassandra/jmxremote.password snapshot -t snap-backup-full




