/*
- delivery
. delivery_id
. customer_id
. order_date
. customer_pref_delivery_date

If the customer's preferred delivery date is the same as the order date, then
the order is called "immediate"; otherwise, it is called "scheduled".

The first order of a customer is the order with the earliest order date that
the customer made. It is guaranteed that a customer has precisely one first order.

Write a solution to find the percentage of immediate orders in the first orders
of all customers, rounded to 2 decimal places.
*/
with first_orders as (
  select
      d.customer_id
    , min(d.order_date) as first_order_date
  from
    delivery as d
  group by
    d.customer_id
)
select
  round(
    avg(100 * if(d.order_date = d.customer_pref_delivery_date, 1, 0))
    , 2
  ) as immediate_percentage
from
  delivery as d
where
  (d.customer_id, d.order_date) in (
    select
        f.customer_id
      , f.first_order_date
    from
      first_orders as f
  );
