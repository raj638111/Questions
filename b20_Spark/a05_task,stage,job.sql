

-- task

    + Each transformation we do in spark can be considered as a task
    + Failed task
      - Failed task are retried in spark
                        ^^ spark.task.maxFailures  4 (4 is the default)
      https://stackoverflow.com/questions/26260006/are-failed-tasks-resubmitted-in-apache-spark

-- Stage

    + Those continuous set of transformation that is not involved
      in any shuffling of data are grouped into stage
    + Example
        - map
        - filter
        - flatMap

    + Any transformation that involved shuffling is moved into a new Stage

    https://umbertogriffo.gitbook.io/apache-spark-best-practices-and-tuning/avoiding_shuffle_less_stage-_more_fast
