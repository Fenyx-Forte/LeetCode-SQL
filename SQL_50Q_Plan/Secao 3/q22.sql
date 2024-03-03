/*
- activity
. player_id
. device_id
. event_date
. games_played

Write a solution to report the fraction of players that logged in again on the
day after the day they first logged in, rounded to 2 decimal places. In other
words, you need to count the number of players that logged in for at least two
consecutive days starting from their first login date, then divide that number
by the total number of players.
*/
with player_first_login as (
  select
      a.player_id
    , min(a.event_date) as first_login_date
  from
    activity as a
  group by
    a.player_id
)
select
  round(
    sum(
      if(datediff(a.event_date, pfl.first_login_date) = 1, 1, 0)
    )
      / count(distinct pfl.player_id)
    , 2
  ) as fraction
from
  player_first_login as pfl
inner join
  activity as a
    on
      pfl.player_id = a.player_id;