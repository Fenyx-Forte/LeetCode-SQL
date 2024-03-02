select
    a1.machine_id
  , round(avg(a1.timestamp - a2.timestamp), 3) as processing_time
from
  activity as a1
inner join
  activity as a2
    on
      a1.machine_id = a2.machine_id
      and a1.process_id = a2.process_id
      and a1.activity_type <> a2.activity_type
where
  a1.activity_type = "end"
group by
  a1.machine_id;