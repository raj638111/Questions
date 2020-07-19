
-- 101

  - The theorem talks about trade-off b/w **Consistency &
    **Availability if the system ever suffers **Partitions
    (https://www.youtube.com/watch?v=k-Yaq8AHlFA&t=2s)

-- Consistency

  - Consistency means that all clients see the same data at the
    same time, no matter which node they connect to. For this
    to happen, whenever data is written to one node, it must be
    instantly forwarded or replicated to all the other nodes
    in the system before the write is deemed ‘successful’

-- Availability

  + E1,
    - Every request receives a response(non-error) (even if
      one or more nodes are down), without the guarantee that it
      contains the most recent write

  + E2
    - Availability means that that any client making a request
      for data gets a response, even if one or more nodes are
      down. Another way to state this—all working nodes in the
      distributed system return a valid response for any request,
      without exception.


-- Partition Tolerance

  + E1,
    - Is a communications break within a distributed system—a
      lost or temporarily delayed connection between two nodes.
      Partition tolerance means that the cluster must continue
      to work despite any number of communication breakdowns
      between nodes in the system

-- Reference

  https://www.ibm.com/cloud/learn/cap-theorem
  https://en.wikipedia.org/wiki/CAP_theorem