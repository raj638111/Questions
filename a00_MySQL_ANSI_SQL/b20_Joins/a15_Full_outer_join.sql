-- Info

  - MySQl do not have full outer join
  - Can be emulated using left join, right join & union

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
  
-- Full outer join (using left join & union) 
--  Note: union elimnates duplicate values

select * from books left join authors on books.authorid = authors.authorid
union
select * from books right join authors on books.authorid = authors.authorid;
  
+------+----------+--------+----------+
| book | authorid | author | authorid |
+------+----------+--------+----------+
| b1   |       11 | au1    |       11 |
| b2   |       21 | au2    |       21 |
| b3   |       31 | NULL   |     NULL |
| NULL |     NULL | au4    |       41 |
+------+----------+--------+----------+
4 rows in set (0.00 sec)


