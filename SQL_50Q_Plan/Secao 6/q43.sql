/*
- Tables:
. employee:
id,
name,
salary,
departmentid
. department
id,
name

- Comments:
. A company's executives are interested in seeing who earns the most money in
each of the company's departments. A high earner in a department is an employee
who has a salary in the top three unique salaries for that department.

- Question:
. Write a solution to find the employees who are high earners in each of the
departments.

- Output:
. Department
. Employee
. Salary
*/
with ranked_employees as (
  select 
      e.id
    , e.name
    , e.salary
    , e.departmentid
    , dense_rank() over (partition by e.departmentid order by e.salary desc) as salary_rank
  from 
    employee as e
)
select
    d.name as Department
  , re.name as Employee
  , re.salary as Salary
from
  department as d
inner join
  ranked_employees as re
    on
      d.id = re.departmentid
where
  re.salary_rank <= 3;
