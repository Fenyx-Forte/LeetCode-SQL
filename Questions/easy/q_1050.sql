/*
- Table
. ActorDirector
actor_id (int)
director_id (int)
timestamp (int)

- Question
. Write a solution to find all the pairs (actor_id, director_id) where the
actor has cooperated with the director at least three times.

- Output
. actor_id
. director_id
*/
select
    a.actor_id
  , a.director_id
from
  actordirector as a
group by
    a.actor_id
  , a.director_id
having
  count(*) >= 3;