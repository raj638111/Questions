
-- YARN

    1. ResourceManager
        - Arbitrates resources among all applications in the system
        - Components
            1. Scheduler
                ~ Responsible for allocating resources to various running applications
                ~ Has Pluggable policy
                    . FairScheduler
                        ~ Gives priority for fair usage of cluster b/w applications
                    . CapacityScheduler
                        ~ Gives priority to maxium usage of cluster
            2. ApplicationManager
                ~ Accepts Job Submission
                ~ Negotiates first container (for an application) allocation to execute
                  ApplicationMaster
                ~ Restarts ApplicationMaster on failures
        - StandBy ResourceManager
            . Acts as a standby in case of Main ResourceManager failure
            . https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/ResourceManagerHA.html

    2. NodeManager
        - Is a per machine deamon
        - Responsible for container allocation
        - Monitors the resource (CPU, Disk, Memory, Network) & reports to
          ResourceManager

    3. ApplicationMaster
        - Each application has one ApplicationMaster
        - Negotiates for container allocation from Scheduler
        - Track & Monitor the Application status

-- HDFS

    1. NameNode
    2. SecondaryNameNode
        - Acts as a backup for NameNode
    3. DataNode


-- Others

    # Container
        + Is an abstraction of Memory, CPU, Disk, etc...

https://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-site/YARN.html