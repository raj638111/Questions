
Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.
For example, after running your query, the above Person table should have the following rows:

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+

-- Solution 1 (Using Join)

DELETE p1 FROM Person p1,
    Person p2
WHERE
    p1.Email = p2.Email AND p1.Id > p2.Id

-- Solution 2 (Using Join)

DELETE
  p1
FROM
  Person p1
inner join
  Person p2
on
  p1.Email = p2.Email and
  p1.Id > p2.Id

-- Solution 3 (Sub Query)
NOT WORKING... (Got to check again)

select 1 from Person;

even this ^^ query is not working


