/*
- Table
. Products

- Columns
. product_id
. new_price
. change_date

- Question
Write a solution to find the prices of all products on 2019-08-16.
Assume the price of all products before any change is 10.

- Output
. product_id
. price
*/
with distinct_id as (
  select distinct
    p.product_id
  from
    products as p
)
-- In this table, may some products do not appear
, last_change_date as (
  select
      p.product_id
    , max(p.change_date) as change_date
  from
    products as p
  where
    p.change_date <= '2019-08-16'
  group by
    p.product_id
)
, last_change_date_for_each_id as (
  select
    d.product_id
    , l.change_date
  from
    distinct_id as d
  left join
    last_change_date as l
      on
        d.product_id = l.product_id
)
select
    lc.product_id
  , case
      when lc.change_date is null then 10
      else p.new_price
    end as price
from
  products as p
right join
  last_change_date_for_each_id as lc
    on
      p.product_id = lc.product_id
      and p.change_date = lc.change_date;
