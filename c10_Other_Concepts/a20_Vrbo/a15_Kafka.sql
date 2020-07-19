
-- Kafka Stream

  + What is done in Kafka stream?
    - Session ID creation
    - Bot filtering
    - Additional Enrichment

  + What are the source topics for our clickstream pipeline?
    - userEventCoreUI & sessionEventCoreUI
    - Both those topics ^ are joined. The idea is to get
      session information in sessionEventCoreUI into
      events available in userEventCoreUI

  + Are we storing the session information from sessionEventCoreUI
    somewhere?
    - Yep, is stored in **Redis as kind of lookup table for data
      arriving in userEventCoreUI

  + Total amount of events / second? or /day?
    - 500 million events

  + On what key is userEvent & userSession is Partitioned?
      userEvent - visitor_id          - visitor_id
      userSession - server address    - visitor_id
      partition-event-edap - session_id (Redis)


-- Conflict Resolution

Using DataFrame to create DDL instead of using static DDL
  + Advantage:
    Field being not missed
    Avoiding data type conflict
