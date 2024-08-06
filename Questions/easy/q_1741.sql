select
    e.event_day as "day"
  , e.emp_id
  , sum(out_time - in_time) as total_time
from
  employees as e
group by
    e.event_day
  , e.emp_id;