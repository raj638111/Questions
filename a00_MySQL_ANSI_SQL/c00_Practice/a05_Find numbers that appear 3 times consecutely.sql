
-- Info

-- Data

select * from Logs

+----+-----+
| Id | Num |
+----+-----+
|  1 |   1 |
|  2 |   1 |
|  3 |   1 |
|  4 |   2 |
|  5 |   1 |
|  6 |   2 |
|  7 |   2 |
+----+-----+

-- Answer

// Note: Without where clause gives cartesian product (ie 7 * 7 * 7 = 343 rows)
// Without distinct if the number 1 appears consecutively 1,1,1,1 then answer will
//  be 1,1...but we need answer of 1

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

+-----------------+
| ConsecutiveNums |
+-----------------+
|               1 |
+-----------------+

-- Load

drop table Logs;
create table Logs(
  Id int not null,
  Num int not null
);

truncate table Logs;
insert into Logs(Id, Num)
values
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 1),
  (6, 2),
  (7, 2)

