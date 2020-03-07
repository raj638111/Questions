You want to perform table lookups against a KTable everytime a new record is received from the KStream. What is the output of KStream-KTable join?
A Kafka producer application wants to send log messages to a topic that does not include any key. What are the properties that are mandatory to configure for the producer configuration? (select three)
How do Kafka brokers ensure great performance between the producers and consumers? (select two)
Where are the ACLs stored in a Kafka cluster by default?
A consumer starts and has auto.offset.reset=latest, and the topic partition currently has data for offsets going from 45 to 2311. The consumer group has committed the offset 643 for the topic before. Where will the consumer read from?
The exactly once guarantee in the Kafka Streams is for which flow of data?
A Zookeeper ensemble contains 3 servers. Over which ports the members of the ensemble should be able to communicate in default configuration? (select three)
A topic receives all the orders for the products that are available on a commerce site. Two applications want to process all the messages independently - order fulfilment and monitoring. The topic has 4 partitions, how would you organise the consumers for optimal performance and resource usage?
Which of the following errors are retriable from a producer perspective? (select two)
There are two consumers C1 and C2 belonging to the same group G subscribed to topics T1 and T2. Each of the topics has 3 partitions. How will the partitions be assigned to consumers with PartitionAssignor being RoundRobinAssignor?
You are using JDBC source connector to copy data from 2 tables to two Kafka topics. There is one connector created with max.tasks equal to 2 deployed on a cluster of 3 workers. How many tasks are launched?
You are using JDBC source connector to copy data from 2 tables to two Kafka topics. There is one connector created with max.tasks equal to 2 deployed on a cluster of 3 workers. How many tasks are launched?
To get acknowledgement of writes to only the leader partition, we need to use the config...
Producing with a key allows to...
We would like to be in an at-most once consuming scenario. Which offset commit strategy would you recommend?
A kafka topic has a replication factor of 3 and min.insync.replicas setting of 1. What is the maximum number of brokers that can be down so that a producer with acks=all can still produce to the topic?
A consumer application is using KafkaAvroDeserializer to deserialize Avro messages. What happens if message schema is not present in AvroDeserializer local cache?
There are 3 producers writing to a topic with 5 partitions. There are 5 consumers consuming from the topic. How many Controllers will be present in the cluster?
In Avro, adding a field to a record without default is a __ schema evolution
A consumer wants to read messages from a specific partition of a topic. How can this be achieved?
A client connects to a broker in the cluster and sends a fetch request for a partition in a topic. It gets an exception NotLeaderForPartitionException in the response. How does client handle this situation?
You have a Kafka cluster and all the topics have a replication factor of 3. One intern at your company stopped a broker, and accidentally deleted all the data of that broker on the disk. What will happen if the broker is restarted?
Your producer is producing at a very high rate and the batches are completely full each time. How can you improve the producer throughput? (select two)
What isn't an internal Kafka Connect topic?
What information isn't stored inside of Zookeeper? (select two)
Select all the way for one consumer to subscribe simultaneously to the following topics - topic.history, topic.sports, topic.politics? (select two)
You want to sink data from a Kafka topic to S3 using Kafka Connect. There are 10 brokers in the cluster, the topic has 2 partitions with replication factor of 3. How many tasks will you configure for the S3 connector?
A bank uses a Kafka cluster for credit card payments. What should be the value of the property unclean.leader.election.enable?
How will you find out all the partitions where one or more of the replicas for the partition are not in-sync with the leader?
If I produce to a topic that does not exist, and the broker setting auto.create.topic.enable=true, what will happen?
is KSQL ANSI SQL compliant?
To import data from external databases, I should use
If I want to have an extremely high confidence that leaders and replicas have my data, I should use
To enhance compression, I can increase the chances of batching by using
Where are the dynamic configurations for a topic stored?
Which is an optional field in an Avro record?
If a topic has a replication factor of 3...
A customer has many consumer applications that process messages from a Kafka topic. Each consumer application can only process 50 MB/s. Your customer wants to achieve a target throughput of 1 GB/s. What is the minimum number of partitions will you suggest to the customer for that particular topic?
Which of the following event processing application is stateless? (select two)
What client protocol is supported for the schema registry? (select two)
Select all that applies
I am producing Avro data on my Kafka cluster that is integrated with the Confluent Schema Registry. After a schema change that is incompatible, I know my data will be rejected. Which component will reject the data?
How will you read all the messages from a topic in your KSQL query?
Which of the following Kafka Streams operators are stateful? (select all that apply)
You are running a Kafka Streams application in a Docker container managed by Kubernetes, and upon application restart, it takes a long time for the docker container to replicate the state and get back to processing the data. How can you improve dramatically the application restart?
Which of the following setting increases the chance of batching for a Kafka Producer?
What is the risk of increasing max.in.flight.requests.per.connection while also enabling retries in a producer?
Using the Confluent Schema Registry, where are Avro schema stored?
If I want to send binary data through the REST proxy to topic "test_binary", it needs to be base64 encoded. A consumer connecting directly into the Kafka topic "test_binary" will receive
What isn't a feature of the Confluent schema registry?




