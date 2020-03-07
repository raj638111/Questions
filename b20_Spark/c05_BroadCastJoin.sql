
-- Broadcast Join (Map-Side Join)

  + What is Broadcast Join?
    - One side of the Join is materialized and sent to all mappers
      of the other side of join

  + Advantage
    - Avoids Shuffling of data

  + Constraint
    - Works only if the side of table we broadcast is small (Dimenstion table)
      (ie...When size if below spark.sql.autoBroadcastJoinThreshold)

  https://henning.kropponline.de/2016/12/11/broadcast-join-with-spark/
  https://stackoverflow.com/questions/32435263/dataframe-join-optimization-broadcast-hash-join
  https://jaceklaskowski.gitbooks.io/mastering-spark-sql/spark-sql-joins-broadcast.html
