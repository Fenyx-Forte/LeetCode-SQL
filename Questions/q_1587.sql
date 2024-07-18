select
    u.name
  , sum(t.amount) as balance
from
  users as u
inner join
  transactions as t
    on
      u.account = t.account
group by
  u.account
having
  balance > 10000;