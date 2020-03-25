
Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key of this table.
This table shows the activity of players of some game.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.


Write an SQL query that reports the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

The query result format is in the following example:

Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+

Result table:
+-----------+
| fraction  |
+-----------+
| 0.33      |
+-----------+
Only the player with id 1 logged back in after the first day he had logged in so the answer is 1/3 = 0.33

-- Data

drop table Activity;
create table Activity(
  player_id int,
  device_id int,
  event_date date,
  games_played int
);

truncate table Activity;
insert into Activity
  (player_id, device_id, event_date, games_played)
values
  (1, 2, '2016-03-01', 5),
  (1, 2, '2016-03-02', 6),
  (2, 3, '2017-06-25', 1),
  (3, 1, '2016-03-02', 0),
  (3, 4, '2018-07-03', 5);


-- Result 1 (Join)

select
    round(count(a.player_id)/(select count(distinct player_id)
                              from Activity),2) as fraction
from
    Activity a
left join
    (select player_id, min(event_date) as mineventdate from Activity
     group by player_id) t
on
    a.event_date= t.mineventdate+1 and
    a.player_id=t.player_id
where t.mineventdate is not null


-- Result 2 (Join)

select
round((select count(*) from
(select player_id, min(event_date) as event_date
from Activity group by player_id)a
join
Activity b
on  date_add(a.event_date, INTERVAL 1 DAY) = b.event_date and
    a.player_id = b.player_id) / (
    select count(distinct player_id) from Activity), 2) as fraction

+----------+
| fraction |
+----------+
|     0.33 |
+----------+

