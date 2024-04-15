/*
- Table:
. requestaccepted
requester_id
accepter_id
accept_date

- Comments:
. The test cases are generated so that only one person has the most friends.

- Question:
. Write a solution to find the people who have the most friends and the most
friends number.

- Output:
. id
. num
*/
with friend_counts as (
  select
      r1.requester_id as id
  from
    requestaccepted as r1
  union all
  select
      r2.accepter_id as id
  from
    requestaccepted as r2
)
select
  f.id
  , count(f.id) as num
from
  friend_counts as f
group by
  f.id
order by
  num desc
limit
  1;
