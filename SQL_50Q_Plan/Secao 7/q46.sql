/*
- Table
. person
id
email

- Question
. Write a solution to delete all duplicate emails, keeping only one unique
email with the smallest id.
*/
with dup_emails as (
  select
      p.email
    , min(p.id) as id
  from
    person as p
  group by
    p.email
  having
    count(p.email) > 1
)
delete
  p
from
  person as p
inner join
  dup_emails as de
    on
      p.id > de.id
where
  p.email = de.email;