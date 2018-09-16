-- Info

  + Produces concatenated value of the field delimited by ','

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
('a2b1', 'a2', 80);

-- group_concat()

select author, group_concat(revenue) as revenue from test.books group by author;

+--------+---------+
| author | revenue |
+--------+---------+
| a1     | 100,50  |
| a2     | 80      |
+--------+---------+
2 rows in set (0.00 sec)