/*
Table: teacher
Columns:
  teacher_id
  subject_id
  dept_id

Write a solution to calculate the number of unique subjects
each teacher teaches in the university.

Your output should be:
  teacher_id
  cnt (number of unique subjects)
*/

select
    t.teacher_id
  , count(distinct t.subject_id) as cnt
from
  teacher as t
group by
  t.teacher_id;