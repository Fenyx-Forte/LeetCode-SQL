select
  f.employee_id
from
  (
    select
      e.employee_id
    from
      employees as e
    left join
      salaries as s
        on
          e.employee_id = s.employee_id
    where
      s.salary is null

    union

    select
      s.employee_id
    from
      employees as e
    right join
      salaries as s
        on
          e.employee_id = s.employee_id
    where
      e.name is null
  ) as f
order by
  f.employee_id asc;
