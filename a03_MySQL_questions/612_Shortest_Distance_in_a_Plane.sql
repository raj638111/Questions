Table point_2d holds the coordinates (x,y) of some unique points (more than two) in a plane.


Write a query to find the shortest distance between these points rounded to 2 decimals.


| x  | y  |
|----|----|
| -1 | -1 |
| 0  | 0  |
| -1 | -2 |


The shortest distance is 1.00 from point (-1,-1) to (-1,2). So the output should be:


| shortest |
|----------|
| 1.00     |


Note: The longest distance among all the points are less than 10000.

-- Solution

select min(
    round(sqrt(power(t1.x-t2.x,2) + power(t1.y-t2.y,2)),2)
  ) shortest
from
  point_2d t1
cross join
  point_2d t2
on !(t1.x = t2.x and t1.y=t2.y)
