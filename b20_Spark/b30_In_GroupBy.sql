

-- How to resolve data skew in GroupBy?

# Increase the shuffle partition size
    + Default shuffle partition size is 200
    + So if the data set is too large, there might be
      large amount of data being shuffled to each of the 200
      partition which increases the compute time


# If shuffle partition do not work, what is the next option?
    + If one of the key in data is heavily skewed, irrespective
      of the no of shuffle partition, all the skewed data will go to
      one single partition which makes the task that operates on the
      partition more time to complete

    + Solution?
        - Add a group by with a salted key as intermediate transformation
        - This will reduce the data size of the skewed partition
        - Then remove the salted key and do the actual GroupBy
          this should mitigate the data skew issue

        - Limitation
          . For this to work, the aggregation operation we are performing
            should be both commutative & associative
            (Example: Addition & Multiplication are both commutative & associative)

