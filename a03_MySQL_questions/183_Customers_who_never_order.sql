
Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

Table: Customers.

+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+

Table: Orders.

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+

Using the above tables as example, return the following:

+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+

select
  Name as Customers
from
  Customers
where
  Id not in (select CustomerId from Orders)

=== Example (using different methods; where in, where count) ===

drop table Customers;
create table Customers(
  Id int,
  Name varchar(255)
);

truncate table Customers;
insert into Customers
  (Id, Name)
values
  (1, "Joe"),
  (2, "Henry"),
  (3, "Sam"),
  (4, "Max");


use test;
drop table Orders;
create table Orders(
  Id int,
  CustomerId int
);

truncate table Orders;
insert into Orders
  (Id, CustomerId)
values
  (1, 3),
  (2, 1);

-- Query 1 (where in)

select Name as Customers
from Customers
where Id not in (select Id from Orders);

+-----------+
| Customers |
+-----------+
| Sam       |
| Max       |
+-----------+

-- Query 2 (where count): Probably less efficient

select Name as Customers
from Customers c
where (
  select count(*) from Orders o where
  c.Id = o.Id
) = 0;

+-----------+
| Customers |
+-----------+
| Sam       |
| Max       |
+-----------+



