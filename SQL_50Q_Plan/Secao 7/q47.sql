/*
- Table:
. Employee
id: int
salary: int

- Question:
. Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null
*/

select
  max(e.salary) as SecondHighestSalary
from
  Employee as e
where
  e.salary < (
    select
      max(salary)
    from
      Employee);

