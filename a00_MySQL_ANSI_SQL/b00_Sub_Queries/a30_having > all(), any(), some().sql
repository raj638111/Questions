
-- Info

  + all: Returns true if all of the subquery values meet the condition else false
  + any: Returns true if any of the subquery values meet the condition else false
    - 'some()' is an alias for 'any' 
  
-- DDL

drop table test.orders;
create table test.orders(
  orderid int not null,
  productid int not null,
  quantity int not null
);  
  

-- Data

truncate table test.orders;
insert into test.orders (orderid, productid, quantity)
values
  (1, 1, 10),
  (1, 2, 20),
  (2, 1, 40),
  (2, 2, 50);
  
------------------------------------------------------------------------------
-- 'all'
------------------------------------------------------------------------------

select orderid, max(quantity) from orders group by orderid
having max(quantity) > all (select avg(quantity) from test.orders group by orderid);

+---------+---------------+
| orderid | max(quantity) |
+---------+---------------+
|       2 |            50 |
+---------+---------------+
1 row in set (0.01 sec)

-- Subquery results -------

select orderid, max(quantity) from orders group by orderid;
+---------+---------------+
| orderid | max(quantity) |
+---------+---------------+
|       1 |            20 |
|       2 |            50 |
+---------+---------------+
2 rows in set (0.00 sec)


select avg(quantity) from test.orders group by orderid;   
+---------------+
| avg(quantity) |
+---------------+
|       15.0000 |
|       45.0000 |
+---------------+
2 rows in set (0.00 sec)


------------------------------------------------------------------------------
-- 'any'
------------------------------------------------------------------------------
  
select orderid, max(quantity) from orders group by orderid
having max(quantity) > any (select avg(quantity) from test.orders group by orderid);

+---------+---------------+
| orderid | max(quantity) |
+---------+---------------+
|       1 |            20 |
|       2 |            50 |
+---------+---------------+
2 rows in set (0.00 sec)

