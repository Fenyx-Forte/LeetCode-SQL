/*
- Table
. Employees

- Columns
. employee_id
. name
. manager_id
. salary

- Comments
. Some employees have no manager.

- Question
Find the IDs of the employees whose salary is strictly less than $30000 and
whose manager left the company. When a manager leaves the company, their
information is deleted from the Employees table, but the reports still have
their manager_id set to the manager that left. 
Return the result table ordered by employee_id in ascending order.

- Output
. employee_id
*/
select
  e.employee_id
from
  employees as e
where
  e.manager_id is not null
  and e.salary < 30000
  and e.manager_id not in (
    select
      e1.employee_id
    from
      employees as e1
  )
order by
  e.employee_id asc;