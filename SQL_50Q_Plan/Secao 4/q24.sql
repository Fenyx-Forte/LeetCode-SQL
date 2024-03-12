/*
Table: activity
Columns:
user_id
session_id
activity_date
activity_type

Write a solution to find the daily active user count for a period of
30 days ending 2019-07-27 inclusively. A user was active on someday if
they made at least one activity on that day.

Output:
day
active_users
*/
with daily_activity as (
  select
      a.activity_date
    , count(distinct a.user_id) as active_users
  from
    activity as a
  where
    a.activity_date between '2019-06-28' and '2019-07-27'
  group by
    a.activity_date
)
select
  d.activity_date as day
  , d.active_users
from
  daily_activity as d;