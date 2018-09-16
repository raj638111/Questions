
-- Info
  
  + The subquery used in exists() & not_exists() can return 1 or more rows
  + exists() : true if 1 or more row is found
  + not exists(): true if no row/rows is found
      

-- DDL

drop table test.employees;
create table test.employees(
  employee_id int not null,
  employee_name varchar(100) not null,
  department_id int not null,
  manager_id int
);

-- Data

truncate table test.employees;  
insert into test.employees(employee_id, employee_name, department_id, manager_id)
values
  (700, 'nameX1', 11, null),
  (800, 'nameX2', 44, null),
  (711, 'nameA', 11, 700),
  (712, 'nameB', 11, 900),
  (713, 'nameC', 33, 900);

-- exists() : Get managers who have atleast 1 reportee

select * from test.employees e where 
exists (select * from employees where manager_id = e.employee_id);

+-------------+---------------+---------------+------------+
| employee_id | employee_name | department_id | manager_id |
+-------------+---------------+---------------+------------+
|         700 | nameX1        |            11 |       NULL |
+-------------+---------------+---------------+------------+

-- not_exists(): Get managers who do not have any reportee

select * from test.employees e where 
not exists (select * from employees where manager_id = e.employee_id)
and e.manager_id is null;

+-------------+---------------+---------------+------------+
| employee_id | employee_name | department_id | manager_id |
+-------------+---------------+---------------+------------+
|         800 | nameX2        |            44 |       NULL |
+-------------+---------------+---------------+------------+










  
  
  

  
  
  
  