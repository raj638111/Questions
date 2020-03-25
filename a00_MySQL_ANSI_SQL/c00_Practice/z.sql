
use database test;

drop table Instructors;
create table Instructors(
  instructor_id int not null,
  revenue int not null
);

truncate table Instructors;
insert into Instructors(instructor_id, revenue)
values
  (1, 100),
  (2, 200),
  (3, 50)

select
instructor_id,
revenue,
rank() over(
 order by revenue desc
)
from
Instructors;