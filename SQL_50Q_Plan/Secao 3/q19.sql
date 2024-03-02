/*
- queries (may have duplicated rows)
. query_name
. result
. position (has a value from 1 to 500)
. rating (has a value from 1 to 5)

Query with rating less than 3 is a poor query

We define "quality" as the average of the ratio between query rating and its
position.

We also define "poor_query_percentage" as the percentage of all queries
with rating less than 3.

Write a solution to find each query_name, the quality and poor_query_percentage.

Both quality and poor_query_percentage should be rounded to 2 decimal places.
*/
select
    q.query_name
  , round(
      avg(q.rating / q.position)
      , 2) as quality
  , round(
      100.0 * avg(if(q.rating < 3, 1, 0))
      , 2) as poor_query_percentage
from
  queries as q
where
  q.query_name is not null
group by
  q.query_name;
