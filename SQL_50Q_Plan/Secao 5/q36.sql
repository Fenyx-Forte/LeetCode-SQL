/*
- Table
. Accounts

- Columns
. account_id
. income

- Question
. Write a solution to calculate the number of bank accounts for each salary
category. The salary categories are: 
"Low Salary" (salary < 20000),
"Average Salary" (salary >= 20000 and salary <= 50000), 
"High Salary"(salary > 50000). 
The result table must contain all three categories. If there are no accounts
in a category, return 0.

- Output
. category
. accounts_count
*/
select
    "Low Salary" as category
  , count(a.account_id) as accounts_count
from
  accounts as a
where
  a.income < 20000
union all
select
    "Average Salary" as category
  , count(a.account_id) as accounts_count
from
  accounts as a
where
  a.income between 20000 and 50000
union all
select
    "High Salary" as category
  , count(a.account_id) as accounts_count
from
  accounts as a
where
  a.income > 50000;
