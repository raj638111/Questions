
Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.

+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
For example, given the above Scores table, your query should generate the following report (order by highest score):

+-------+------+
| Score | Rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+

-- This is more with SparkSQL

case class Score(
  Id: Int,
  Score: Double
)
val list = List(
  Score(1, 3.50),
  Score(2, 3.65),
  Score(3, 4.00),
  Score(4, 3.85),
  Score(5, 4.00),
  Score(6, 3.65)
)

==== Using SQL ====

  -- Syntax: rank() over (partition by field1 order by field2 desc) as field_name

import spark.implicits._
spark.sparkContext.parallelize(list).toDF.createOrReplaceTempView("vw")
val newdf = spark.sql("""
select
  Score,
  dense_rank() over (order by Score desc) as rank
from
  vw
"""
)
newdf.show(100, false)

==== Using API ====

import org.apache.spark.sql.expressions.Window
import spark.implicits._
val df = spark.sparkContext.parallelize(list).toDF
val window = Window.
  //partitionBy("Score").
  orderBy ($"Score".desc)
  //rowsBetween(Window.currentRow, 1)

val newdf = df.withColumn("rank", dense_rank() over window).drop("Id")
newdf.show(100, false)

