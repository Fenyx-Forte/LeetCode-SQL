/*
Table:
courses

Columns: 
student,
class

Write a solution to find all the classes that have at least five students.
*/

select
  c.class
from
  courses as c
group by
  c.class
having
  count(c.student) >= 5;