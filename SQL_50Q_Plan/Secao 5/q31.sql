/*
- Table:
. Employee

- Columns:
. employee_id
. department_id
. primary_flag
primary_flag is an ENUM (category) of type ('Y', 'N'). If the flag is 'Y', the
department is the primary department for the employee. If the flag is 'N', the
department is not the primary.

Employees can belong to multiple departments. When the employee joins other
departments, they need to decide which department is their primary department.
Note that when an employee belongs to only one department, their primary column
is 'N'.

Write a query to report all the employees with their primary department.
For employees who belong to one department, report their only department.
*/
select
    e1.employee_id
  , e1.department_id
from
  employee as e1
where
  e1.primary_flag = "Y"
union
select
    e2.employee_id
  , e2.department_id
from
  employee as e2
group by
  e2.employee_id
having
  count(e2.employee_id) = 1;
  