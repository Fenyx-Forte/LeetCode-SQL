/*
- Table
. Queue

- Columns
. person_id
. person_name
. weight
. turn

- Comment
. There is a queue of people waiting to board a bus. However, the bus has a
weight limit of 1000 kilograms, so there may be some people who cannot board.

- Question
Write a solution to find the person_name of the last person that can fit on the
bus without exceeding the weight limit. The test cases are generated such that
the first person does not exceed the weight limit.

- Output
. person_name
*/
with cumulative_weight as (
  select
      q.person_id
    , q.person_name
    , q.weight
    , q.turn
    , sum(q.weight) over (order by q.turn) as cumulative_weight
  from
    queue as q
)
select
  c.person_name
from
  cumulative_weight as c
where
  c.cumulative_weight <= 1000
order by
  c.turn desc
limit 1;






with cumulative_weight as (
  select
      q.turn
    , q.person_name
    , sum(q.weight) over(
        order by
          q.turn asc
      ) as cumulative_weight
  from
    queue as q
)
select
  c.person_name
from
  cumulative_weight as c
where
  c.cumulative_weight <= 1000
order by
  c.turn desc
limit 1;













