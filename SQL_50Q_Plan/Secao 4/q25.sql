/*
Table:
sales

Columns:
sale_id
product_id
year
quantity
price

Table:
product

Columns:
product_id
product_name

Write a mysql query to select the product id, year, quantity, and
price for the first year of every product sold.

Output:
product_id
first_year
quantity
price
*/

with first_year_sales as (
  select
      p.product_id
    , min(s.year) as first_year
  from
    sales as s
  inner join
    product as p
      on s.product_id = p.product_id
  group by
    p.product_id
)
select
    s.product_id
  , fys.first_year
  , s.quantity
  , s.price
from
  sales as s
inner join
  first_year_sales as fys
    on 
      s.product_id = fys.product_id
      and s.year = fys.first_year;
