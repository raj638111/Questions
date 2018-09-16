
-- DDL

drop table test.books;
create table test.books(
  book varchar(255) not null,
  author varchar(100) not null,
  revenue int not null
);

-- Data

truncate table test.books;
insert into test.books (book, author, revenue) values
('a1b1', 'a1', 100),
('a1b2', 'a1', 50),
('a2b1', 'a2', 80);

-- sum()

select author, sum(revenue) as revenue from test.books group by author;
+--------+---------+
| author | revenue |
+--------+---------+
| a1     |     150 |
| a2     |      80 |
+--------+---------+
2 rows in set (0.00 sec)

-- max()

select author, max(revenue) as revenue from test.books group by author;
+--------+---------+
| author | revenue |
+--------+---------+
| a1     |     100 |
| a2     |      80 |
+--------+---------+
2 rows in set (0.00 sec)


-- min()

select author, min(revenue) as revenue from test.books group by author;
+--------+---------+
| author | revenue |
+--------+---------+
| a1     |      50 |
| a2     |      80 |
+--------+---------+
2 rows in set (0.00 sec)


-- avg()

select author, avg(revenue) as revenue from test.books group by author;

+--------+---------+
| author | revenue |
+--------+---------+
| a1     | 75.0000 |
| a2     | 80.0000 |
+--------+---------+
2 rows in set (0.00 sec)
