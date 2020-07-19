

  # Kafka is **always **Partition Tolerant

  # So we can either achieve Consistency or Availability
    based on how we tune the configuration


-- Achieving Consistency

  + ISR = 2, for R.factor of 3
  + Unclean Leader Election = false (Ensures that the 1 non-ISR is not elected as
    Leader as this will compromise consistency)
  + Producer ack : acks = all (All ISR should acknowledge for a write)

  + Note: This configuration makes the system unAvailable for Producer
    for subsequent writes, when one of the ISR is not able to acknowledge for a write


-- Achieving Availability

  + acks = 0 or acks = 1 makes the system highly available
    but this compromise consistency as we do not get acknowledgment
    for the write from all the ISR


https://blog.knoldus.com/kafka-tuning-consistency-vs-availability/