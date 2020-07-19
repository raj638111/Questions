





master dns: ec2-18-212-220-172.compute-1.amazonaws.com

cd ~/Desktop/spark;
ssh hadoop@ec2-18-212-220-172.compute-1.amazonaws.com -i ./raj.pem;

scp -i ~/Desktop/spark/raj.pem ./sk-assembly-0.1.0-SNAPSHOT.jar hadoop@ec2-18-212-220-172.compute-1.amazonaws.com:/

https://stackoverflow.com/questions/39095655/operation-timed-out-error-on-trying-to-ssh-in-to-the-amazon-emr-spark-cluster/39133967


Name of interface
URI

Ganglia	http://master-public-dns-name/ganglia/
Hadoop HDFS NameNode	https://master-public-dns-name:50470/
Hadoop HDFS DataNode	https://coretask-public-dns-name:50475/
HBase	http://master-public-dns-name:16010/
Hue	http://master-public-dns-name:8888/
JupyterHub	https://master-public-dns-name:9443/
Livy	http://master-public-dns-name:8999/
Spark HistoryServer	http://master-public-dns-name:18080/
Tez	http://master-public-dns-name:8080/tez-ui
YARN NodeManager	http://coretask-public-dns-name:8042/
YARN ResourceManager	http://master-public-dns-name:8088/
Zeppelin	http://master-public-dns-name:8890/

YARN ResourceManager
    http://ec2-54-174-144-142.compute-1.amazonaws.com:8088/