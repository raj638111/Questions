
X city built a new stadium, each day many people visit it and the stats are saved as these columns: id, visit_date, people

Please write a query to display the records which have 3 or more consecutive rows and the amount of people more than 100(inclusive).

For example, the table stadium:
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 1    | 2017-01-01 | 10        |
| 2    | 2017-01-02 | 109       |
| 3    | 2017-01-03 | 150       |
| 4    | 2017-01-04 | 99        |
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+
For the sample data above, the output is:

+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+
Note:
Each day only have one row record, and the dates are increasing with id increasing.

-- Solution 4 (User solution) (Cross Join)
-- Comparison based on date is not working..ie Solution 2, Solution 1

select distinct t1.*
from stadium t1, stadium t2, stadium t3
where t1.people >= 100 and t2.people >= 100 and t3.people >= 100
and
(
	  (t1.id - t2.id = 1 and t1.id - t3.id = 2 and t2.id - t3.id =1)  -- t1, t2, t3
    or
    (t2.id - t1.id = 1 and t2.id - t3.id = 2 and t1.id - t3.id =1) -- t2, t1, t3
    or
    (t3.id - t2.id = 1 and t2.id - t1.id =1 and t3.id - t1.id = 2) -- t3, t2, t1
)
order by t1.id
;


-- Solution 3(SubQuery in Select)
-- Comparison based on date is not working..ie Solution 2, Solution 1

select a.id, a.visit_date, a.people
from
(select
  id, visit_date, people,
  (select s2.people from stadium s2 where
      s2.id = s1.id - 1) as yesterdayPeople,
  (select s2.people from stadium s2 where
      s2.id = s1.id - 2) as dayBeforeYesterdayPeople,
  (select s2.people from stadium s2 where
      s2.id = s1.id + 1) as tomorrowPeople,
  (select s2.people from stadium s2 where
      s2.id = s1.id + 2) as dayAfterTomorrowPeople
from stadium s1)a
where
(a.people >= 100) and
((a.yesterdayPeople >= 100 and a.tomorrowPeople >= 100) or
(a.yesterdayPeople >= 100 and a.dayBeforeYesterdayPeople >= 100) or
(a.tomorrowPeople >= 100 and a.dayAfterTomorrowPeople >= 100))


-- Solution 2 (This also do not work for one of the use case)


select distinct t1.*
from stadium t1, stadium t2, stadium t3
where t1.people >= 100 and t2.people >= 100 and t3.people >= 100 and
(
  (t3.visit_date = DATE_ADD(t1.visit_date, interval 2 day) and
  t2.visit_date = DATE_ADD(t1.visit_date, interval 1 day)) or

  (t3.visit_date = DATE_ADD(t1.visit_date, interval 1 day) and
  t2.visit_date = DATE_ADD(t1.visit_date, interval -1 day)) or

  (t3.visit_date = DATE_ADD(t1.visit_date, interval -1 day) and
  t2.visit_date = DATE_ADD(t1.visit_date, interval -2 day))
)
order by t1.id
;

-- Solution 1: (Failing in one of the case; but should not be...not sure??? )

select a.id, a.visit_date, a.people
from
(select
  id, visit_date, people,
  (select s2.people from stadium s2 where
      s2.visit_date = DATE_ADD(s1.visit_date, INTERVAL -1 DAY)) as yesterdayPeople,
  (select s2.people from stadium s2 where
      s2.visit_date = DATE_ADD(s1.visit_date, INTERVAL -2 DAY)) as dayBeforeYesterdayPeople,
  (select s2.people from stadium s2 where
      s2.visit_date = DATE_ADD(s1.visit_date, INTERVAL + 1 DAY)) as tomorrowPeople,
  (select s2.people from stadium s2 where
      s2.visit_date = DATE_ADD(s1.visit_date, INTERVAL + 2 DAY)) as dayAfterTomorrowPeople
from stadium s1)a
where
(a.people >= 100) and
((a.yesterdayPeople >= 100 and a.tomorrowPeople >= 100) or
(a.yesterdayPeople >= 100 and a.dayBeforeYesterdayPeople >= 100) or
(a.tomorrowPeople >= 100 and a.dayAfterTomorrowPeople >= 100))

