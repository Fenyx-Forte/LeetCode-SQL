/*
- transactions
. id
. country
. state (enum of type ["approved", "declined"])
. amount
. trans_date

Write an SQL query to find for each month and country, the number of
transactions and their total amount, the number of approved transactions and
their total amount.

The result must have the following structure:
month
country
trans_count
approved_count
trans_total_amount
approved_total_amount
*/
select
    date_format(t.trans_date, '%Y-%m') as month
  , t.country
  , count(t.id) as trans_count
  , sum(
      if(t.state = 'approved', 1, 0)
    ) as approved_count
  , sum(t.amount) as trans_total_amount
  , sum(
      if(t.state = 'approved', t.amount, 0)
    ) as approved_total_amount
from
  transactions as t
group by
    month
  , t.country;