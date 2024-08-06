select
    e.employee_id
  , case
      when ((e.employee_id % 2 = 1) and (left(e.name, 1) <> "M")) then e.salary
      else 0
    end as bonus
from
  employees as e
order by
  e.employee_id;