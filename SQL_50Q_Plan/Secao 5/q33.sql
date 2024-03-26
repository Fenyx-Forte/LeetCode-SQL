/*
- Table
. Logs

- Columns
. id
. num

- Question
. Find all numbers that appear at least three times consecutively.

- Output
. ConsecutiveNums
*/
with consecutive_nums as (
  select
      l.num
    , lead(l.num, 1) over (order by l.id) as num_next
    , lead(l.num, 2) over (order by l.id) as num_next_next
  from
    logs as l
)
select distinct
    c.num as ConsecutiveNums
from
    consecutive_nums as c
where
    c.num = c.num_next
    and c.num = c.num_next_next;