
# CAP Theorem says only 2 of the 3 attributes can be achieved
  We can still achive 3rd attribute, but not close to 100%

-- Consistency

  + Does all the replicated partitions has the same latest data?
    - If yes, then we say the system is Consistent as irrespective of
      which partition we are reading, we are going to get the same data


-- Availability?

  + Is the system availability all the time or we have down time?
    - If yes, then we have the system is available all the time

  + ie... Every non failing node returns response to read or write request
    in a reasonable period of time
    https://www.youtube.com/watch?v=82wuPR5exmM


-- Partition Tolerance

  + In case of N/W failure when some of the nodes are not
    able to communicate with other nodes, can the system function?
    - If yes, then we say the system is partition tolerance



Reference:
  https://www.youtube.com/watch?v=k-Yaq8AHlFA
  https://www.youtube.com/watch?v=82wuPR5exmM

