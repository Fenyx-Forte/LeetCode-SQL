/*
- Table
. Person
id (int)
email (varchar)

- Question
. Write a solution to return all duplicate emails.
Note that it's guaranteed that the email field is not NULL.

- Output
. Email
*/
select
  p.email
from
  person as p
group by
  p.email
having
  count(p.email) > 1;
