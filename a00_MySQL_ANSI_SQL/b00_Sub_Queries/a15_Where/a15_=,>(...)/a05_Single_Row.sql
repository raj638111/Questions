-- Info

  + A row subquery returns a single row
    - More than single row will fail the query

-- Data

select * from test.employees;

+-------------+---------------+---------------+------------+
| employee_id | employee_name | department_id | manager_id |
+-------------+---------------+---------------+------------+
|         711 | nameA         |            11 |          1 |
|         712 | nameB         |            11 |          1 |
|         713 | nameC         |            33 |          3 |
+-------------+---------------+---------------+------------+

select * from test.departments;

+---------------+------------+-----------------+-------------+
| department_id | manager_id | department_name | location_id |
+---------------+------------+-----------------+-------------+
|            11 |          1 | accounts        |         856 |
|            22 |          2 | hr              |         956 |
+---------------+------------+-----------------+-------------+
  
-- Single row (in where): Succeeds

select * from test.employees where (department_id, manager_id) = 
(select department_id, manager_id from test.departments where location_id=856);    
  
+-------------+---------------+---------------+------------+
| employee_id | employee_name | department_id | manager_id |
+-------------+---------------+---------------+------------+
|         711 | nameA         |            11 |          1 |
|         712 | nameB         |            11 |          1 |
+-------------+---------------+---------------+------------+
2 rows in set (0.00 sec)

-- More than Single row: Fails

select * from test.employees where Row(department_id, manager_id) =
  (select department_id, manager_id from test.departments);
ERROR: 1242: Subquery returns more than 1 row

  
-- Load data --


drop table test.departments;
create table test.departments(
  department_id int not null,
  manager_id int not null,
  department_name varchar(100) not null,
  location_id int not null
);

drop table test.employees;
create table test.employees(
  employee_id int not null,
  employee_name varchar(100) not null,
  department_id int not null,
  manager_id int not null
);


truncate table test.departments;
insert into test.departments(department_id, manager_id, department_name, location_id)
values
  (11, 1, 'accounts', 856),
  (22, 2, 'hr', 956);


truncate table test.employees;
insert into test.employees(employee_id, employee_name, department_id, manager_id)
values
  (711, 'nameA', 11, 1),
  (712, 'nameB', 11, 1),
  (713, 'nameC', 33, 3);
