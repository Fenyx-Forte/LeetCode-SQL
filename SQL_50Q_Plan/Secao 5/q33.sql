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






with consecutive_nums as (
  select
      l.num
    , lag(l.num, 1) over (
        order by
          l.id asc
      ) as before_num
    , lead(l.num, 1) over (
        order by
          l.id asc
      ) as after_num
  from
    logs as l
)
select distinct
  c.num as ConsecutiveNums
from
  consecutive_nums as c
where
  c.num = c.before_num
  and c.num = c.after_num;




select distinct
  l1.num as ConsecutiveNums
from
  logs as l1
inner join
  logs as l2
    on
      l1.id = l2.id + 1
inner join
  logs as l3
    on
      l1.id = l3.id - 1
where
  l1.num = l2.num
  and l1.num = l3.num;












