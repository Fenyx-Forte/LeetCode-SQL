/*
- Table:
. Employees

- Columns:
. employee_id
. name
. reports_to
. age

For this problem, we will consider a manager an employee who has at least 1
other employee reporting to them.

Write a solution to report the ids and the names of all managers, the number
of employees who report directly to them, and the average age of the reports
rounded to the nearest integer.

Return the result table ordered by employee_id.

Output:
. employee_id
. name
. reports_count
. average_age
*/
select
    e1.employee_id
  , e1.name
  , count(e2.employee_id) as reports_count
  , round(avg(e2.age), 0) as average_age
from
  employees as e1
inner join
  employees as e2
    on
      e1.employee_id = e2.reports_to
group by
  e1.employee_id
order by
  e1.employee_id asc;