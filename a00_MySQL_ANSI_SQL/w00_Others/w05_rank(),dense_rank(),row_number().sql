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
rank() over (partition by author order by revenue) as rank
from test.books;

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(partition by author order by revenue) as rank
from test.books' at line 2

-- @rank

set @rank := 0;
select book, author, revenue, 
@rank := @rank + 1 AS rank from books
order by author, revenue;

Note:
  This solution do not give partition based rank
  Refer this solution: http://kennethxu.blogspot.com/2016/04/analytical-function-in-mysql-rownumber.html
  
  
-- rank(), dense_rank(), row_number() in Hive (Spark SQL)

.withColumn("rowNum", row_number().over(Window.partitionBy($"partition_field").orderBy($"order_field")))  

  
  
  
  





