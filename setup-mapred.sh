#!/usr/bin/env bash

cat > $HADOOP_HOME/etc/hadoop/mapred-site.xml <<- EOM
<configuration>
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
    </property>
</configuration>
EOM

cat > $HADOOP_HOME/etc/hadoop/mapred-site.xml <<- EOM
<configuration>
    <property>
        <name>yarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
    </property>
</configuration>
EOM

start-yarn.sh
