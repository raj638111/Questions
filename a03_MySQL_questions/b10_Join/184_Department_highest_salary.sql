
The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+

Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, your SQL query should return the following rows (order of rows does not matter).

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+

-- Solution 4 (join) > 92%

select
  d.Name as Department,
  e.Name as Employee,
  e.Salary as Salary
from
  Employee e
join
  (select DepartmentId, max(Salary) as Salary from Employee group by DepartmentId) t
on
  e.DepartmentId = t.DepartmentId and
  e.Salary = t.Salary
join
  Department d
on e.DepartmentId = d.Id;



-- Solution 1 (where) > 7.5%

select
    d.Name as Department,
    e1.Name as Employee,
    e1.Salary as Salary
from
    Employee e1
join
    Department d
on
    e1.DepartmentId = d.Id
where
    (
        select
            count(*) as count
        from
            Employee e2
        where
            e2.DepartmentId = e1.DepartmentId and
            e2.Salary > e1.Salary and
            e2.Id not in (e1.Id)
    ) = 0

-- Solution 2 (where)

SELECT
    Department.name AS 'Department',
    Employee.name AS 'Employee',
    Salary
FROM
    Employee
JOIN
    Department
ON
  Employee.DepartmentId = Department.Id
WHERE
    (Employee.DepartmentId , Salary) IN
    (   SELECT
            DepartmentId, MAX(Salary)
        FROM
            Employee
        GROUP BY DepartmentId
	)
;

-- Solution 3 (where)

select a.Name, d.Name
from
(select
  Name, DepartmentId
from
  Employee e1
where
  (
    select count(*) from Employee e2
    where e2.Salary > e1.salary and
    e2.DepartmentId = e1.DepartmentId
  ) = 0 )a
join
Department d
on a.DepartmentId = d.Id;

+-------+-------+
| Name  | Name  |
+-------+-------+
| Jim   | IT    |
| Henry | Sales |
| Max   | IT    |
+-------+-------+


-- Data 1

drop table Employee;
create table Employee(
  Id int,
  Name varchar(255),
  Salary int,
  DepartmentId int
);

truncate table Employee;
insert into Employee
  (Id, Name, Salary, DepartmentId)
values
  (1, "Joe", 70000, 1),
  (2, "Jim", 90000, 1),
  (3, "Henry", 80000, 2),
  (4, "Sam", 60000, 2),
  (5, "Max", 90000, 1);

-- Data 2

drop table Department;
create table Department(
  Id int,
  Name varchar(255)
);

truncate table Department;
insert into Department
  (Id, Name)
values
  (1, "IT"),
  (2, "Sales");

