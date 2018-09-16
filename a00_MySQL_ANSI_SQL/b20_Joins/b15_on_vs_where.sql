-- Info

  + `on` is used as join condition
  + `where` is used to filter a field (do not works with aliases; 
    so for any computed values, `where` does not work. `having` can be used for this purpose)

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
  
-- Left join (on)  

select * from test.books left join test.authors on books.authorid = authors.authorid;  
  
+------+----------+--------+----------+
| book | authorid | author | authorid |
+------+----------+--------+----------+
| b1   |       11 | au1    |       11 |
| b2   |       21 | au2    |       21 |
| b3   |       31 | NULL   |     NULL |
+------+----------+--------+----------+
3 rows in set (0.00 sec)

-- Left Join  (where)

select * from test.books left join test.authors where books.authorid = authors.authorid;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where books.authorid = authors.authorid' at line 1

-- Left join (on & where)

select * from test.books left join test.authors 
on books.authorid = authors.authorid
where books.authorid in (11, 31);

+------+----------+--------+----------+
| book | authorid | author | authorid |
+------+----------+--------+----------+
| b1   |       11 | au1    |       11 |
| b3   |       31 | NULL   |     NULL |
+------+----------+--------+----------+
2 rows in set (0.00 sec)



  