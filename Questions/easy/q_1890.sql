select
    l.user_id
  , max(l.time_stamp) as last_stamp
from
  logins as l
where
  year(time_stamp) = 2020
group by
  l.user_id;