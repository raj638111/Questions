
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
  ('au2', 21),
  ('au4', 41);
  
  
-- Right outer Join  (on)
  
select * from test.books right join test.authors on books.authorid = authors.authorid;

+------+----------+--------+----------+
| book | authorid | author | authorid |
+------+----------+--------+----------+
| b1   |       11 | au1    |       11 |
| b2   |       21 | au2    |       21 |
| NULL |     NULL | au4    |       41 |
+------+----------+--------+----------+
3 rows in set (0.00 sec)

-- Right outer Join  (where)

select * from test.books right join test.authors where books.authorid = authors.authorid;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where books.authorid = authors.authorid' at line 1

