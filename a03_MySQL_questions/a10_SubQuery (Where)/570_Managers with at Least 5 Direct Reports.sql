

The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

+------+----------+-----------+----------+
|Id    |Name 	  |Department |ManagerId |
+------+----------+-----------+----------+
|101   |John 	  |A 	      |null      |
|102   |Dan 	  |A 	      |101       |
|103   |James 	|A 	      |101       |
|104   |Amy 	  |A 	      |101       |
|105   |Anne 	  |A 	      |101       |
|106   |Ron 	  |B 	      |101       |
+------+----------+-----------+----------+

Given the Employee table, write a SQL query that finds out managers with at least 5 direct report. For the above table, your SQL query should return:

+-------+
| Name  |
+-------+
| John  |
+-------+
Note:
No one would report to himself.

-- Result: Join (Faster)

select
  e1.Name
from
Employee e1
join
Employee e2
on
e1.Id = e2.ManagerId
group by
  e1.Name
having count(*) >= 5;



-- Result: Using subquery (Slower)

select
  Name
from
    Employee e1
where
  (select count(*) from Employee e2
  where e2.ManagerId = e1.Id) >= 5;