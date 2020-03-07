

-- Reading uncompressed single text file

    # No of partition = No of input split of the text file
      (Note: Input split id done on **Line Split & not on **Block Split)
    # TextInputFormat is used to do the split
    # No of split = No of blocks in HDFS
    https://stackoverflow.com/questions/29011574/how-does-spark-partitioning-work-on-files-in-hdfs

-- Reading compressed single file

    # As compressed file cannot be split. Reading a single
      compressed file will give single partition



