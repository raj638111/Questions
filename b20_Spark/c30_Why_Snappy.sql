

-- Why Snappy?

  Google created Snappy because they needed something that
  offered very fast compression at the expense of final size.

  For example, running a basic test with a 5.6 MB CSV file
  called foo.csv results in a 2.4 MB Snappy filefoo.csv.sz.
  Using the same file foo.csv with GZIP results in a final
  file size of 1.5 MB foo.csv.gz. However, Snappy used 30%
  CPU while GZIP used 58%.

  https://blog.openbridge.com/what-is-google-snappy-high-speed-data-compression-and-decompression-f6919f20dce4