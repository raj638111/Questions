

-- Input Split (Uncompressed Files)

    # Is the logical representation of data, where each split act
      as an input for the Mapper
      (Whereas Block is a physical division of data)

    # No of map tasks = No of splits

    # An input split can also span adjacent blocks

    # For a text file,
        + Default: No of input split = No of blocks

    # Can I specify split size in the MapReduce program?
        + Yep, if not specified, HDFS block size is taken as split size

    https://stackoverflow.com/a/30549772/892857

-- Input Split (Compressed file)

    # Input split is only possible if the file format + compression supports that
    # When a file is not splittable, irrespective of the no of blocks for a file
      only a single Mapper will read the entire file

    https://stackoverflow.com/a/33331823/892857


