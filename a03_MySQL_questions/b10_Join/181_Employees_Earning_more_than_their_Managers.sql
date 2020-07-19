


The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.

+----------+
| Employee |
+----------+
| Joe      |
+----------+

-- Solution 2 (Inner Join) (> 57.43%)

select
a.Name as Employee
from
  Employee a
join
  Employee b
on a.ManagerId = b.Id
on a.Salary > b.Salary;

-- Solution 1 (faster than 16%)

select
    Name as Employee
from
Employee e1
where
ManagerId =
    (select
        Id
     from
        Employee e2
     where
        e2.Id = e1.ManagerId and
        e2.Salary < e1.Salary
    )