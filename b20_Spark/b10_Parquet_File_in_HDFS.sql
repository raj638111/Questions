

-- Reading a single parquet file from HDFS

    # No of partition = No of Blocks(Not HDFS block, but the
        Parquet block size) of a single parquet file
        ^^ Is this basically parquet row group size [2]
        (This is normally same as HDFS block size[3])


# Note
    + snappy compressed parquet file are splittable [3]
    + gzip compressed parquet file are not splittable

[1] https://stackoverflow.com/questions/27194333/how-to-split-parquet-files-into-many-partitions-in-spark
[2] https://stackoverflow.com/questions/42918663/is-it-better-to-have-one-large-parquet-file-or-lots-of-smaller-parquet-files
[3] https://boristyukin.com/is-snappy-compressed-parquet-file-splittable/
