

-- Accumulators

  # Used to,
    + Implement Counters

  # Support for
    + Numeric types
      - Is natively supported by spark
    + Custom Types
      - Programmers can add

  # Types
    + Named accumulator
      - Will display in the WebUI
    + Unnamed accumulator

  # Guarantees
    + Inside action,
      - Each task update will only be applied once
        (Restart of a task will not update the value)
    + Inside transformation
      - Each task update may be applied more than once
        (ie if a task fail)

  # Lazy Evaluation
    val accum = sc.longAccumulator
    data.map { x => accum.add(x); x }
    *Here, accum is still 0 because no actions have caused the map operation to be computed.

  https://spark.apache.org/docs/latest/rdd-programming-guide.html#accumulators