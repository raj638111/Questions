
-- Scalar (Single row, single column)

  + Scalar sub queries can be used in,
    - `case when` statement
    - As a field value
    
  + Will get error if the result is not scalar
  
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
  
-- Subquery (As a field value)

select book, authorid, 
(select author from test.authors where authorid=books.authorid) as author_name from test.books;   

+------+----------+-------------+
| book | authorid | author_name |
+------+----------+-------------+
| b1   |       11 | au1         |
| b2   |       21 | au2         |
| b3   |       31 | NULL        |
+------+----------+-------------+


