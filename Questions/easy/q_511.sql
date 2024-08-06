/*
- Table:
. Activity
player_id (int)
device_id (int)
event_date (date)
games_played (int)

- Question:
. Write a solution to find the first login date for each player
*/

select
    a.player_id
  , min(a.event_date) as first_login
from
  activity as a
group by
  a.player_id;