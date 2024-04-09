/*
- Tables
. movies
movie_id
title
. users
user_id
name
. movierating
movie_id
user_id
rating
created_at

- Questions
. Find the name of the user who has rated the greatest number of movies.
In case of a tie, return the lexicographically smaller user name.
. Find the movie name with the highest average rating in February 2020.
In case of a tie, return the lexicographically smaller movie name.

- Output
. results
*/
(select
 u.name as results
from
  users as u
inner join
  movierating as r
    on
      u.user_id = r.user_id
group by
  u.user_id
order by
    count(r.movie_id) desc
  , u.name asc
limit
  1)
union all
(select
  m.title as results
from
  movies as m
inner join
  movierating as r
    on
      m.movie_id = r.movie_id
where
  r.created_at between '2020-02-01' and '2020-02-29'
group by
  m.movie_id
order by
    avg(r.rating) desc
  , m.title asc
limit
  1);
