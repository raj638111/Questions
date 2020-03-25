
-- Data

select * from Employee;

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
|  1 | Joe   |  85000 |            1 |
|  2 | Henry |  80000 |            2 |
|  3 | Sam   |  60000 |            2 |
|  4 | Max   |  90000 |            1 |
|  5 | Janet |  69000 |            1 |
|  6 | Randy |  85000 |            1 |
|  7 | Will  |  70000 |            1 |
+----+-------+--------+--------------+

select * from Department;

+----+-------+
| Id | Name  |
+----+-------+
|  1 | IT    |
|  2 | Sales |
+----+-------+

-- Answer

select
  d.Name as 'Department',
  e1.Name AS 'Employee',
  e1.Salary
from
Employee e1
join
Department d
on e1.DepartmentId = d.Id
where (
  select count(distinct salary) from Employee e2
  where e2.salary > e1.salary and
        e1.DepartmentId = e2.DepartmentId
) < 3
order by
DepartmentId, Salary
desc


+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      |  90000 |
| IT         | Joe      |  85000 |
| IT         | Randy    |  85000 |
| IT         | Will     |  70000 |
| Sales      | Henry    |  80000 |
| Sales      | Sam      |  60000 |
+------------+----------+--------+


-- Load

drop table test.Employee;
create table test.Employee(
  Id int not null,
  Name varchar(100) not null,
  Salary int not null,
  DepartmentId int not null
);

truncate table test.Employee;
insert into test.Employee(Id, Name, Salary, DepartmentId)
values
  (1, 'Joe', 85000, 1),
  (2, 'Henry', 80000, 2),
  (3, 'Sam', 60000, 2),
  (4, 'Max', 90000, 1),
  (5, 'Janet', 69000, 1),
  (6, 'Randy', 85000, 1),
  (7, 'Will', 70000, 1);

--

drop table test.Department;
create table test.Department(
  Id int not null,
  Name varchar(100) not null
);

truncate table test.Department;
insert into test.Department(Id, Name)
values
  (1, 'IT'),
  (2, 'Sales')




