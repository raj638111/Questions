

Write a SQL query to find all numbers that appear at least three times consecutively.

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+

For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+

-- Solution 1 (Using three aliases)

SELECT distinct l1.Num as ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.Id = l2.Id - 1
    and l2.Id = l3.Id -1
    and l1.Num = l2.Num
    and l2.Num = l3.Num
;

-- Solution 2 (Using Subquery in where)

select l1.Num as ConsecutiveNums
from
Logs l1
where (
  (select count(*) from Logs l2 where l2.Id = l1.Id + 1 and l2.Num = l1.Num) +
  (select count(*) from Logs l3 where l3.Id = l1.Id + 2 and l3.Num = l1.Num)
) = 2

-- Solution 1 (How it works? Is it inner join or cross join?)

=== Is writing l1, l2, l3 same as Inner Join? ===
  === NOPE: (Hypothesis) This is FULL OUTER JOIN or CROSS JOIN ??===
=== Does using 'on' work instead of 'where'? ===
  === NOPE: Using 'on' is NOT working. Only 'where' works
  ===       (Hypothesis) Probably computing on fields (like Id + 1) do not work with on?
  ===       (Hypothesis) We are joining 3 tables in series. Probably on can be used only
  ==                     only with 2 tables?
  ==         (Hypothesis) With Cross Join, there is no on clause I suppose?

use test;
drop table Logs;
create table Logs(
  Id int,
  Num int
);

truncate table Logs;
insert into Logs
  (Id, Num)
values
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 1),
  (6, 2),
  (7, 1);



select * from
  Logs l1, Logs l2, Logs l3
on
  l3.Id = l2.Id + 1 and
  l2.Id = l1.Id + 1 and
  l1.Num = l2.Num and
  l2.Num = l3.Num
ERROR: 1064: You have an error in your SQL syntax; che


select * from
  Logs l1, Logs l2, Logs l3
where
  l3.Id = l2.Id + 1 and
  l2.Id = l1.Id + 1 and
  l1.Num = l2.Num and
  l2.Num = l3.Num

+----+-----+----+-----+----+-----+
| Id | Num | Id | Num | Id | Num |
+----+-----+----+-----+----+-----+
|  1 |   1 |  2 |   1 |  3 |   1 |
+----+-----+----+-----+----+-----+
1 row in set (0.0026 sec)

