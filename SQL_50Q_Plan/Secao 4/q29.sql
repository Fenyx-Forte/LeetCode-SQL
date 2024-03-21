/*
- Table:
. Customer

- Columns:
. customer_id
. product_key

- Table:
. Product

- Columns:
. product_key

Write a solution to report the customer ids from the Customer table that
bought all the products in the Product table.
*/
select
  c.customer_id
from
  customer as c
group by
  c.customer_id
having
  count(distinct c.product_key) = (
    select
      count(p.product_key)
    from
      product as p);