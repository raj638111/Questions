
Get the highest answer rate question from a table survey_log with these columns: id, action, question_id, answer_id, q_num, timestamp.

id means user id; action has these kind of values: "show", "answer", "skip"; answer_id is not null when action column is "answer", while is null for "show" and "skip"; q_num is the numeral order of the question in current session.

Write a sql query to identify the question which has the highest answer rate.

Example:

Input:
+------+-----------+--------------+------------+-----------+------------+
| id   | action    | question_id  | answer_id  | q_num     | timestamp  |
+------+-----------+--------------+------------+-----------+------------+
| 5    | show      | 285          | null       | 1         | 123        |
| 5    | answer    | 285          | 124124     | 1         | 124        |
| 5    | show      | 369          | null       | 2         | 125        |
| 5    | skip      | 369          | null       | 2         | 126        |
+------+-----------+--------------+------------+-----------+------------+
Output:
+-------------+
| survey_log  |
+-------------+
|    285      |
+-------------+
Explanation:
question 285 has answer rate 1/1, while question 369 has 0/1 answer rate, so output 285.


Note: The highest answer rate meaning is: answer number's ratio in show number in the same question.

-- Solution

select survey_log from
(select q.question_id as survey_log,
       (case when a.count is not null then a.count else 0 end) / q.count as ratio
from
(select question_id, count(*) as count
from survey_log where action = 'show' group by question_id) q
left join
(select question_id, count(*) as count
from survey_log where action = 'answer' group by question_id) a
on q.question_id = a.question_id
order by ratio
desc limit 1)z
