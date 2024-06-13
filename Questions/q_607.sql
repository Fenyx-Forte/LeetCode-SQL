/*
- Tables:
. SalesPerson
sales_id (int)
name (varchar)
salary (int)
commission_rate (int)
hire_date (date)

. Company
com_id (int)
name (varchar)
city (varchar)

. Orders
order_id (int)
order_data (int)
com_id (int)
sales_id (int)
amount (int)

- Question:
. Write a solution to find the names of all the salespersons who did not
have any orders related to the company with the name "RED".

- Output:
. name
*/
with orders_join_company as (
  select
    o.sales_id
  from
    orders as o
  inner join
    company as c
      on
        o.com_id = c.com_id
  where
    c.name = "RED"
)
select
  s.name
from
  salesperson as s
where
  s.sales_id not in (
    select
      ojc.sales_id
    from
      orders_join_company as ojc
  );