with requests_confirmed as (
  select
      s.user_id
    , count(c.action) as requests
  from
    signups as s
  left join
    confirmations as c
      on
        s.user_id = c.user_id
  where
    c.action = "confirmed"
  group by
    s.user_id
),
total_requests as (
  select
      s.user_id
    , count(c.action) as requests
  from
    signups as s
  left join
    confirmations as c
      on
        s.user_id = c.user_id
  group by
    s.user_id
)
select
    s.user_id
  , coalesce(round(rc.requests / tr.requests, 2), 0.00) as confirmation_rate
from
  signups as s
left join
  requests_confirmed as rc
    on
      s.user_id = rc.user_id
left join
  total_requests as tr
    on
      s.user_id = tr.user_id;
