with manager as (
  select
    e1.name
  from
    employee as e1
  inner join
    employee as e2
      on e1.id = e2.managerId
  group by
    e1.id
  having
    count(e2.id) >= 5
)
select
  m.name
from
  manager as m;