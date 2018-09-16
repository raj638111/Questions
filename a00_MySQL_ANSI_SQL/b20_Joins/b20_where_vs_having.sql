-- Info

  + `having` works on computed results where as `where` does not work

-- DDL

drop table test.authors;
create table test.authors(
  author varchar(255) not null,
  authorid int not null
);

-- Data

truncate table test.authors;
insert into test.authors
  (author, authorid)
values
  ('au1', 11),
  ('au2', 21),
  ('au4', 41);

-- Alias (Computation)

select a.author, a.authorid, 
case when a.authorid >= 20 then 'gte20' else 'lt20' end as grouping 
from test.authors a;

+--------+----------+----------+
| author | authorid | grouping |
+--------+----------+----------+
| au1    |       11 | lt20     |
| au2    |       21 | gte20    |
| au4    |       41 | gte20    |
+--------+----------+----------+
3 rows in set (0.00 sec)

-- where ( Does not work)

select a.author, a.authorid, 
case when a.authorid >= 20 then 'gte20' else 'lt20' end as grouping 
from test.authors a where grouping = 'lt20';

ERROR 1054 (42S22): Unknown column 'grouping' in 'where clause'

-- having (Works)

select a.author, a.authorid, 
case when a.authorid >= 20 then 'gte20' else 'lt20' end as grouping 
from test.authors a having grouping = 'lt20';

+--------+----------+----------+
| author | authorid | grouping |
+--------+----------+----------+
| au1    |       11 | lt20     |
+--------+----------+----------+
1 row in set (0.00 sec)

