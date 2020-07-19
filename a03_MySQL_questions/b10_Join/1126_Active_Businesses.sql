
Table: Events

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| business_id   | int     |
| event_type    | varchar |
| occurences    | int     |
+---------------+---------+
(business_id, event_type) is the primary key of this table.
Each row in the table logs the info that an event of some type occured at some business for a number of times.


Write an SQL query to find all active businesses.

An active business is a business that has more than one event type with occurences greater than the average occurences of that event type among all businesses.

The query result format is in the following example:

Events table:
+-------------+------------+------------+
| business_id | event_type | occurences |
+-------------+------------+------------+
| 1           | reviews    | 7          |
| 3           | reviews    | 3          |
| 1           | ads        | 11         |
| 2           | ads        | 7          |
| 3           | ads        | 6          |
| 1           | page views | 3          |
| 2           | page views | 12         |
+-------------+------------+------------+

Result table:
+-------------+
| business_id |
+-------------+
| 1           |
+-------------+
Average for 'reviews', 'ads' and 'page views' are (7+3)/2=5, (11+7+6)/3=8, (3+12)/2=7.5 respectively.
Business with id 1 has 7 'reviews' events (more than 5) and 11 'ads' events (more than 8) so it is an active business.


-- Solution 1 (Using join)

select
a.business_id
from
  (select
    business_id,
    event_type,
    avg(occurences) as avgOcc
  from
    Events
  group by
    business_id, event_type)a
join
  (select
    event_type,
    avg(occurences) as avgOcc
  from
    Events
  group by event_type) b
on
  a.event_type = b.event_type and
  a.avgOcc > b.avgOcc
group by
  a.business_id
having count(*) > 1




-- Solution 2 (Getting Internal error during Submission)

select
a.business_id
from
  (select
    business_id,
    event_type,
    avg(occurences) as avgOcc
  from
    Events
  group by
    business_id, event_type)a
where a.avgOcc > (
  select avg(occurences) from Events where event_type = a.event_type
  group by event_type
)
group by a.business_id
having count(*) > 1

