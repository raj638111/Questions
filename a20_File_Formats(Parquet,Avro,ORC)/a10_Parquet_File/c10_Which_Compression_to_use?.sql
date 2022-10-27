

-- Which compression to use?

  # snappy is recommened as,
    + Is splittable
    + Less intensive on CPU (ie Faster to compress & decompress)
    + Disadvantage
      - Do not compress that much vis-a-vis gzip or bzip2


https://boristyukin.com/is-snappy-compressed-parquet-file-splittable/