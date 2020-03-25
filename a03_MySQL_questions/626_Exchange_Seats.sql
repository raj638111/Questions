

Mary is a teacher in a middle school and she has a table seat storing students' names and their corresponding seat ids.

The column id is continuous increment.


Mary wants to change seats for the adjacent students.


Can you write a SQL query to output the result for Mary?


+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Abbot   |
|    2    | Doris   |
|    3    | Emerson |
|    4    | Green   |
|    5    | Jeames  |
+---------+---------+
For the sample input, the output is:


+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Doris   |
|    2    | Abbot   |
|    3    | Green   |
|    4    | Emerson |
|    5    | Jeames  |
+---------+---------+
Note:
If the number of students is odd, there is no need to change the last one's seat.

-- Solution 1

SELECT
(CASE WHEN MOD(id,2)=1 AND id!=(SELECT COUNT(*) FROM seat) THEN id+1
  WHEN MOD(id,2)=0 THEN id-1
  ELSE id END)id,
student
FROM seat
ORDER BY id

-- Solution 2

select (case when ((select max(id) from seat)%2 = 1)
  and id = (select max(id) from seat) then id
  when id%2 = 1 then id + 1
  else id - 1
  end) as id,
student
from seat
order by id

