/*
- Table:
. Products
product_id : int
product_name : varchar
product_category: varchar

. Orders
product_id : int
order_date : date
unit: int

- Question:
. Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

- Format
. product_name
. unit
*/
with orders_agg as(
  select
      o.product_id
    , sum(o.unit) as unit
  from
    Orders as o
  where
    o.order_date between '2020-02-01' and '2020-02-29'
  group by
    o.product_id
)
select
    p.product_name
  , oa.unit
from
  Products as p
inner join
  orders_agg as oa
    on
      p.product_id = oa.product_id
where
  oa.unit >= 100;
