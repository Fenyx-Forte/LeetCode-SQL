/*
- Tables
. Customers
id (int)
name (varchar)

. Orders
id (int)
customerId (int)

- Question:
. Write a solution to find all customers who never order anything.

- Output:
. Customers
*/
select
  c.name as Customers
from
  customers as c
left join
  orders as o
    on
      c.id = o.customerId
where
  o.id is null;
