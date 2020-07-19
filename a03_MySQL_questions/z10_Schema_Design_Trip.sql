


drop table Weather;
create table Weather(
  customer_id int,
  trip_id int,
  dt date,
  RecordDate varchar(255),
  Temperature int
);

truncate table Weather;
insert into Weather
  (Id, RecordDate, Temperature)
values
  (1, '2015-01-01', 10),
  (2, '2015-01-02', 25),
  (3, '2015-01-03', 20),
  (4, '2015-01-04', 30);

-- Q1: Get the latest 2 travel dates where the customer has paid
-- Q2:


trips
------

trip_id
passenger_uuid
driver_uuid
distance
pickup_date     Partition
pickup_time
drop_off_date
drop_off_time
waiting_time
--
pickup_street
pickup_zip_code
pickup_state
drop_off_street
drop_off_zip_code
drop_off_state
--
rating_by_passenger
rating_by_driver
is_cancelled
cost_of_trip 50$
payment struct {card: 20$, cash: 10$, points: 10$}
tip_amount
driver_age_group
passenger_age_group


user
----
user_name_uuid
user_type             driver | passenger
org_id                someid | empty
created_date_time
updated_date_time
age







