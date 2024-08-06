/*
- Table:
. Orders
order_number (int)
customer_number (int)

- Question
. Write a solution to find the customer_number for the customer who
has placed the largest number of orders.
The test cases are generated so that exactly one customer will have
placed more orders than any other customer.

- Output:
. customer_number
*/
select
  o.customer_number
from
  orders as o
group by
  o.customer_number
order by
  count(o.order_number) desc
limit
  1;
