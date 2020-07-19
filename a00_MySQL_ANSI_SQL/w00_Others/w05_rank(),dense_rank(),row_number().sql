-- DDL

drop table test.books;
create table test.books(
  book varchar(255) not null,
  author varchar(100) not null,
  revenue int not null
);

-- Data

insert into test.books (book, author, revenue) values
('a1b1', 'a1', 100),
('a1b2', 'a1', 50),
('a1b3', 'a1', 121),
('a2b1', 'a2', 80);

-- rank() (yep :( there is not rank() function in MySQL)

select book, author, revenue, 
rank() over (partition by author order by revenue) rnk
from books;

+------+--------+---------+-----+
| book | author | revenue | rnk |
+------+--------+---------+-----+
| a1b2 | a1     |      50 |   1 |
| a1b1 | a1     |     100 |   2 |
| a1b3 | a1     |     121 |   3 |
| a2b1 | a2     |      80 |   1 |
+------+--------+---------+-----+

  
-- rank(), dense_rank(), row_number() in Hive (Spark SQL)

.withColumn("rowNum", row_number().over(Window.partitionBy($"partition_field").orderBy($"order_field")))  

  
  
  
  





