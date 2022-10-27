

-- Which to use?

  -- Reason 1

    Whether to use Normalization or Denormalization should be decided
    by the efficiency of a specific schema in running query
    (Efficiency: The time it takes ot run the query)

  -- Reason 2

    Some of the distributed system might not support Joins or Joins
    might not be efficient. So we have to go with Denormalization

    Example: Druid, DynamoDB
             (Believe Joins are supported but not recommended)

