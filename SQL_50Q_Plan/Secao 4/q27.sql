/*
Table:
followers

Columns:
user_id
follower_id

Write a solution that will, for each user, return the number of followers.

Return the result table ordered by user_id in ascending order.

The query result format is:
user_id
followers_count
*/

select
  f.user_id,
  count(f.follower_id) as followers_count
from
  followers as f
group by
  f.user_id
order by
  f.user_id asc;