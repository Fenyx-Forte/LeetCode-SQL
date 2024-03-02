/*
- users
. user_id
. user_name

- register
. contest_id
. user_id

Write a solution to find the percentage of the users registered in
each contest rounded to two decimals.

Return the result table ordered by percentage in descending order.
In case of a tie, order it by contest_id in ascending order.
*/
select
    r.contest_id
  , round(count(r.user_id) * 100.0 / (select
                                        count(u.user_id)
                                      from
                                        users as u)
          , 2) as percentage
from
  register as r
group by
  r.contest_id
order by
  percentage desc,
  r.contest_id asc;

