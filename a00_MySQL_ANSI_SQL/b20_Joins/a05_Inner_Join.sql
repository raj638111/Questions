
--

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

--

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
  ('au2', 21);
  
  
-- Join  
  
select * from test.books inner join test.authors on books.authorid = authors.authorid;
+------+----------+--------+----------+
| book | authorid | author | authorid |
+------+----------+--------+----------+
| b1   |       11 | au1    |       11 |
| b2   |       21 | au2    |       21 |
+------+----------+--------+----------+
2 rows in set (0.00 sec)










  
  
  