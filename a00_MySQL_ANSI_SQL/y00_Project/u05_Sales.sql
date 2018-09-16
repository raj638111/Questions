
-- DDL & Data

drop table test.salesperson;
create table test.salesperson(
  id int not null,
  name varchar(100) not null,
  age int not null,
  salary int not null
);


drop table test.customer;
create table test.customer(
  id int not null,
  name varchar(100) not null,
  city varchar(100) not null,
  industry_type varchar(1) not null
);

drop table test.orders;
create table test.orders(
  number int not null,
  order_date varchar(100) not null,
  cust_id int not null,
  salesperson_id int not null,
  amount int not null
);


-- Data

truncate table test.salesperson;
insert into test.salesperson 
  (id, name, age, salary) 
values
  (1, 'Abe', 61, 140000),
  (2, 'Bob', 34, 44000),
  (5, 'Chris', 34, 40000),
  (7, 'Dan', 41, 52000),
  (8, 'Ken', 57, 115000),
  (11, 'Joe', 38, 38000);

truncate table test.customer;
insert into test.customer (id, name, city, industry_type)
values
  (4, 'Samsonic', 'pleasant', 'J'),
  (6, 'Panasung', 'oaktown', 'J'),
  (7, 'Samony', 'jackson', 'B'),
  (9, 'Orange', 'Jackson', 'B');
  
truncate table test.orders;
insert into test.orders (number, order_date, cust_id, salesperson_id, amount)
values
  (10, "8/2/96", 4, 2, 540),
  (20, "1/30/99", 4, 8, 1800),
  (30, "7/14/95", 9, 1, 460),
  (40, "1/29/98", 7, 2, 2400),
  (50, "2/3/98", 6, 7, 600),
  (60, "3/2/98", 6, 7, 720),
  (70, "5/6/98", 9, 7, 150);

-- Names of all sales people that have order with Samsonic

select s.name as sales_person from
(select * from customer where name='Samsonic')c 
left join orders o on o.cust_id = c.id
left join salesperson s on s.id = o.salesperson_id;
+--------------+
| sales_person |
+--------------+
| Bob          |
| Ken          |
+--------------+

-- Names of all sales people that do not have order with Samsonic

select name as sales_person from salesperson having sales_person not in  
(select s.name as sales_person from
(select * from customer where name='Samsonic')c 
left join orders o on o.cust_id = c.id
left join salesperson s on s.id = o.salesperson_id)

+--------------+
| sales_person |
+--------------+
| Abe          |
| Chris        |
| Dan          |
| Joe          |
+--------------+

-- Names of sales people that have 2 or more orders

select s.name from
(select salesperson_id from orders group by salesperson_id having count(salesperson_id) >= 2)o
left join salesperson s on s.id = o.salesperson_id;

+------+
| name |
+------+
| Bob  |
| Dan  |
+------+

-- Names & age of all sales person having a salary of 100,000 or greater


select name, age, salary from salesperson where salary >= 100000; 

+------+-----+--------+
| name | age | salary |
+------+-----+--------+
| Abe  |  61 | 140000 |
| Ken  |  57 | 115000 |
+------+-----+--------+


-- Sales people who sold more than 1400 total units

select s.name, o.total from
(select salesperson_id, sum(amount) as total from orders 
group by salesperson_id having total >= 1400) o
left join salesperson s on s.id = o.salesperson_id;

+------+-------+
| name | total |
+------+-------+
| Bob  |  2940 |
| Dan  |  1470 |
| Ken  |  1800 |
+------+-------+

-- When was the earlier & the latest order made by Samony

select c.name, min(o.dt) as min_date, max(o.dt) as max_date from
(select id, name from Customer where name='Samony')c
left join 
(select cust_id, str_to_date(order_date, "%m/%d/%Y") as dt from orders) o
on c.id = o.cust_id
group by c.name;

+--------+------------+------------+
| name   | min_date   | max_date   |
+--------+------------+------------+
| Samony | 1998-01-29 | 1998-01-29 |
+--------+------------+------------+











