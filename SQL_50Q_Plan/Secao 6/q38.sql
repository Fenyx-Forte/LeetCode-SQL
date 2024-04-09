/*
- Table
. Seat

- Columns
. id
. student

- Comments
. id is a continuous increment.

- Questions
. Write a solution to swap the seat id of every two consecutive students. If
the number of students is odd, the id of the last student is not swapped.
Return the result table ordered by id in ascending order.

- Output
. id
. student
*/
select
  case
    when s.id % 2 = 1 and s.id < (select count(*) from seat) then
      s.id + 1
    when s.id % 2 = 0 then
      s.id - 1
    else
      s.id
  end as id
  , s.student
from
  seat as s
order by
  id asc;
