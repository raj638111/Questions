
-- Advantage

  + Allows programmer to keep a read-only variable cached on
    each machine rather than shipping a copy of it with tasks

  + Can be used, for example, to give every node a copy of a
    large input dataset in an efficient manner.

  https://spark.apache.org/docs/latest/rdd-programming-guide.html#broadcast-variables

-- Use case

  + A map value can be transferred over to all nodes for lookup

  (Registering a broacast variable with udf)
  def calculate(sparkSession: SparkSession): Unit = {
    ...
     val categoryNodesWithChildrenBC = sparkSession.sparkContext.
      ***broadcast(categoryNodesWithChildren)

     sparkSession.udf.register("isChildOf", (nodeId: Int, parentNodeId: Int) =>
       nodeId != parentNodeId && categoryNodesWithChildrenBC
        .value.getOrElse(nodeId, Set[Int]()).contains(parentNodeId))
    ...
  }

