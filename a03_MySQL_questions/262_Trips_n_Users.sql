

The Trips table holds all taxi trips. Each trip has a unique Id, while Client_Id and Driver_Id are both foreign keys to the Users_Id at the Users table. Status is an ENUM type of (‘completed’, ‘cancelled_by_driver’, ‘cancelled_by_client’).

+----+-----------+-----------+---------+--------------------+----------+
| Id | Client_Id | Driver_Id | City_Id |        Status      |Request_at|
+----+-----------+-----------+---------+--------------------+----------+
| 1  |     1     |    10     |    1    |     completed      |2013-10-01|
| 2  |     2     |    11     |    1    | cancelled_by_driver|2013-10-01|
| 3  |     3     |    12     |    6    |     completed      |2013-10-01|
| 4  |     4     |    13     |    6    | cancelled_by_client|2013-10-01|
| 5  |     1     |    10     |    1    |     completed      |2013-10-02|
| 6  |     2     |    11     |    6    |     completed      |2013-10-02|
| 7  |     3     |    12     |    6    |     completed      |2013-10-02|
| 8  |     2     |    12     |    12   |     completed      |2013-10-03|
| 9  |     3     |    10     |    12   |     completed      |2013-10-03|
| 10 |     4     |    13     |    12   | cancelled_by_driver|2013-10-03|
+----+-----------+-----------+---------+--------------------+----------+

The Users table holds all users. Each user has an unique Users_Id, and Role is an ENUM type of (‘client’, ‘driver’, ‘partner’).

+----------+--------+--------+
| Users_Id | Banned |  Role  |
+----------+--------+--------+
|    1     |   No   | client |
|    2     |   Yes  | client |
|    3     |   No   | client |
|    4     |   No   | client |
|    10    |   No   | driver |
|    11    |   No   | driver |
|    12    |   No   | driver |
|    13    |   No   | driver |
+----------+--------+--------+

Write a SQL query to find the cancellation rate of requests made by unbanned users (both client and driver must be unbanned) between Oct 1, 2013 and Oct 3, 2013. The cancellation rate is computed by dividing the number of canceled (by client or driver) requests made by unbanned users by the total number of requests made by unbanned users.

For the above tables, your SQL query should return the following rows with the cancellation rate being rounded to two decimal places.

+------------+-------------------+
|     Day    | Cancellation Rate |
+------------+-------------------+
| 2013-10-01 |       0.33        |
| 2013-10-02 |       0.00        |
| 2013-10-03 |       0.50        |
+------------+-------------------+

-- Sample 1

drop table Trips;
create table Trips(
  Id int,
  Client_Id int,
  Driver_Id int,
  City_Id int,
  Status varchar(100),
  Request_at Date
);

truncate table Trips;
insert into Trips
  (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
values
  (1, 1, 10, 1, 'completed', '2013-10-01'),
  (2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
  (3, 3, 12, 6, 'completed', '2013-10-01'),
  (4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
  (5, 1, 10, 1, 'completed', '2013-10-02'),
  (6, 2, 11, 6, 'completed', '2013-10-02'),
  (7, 3, 12, 6, 'completed', '2013-10-02'),
  (8, 2, 12, 12, 'completed', '2013-10-03'),
  (9, 3, 10, 12, 'completed', '2013-10-03'),
  (10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');


drop table Users;
create table Users(
  User_Id int,
  Banned varchar(100),
  Role varchar(100)
);

truncate table Users;
insert into Users
  (User_Id, Banned, Role)
values
  (1, 'No', 'client'),
  (2, 'Yes', 'client'),
  (3, 'No', 'client'),
  (4, 'No', 'client'),
  (10, 'No', 'driver'),
  (11, 'No', 'driver'),
  (12, 'No', 'driver'),
  (13, 'No', 'driver');

-- Sample 2

truncate table Trips;
insert into Trips
  (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
values
  (1, 1, 10, 1, 'cancelled_by_client', '2013-10-04');


truncate table Users;
insert into Users
  (User_Id, Banned, Role)
values
  (1, 'No', 'client'),
  (10, 'No', 'driver');


-- Solution 1

select
Request_at as Day,
round((sum(case when status in ('cancelled_by_driver',
'cancelled_by_client') then 1 else 0 end) / count(*)), 2)
  as 'Cancellation Rate'
from
  (select t.* from
  (select * from Trips where Request_at >= '2013-10-01' and Request_at <= '2013-10-03')  t
  inner join
  Users u1
  on
  t.Client_Id = u1.User_Id and u1.Banned = 'No'
  inner join
  Users u2
  on
  t.Driver_Id = u2.User_Id and u2.Banned = 'No') a
group by
a.Request_at



-- Solution 2 (This is faster than solution 1)

select
    Request_at as Day,
    round(sum(case when status in ('cancelled_by_driver', 'cancelled_by_client') then 1 else 0 end) /
      count(*), 2) as 'Cancellation Rate'
from
    (select
        Request_at,
        Status
    from
        (select * from Trips where Request_at >= '2013-10-01' and Request_at <= '2013-10-03') t
    join
        (select * from Users where Banned = 'No') u
    on
        t.Client_id = u.Users_id)a
group by
    a.Request_at


