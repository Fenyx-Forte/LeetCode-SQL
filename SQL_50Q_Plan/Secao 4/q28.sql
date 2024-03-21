/*
- Table:
. MyNumbers

- Columns:
. num (int)

A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, return null.

Output Table Columns:
num
*/
with single_numbers as (
    select 
      m.num
    from 
      mynumbers as m
    group by 
      m.num
    having 
      count(m.num) = 1
)
select
  max(s.num) as num
from 
  single_numbers as s;