-- Subquery (where)

  + Can be used in where statement as part of
    - `in`
    - Comparision (>, <, etc...)

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
  
  
-- Subquery (where > in)

select * from test.books where authorid in (select authorid from test.authors);  
  
+------+----------+
| book | authorid |
+------+----------+
| b1   |       11 |
| b2   |       21 |
+------+----------+
2 rows in set (0.00 sec)

