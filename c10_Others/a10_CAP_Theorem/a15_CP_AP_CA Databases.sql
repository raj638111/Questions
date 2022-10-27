

-- CP Database

  A CP database delivers consistency and partition tolerance
  at the expense of availability. When a partition occurs
  between any two nodes, the system has to shut down the
  non-consistent node (i.e., make it unavailable) until the
  partition is resolved

-- AP Database

  An AP database delivers availability and partition tolerance
  at the expense of consistency. When a partition occurs,
  all nodes remain available but those at the wrong end of
  a partition might return an older version of data than
  others. (When the partition is resolved, the AP databases
  typically resync the nodes to repair all inconsistencies in
  the system.)

-- CA Database

  A CA database delivers consistency and availability across
  all nodes. It can’t do this if there is a partition between
  any two nodes in the system, however, and therefore can’t
  deliver fault tolerance

  **In a distributed system, partitions can’t be avoided. So,
  while we can discuss a CA distributed database in theory,
  for all practical purposes, a CA distributed database can’t
  exist

https://www.ibm.com/cloud/learn/cap-theorem