You are building a consumer application that processes events from a Kafka topic. What is the most important metric to monitor to ensure real-time processing?
A topic has three replicas and you set min.insync.replicas to 2. If two out of three replicas are not available, what happens when a consume request is sent to broker?
Kafka is configured with following parameters - log.retention.hours = 168 log.retention.minutes = 168 log.retention.ms = 168 How long will the messages be retained for?
Compaction is enabled for a topic in Kafka by setting log.cleanup.policy=compact. What is true about log compaction?
A producer application was sending messages to a partition with a replication factor of 2 by connecting to Broker 1 that was hosting partition leader. If the Broker 1 goes down, what will happen?
To transform data from a Kafka topic to another one, I should use
The Controller is a broker that is... (select two)
Your topic is log compacted and you are sending a message with the key K and value null. What will happen?
You are sending messages with keys to a topic. To increase throughput, you decide to increase the number of partitions of the topic. Select all that apply.
How does a consumer commit offsets in Kafka?
A kafka topic has a replication factor of 3 and min.insync.replicas setting of 2. How many brokers can go down before a producer with acks=all can't produce?
A consumer starts and has auto.offset.reset=none, and the topic partition currently has data for offsets going from 45 to 2311. The consumer group has committed the offset 10 for the topic before. Where will the consumer read from?
How will you find out all the partitions without a leader?
In Java, Avro SpecificRecords classes are
A consumer sends a request to commit offset 2000. There is a temporary communication problem, so the broker never gets the request and therefore never responds. Meanwhile, the consumer processed another batch and successfully committed offset 3000. What should you do?
Select the Kafka Streams joins that are always windowed joins.
You are doing complex calculations using a machine learning framework on records fetched from a Kafka topic. It takes more about 6 minutes to process a record batch, and the consumer enters rebalances even though it's still running. How can you improve this scenario?
To prevent network-induced duplicates when producing to Kafka, I should use?
What data format isn't natively available with the Confluent REST Proxy?
How can you gracefully make a Kafka consumer to stop immediately polling data from Kafka and gracefully shut down a consumer application?
What Java library is KSQL based on?
You are using JDBC source connector to copy data from 3 tables to three Kafka topics. There is one connector created with max.tasks equal to 2 deployed on a cluster of 3 workers. How many tasks are launched?
To allow consumers in a group to resume at the previously committed offset, I need to set the proper value for...?
An ecommerce website maintains two topics - a high volume "purchase" topic with 5 partitions and low volume "customer" topic with 3 partitions. You would like to do a stream-table join of these topics. How should you proceed?





--

Learn more about stateful and stateless operators in kafka stream?

Understand how different operators b/w KStream & KTable produce result; ie KTable
 or KStream etc...?
Read about rebalance?
    Is there anything like partition rebalance, consumer rebalance?
Stateful / Stateless transformation?
Understand more about windowed joins (Windowing)
Command to identify all the topics & partitions that are associated with the consumer group
 to identify the lag?
Read about segment (what does a single partition have?)
Compile a list of stateful & stateless operations
What are followers in Zookeeper
Find the difference b/w
    heartbeat.interval.ms
    session.timeout.ms
    max.poll.interval.ms: Consumer is considered dead if it did not call poll method
                          within this time
Find about
    num.streams.threads
producer_byte_rates

What is the diff b/w user, client-id or client-id group
    Understand more about quotas

auto.leader.rebalance.enable ???
Does each KStream in stransformation get an instance? 49

Do some programming on KStream + KTable join, aggregation, Windowing
  & see how it works?