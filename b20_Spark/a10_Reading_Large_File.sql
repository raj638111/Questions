

-- What happens if we read a file that is larger than the amount of memory
-- available in the Executor?

  + Spark reads only the N (where N is total no of cores) no of
    partitions at a given time

    . So if we have a total of 4 cores for our job, event if the total
      no of partitions that need to be read is 30, Spark will read
      only 4 partitions at a given time. ***As long as the partition
      is able to fit in memory, than we are fine. Or else, we would
      get OOM exception and the container would be killed by YARN

    . Once all the transformation is applied for the first 4 set of
      partitions, the result is stored as Shuffle data

    . Spark then reads the next 4 set of partitions, applies the
      transformation & load the result as shuffle data


    https://stackoverflow.com/a/46931374/892857

--