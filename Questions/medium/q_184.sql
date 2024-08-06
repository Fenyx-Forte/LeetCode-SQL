with employee_rank as (
  select
      d.name as department
    , e.name as employee
    , e.salary
    , dense_rank() over(
        partition by
          d.name
        order by
          e.salary desc
    ) as ranking
  from
    department as d
  inner join
    employee as e
      on
        d.id = e.departmentid
)
select
    r.department as department
  , r.employee as Employee
  , r.salary as Salary
from
  employee_rank as r
where
  r.ranking = 1;