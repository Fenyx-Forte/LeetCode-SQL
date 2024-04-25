/*
- Table
. customer:
customer_id
name
visited_on
amount

- Comments
. You are the restaurant owner and you want to analyze a possible expansion
(there will be at least one customer every day).

- Question
. Compute the moving average of how much the customer paid in a seven days
window (i.e., current day + 6 days before). 
average_amount should be rounded to two decimal places
Return the result table ordered by visited_on in ascending order.

- Output
. visited_on
. amount
. average_amount
*/
with agg_customer as (
  select
      c.visited_on
    , sum(c.amount) as amount
  from
    customer as c
  group by
    c.visited_on
),
window_customer as (
  select
      a.visited_on
    , sum(a.amount) over (
        order by
          a.visited_on asc
        rows between
          6 preceding
          and current row
      ) as acumulative_amount
  from
    agg_customer as a
)
select
    w.visited_on
  , w.acumulative_amount as amount
  , round((w.acumulative_amount / 7), 2) as average_amount
from
  window_customer as w
where
  datediff(w.visited_on, (
    select
      min(visited_on)
    from
      window_customer
    )
  ) >= 6;
