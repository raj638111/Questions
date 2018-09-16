
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
  
-- from

select * from 
(
  select orderid, sum(quantity) as sum from test.orders group by orderid 
)a;


  