#!/usr/bin/env bash

bash --login

# Set up ssh to localhost
ssh-keygen
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# Download hadoop tarball
wget http://www-eu.apache.org/dist/hadoop/common/hadoop-2.8.0/hadoop-2.8.0.tar.gz
tar xzf hadoop-2.8.0.tar.gz


# Update env variables
echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64" >> ~/.bashrc
echo "export HADOOP_HOME=/home/hadoop/hadoop-2.8.0" >> ~/.bashrc
echo "export PATH=\$PATH:\$HADOOP_HOME/bin:\$HADOOP_HOME/sbin" >> ~/.bashrc
. ~/.bashrc


# Copy config
cat > $HADOOP_HOME/etc/hadoop/core-site.xml <<- EOM
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:9000</value>
    </property>
    <property>
        <name>hadoop.tmp.dir</name>
        <value>/home/hadoop/hadoop-2.8.0/tmp</value>
    </property>
</configuration>
EOM

cat > $HADOOP_HOME/etc/hadoop/hdfs-site.xml <<- EOM
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>
EOM


# Create a new HDFS
hdfs namenode -format
start-dfs.sh

# Create user folder and change permission
hdfs dfs -mkdir /user/username
hdfs dfs -chown username:username /user/username
