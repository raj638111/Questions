-- Info

  - no of rows of 1st table * no of rows of 2nd table

-- DDL

drop table test.books;
create table test.books(
  book varchar(255) not null,
  authorid int
);

drop table test.authors;
create table test.authors(
  author varchar(255) not null,
  authorid int not null
);

-- Data

truncate table test.books;
insert into test.books 
  (book, authorid) 
values
  ('b1', 11),
  ('b2', 21),
  ('b3', 31);

  
truncate table test.authors;
insert into test.authors
  (author, authorid)
values
  ('au1', 11),
  ('au2', 21),
  ('au4', 41);
  
-- cross join

select * from test.books cross join test.authors  
  
+------+----------+--------+----------+
| book | authorid | author | authorid |
+------+----------+--------+----------+
| b1   |       11 | au1    |       11 |
| b2   |       21 | au1    |       11 |
| b3   |       31 | au1    |       11 |
| b1   |       11 | au2    |       21 |
| b2   |       21 | au2    |       21 |
| b3   |       31 | au2    |       21 |
| b1   |       11 | au4    |       41 |
| b2   |       21 | au4    |       41 |
| b3   |       31 | au4    |       41 |
+------+----------+--------+----------+
9 rows in set (0.00 sec)

-- cross join (on)

select * from test.books cross join test.authors on books.authorid = authors.authorid;

+------+----------+--------+----------+
| book | authorid | author | authorid |
+------+----------+--------+----------+
| b1   |       11 | au1    |       11 |
| b2   |       21 | au2    |       21 |
+------+----------+--------+----------+
2 rows in set (0.00 sec)



