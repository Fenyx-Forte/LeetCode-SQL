/*
- Table
. Employee
id (int)
name (varchar)
salary (int)
managerId (int)

- Question:
. Write an SQL query to find the employees who earn more than their manager.

- Output:
. Employee
*/
select
  e1.name as Employee
from
  employee as e1
inner join
  employee as e2
    on
      e1.managerId = e2.id
where
  e1.managerId is not null
  and e1.salary > e2.salary;
