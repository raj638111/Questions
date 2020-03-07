

-- No of partitions

  # What would be the no of partitions if I read a single large (Say 2GB)
    Parquet file from HDFS in spark?

    + This again depends on the row group size irrespective of the
      Block size of HDFS
