
Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

+---------+------------------+------------------+
| Id(INT) | RecordDate(DATE) | Temperature(INT) |
+---------+------------------+------------------+
|       1 |       2015-01-01 |               10 |
|       2 |       2015-01-02 |               25 |
|       3 |       2015-01-03 |               20 |
|       4 |       2015-01-04 |               30 |
+---------+------------------+------------------+
For example, return the following Ids for the above Weather table:

+----+
| Id |
+----+
|  2 |
|  4 |
+----+

-- Data

drop table Weather;
create table Weather(
  Id int,
  RecordDate varchar(255),
  Temperature int
);

truncate table Weather;
insert into Weather
  (Id, RecordDate, Temperature)
values
  (1, '2015-01-01', 10),
  (2, '2015-01-02', 25),
  (3, '2015-01-03', 20),
  (4, '2015-01-04', 30);



-- Solution (join)

select
  w2.Id
from
  Weather w1
join
  Weather w2
on
  DATE_ADD(w1.RecordDate, INTERVAL 1 DAY)  = w2.RecordDate and
  w1.Temperature < w2.Temperature

+----+
| Id |
+----+
|  2 |
|  4 |
+----+

-- Solution (where)

select Id from Weather w1
where w1.Temperature > (
  select Temperature from Weather w2
  where w2.RecordDate = DATE_ADD(w1.RecordDate, INTERVAL -1 DAY)
);

+----+
| Id |
+----+
|  2 |
|  4 |
+----+

