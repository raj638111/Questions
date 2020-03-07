

There are a few details missing from the previous explanations.
To better understand how partitioning and bucketing works,
you should look at how data is stored in hive. Let's say you have a table

** Fields with high cardinality can be bucketed

CREATE TABLE mytable (
         name string,
         city string,
         employee_id int )
PARTITIONED BY (year STRING, month STRING, day STRING)
CLUSTERED BY (employee_id) INTO 256 BUCKETS
then hive will store data in a directory hierarchy like

/user/hive/warehouse/mytable/y=2015/m=12/d=02

Bucketing can speed up joins with other tables that have
exactly the same bucketing, so in my example, if you're
joining two tables on the same employee_id, hive can do the
join bucket by bucket (even better if they're already
sorted by employee_id since it's going to mergesort parts
that are already sorted, which works in linear time aka O(n)

https://stackoverflow.com/a/34124258/892857