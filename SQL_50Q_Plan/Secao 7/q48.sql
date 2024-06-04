/*
- Table:
. Activities
sell_date : date
product : varchar

- Question:
. Write a solution to find for each date the number of different products sold and their names.
The sold products names for each date should be sorted lexicographically.

*/
select
    a.sell_date
  , count(distinct a.product) as num_sold
  , group_concat(
      distinct
        a.product
      order by
        a.product asc 
      separator ',') as products
from
  Activities as a
group by
  a.sell_date
order by
  a.sell_date asc;


