/*
- Tables:
. users
user_id
name

- Comments:
. The name consists of only lowercase and uppercase characters

- Question:
. Write a solution to fix the names so that only the first character is
uppercase and the rest are lowercase. Return the result table ordered by user_id.

- Output
. user_id
. name
*/

select
    u.user_id
  , concat(
        upper(left(u.name, 1))
      , lower(substring(u.name, 2))
    ) as name
from
  users as u
order by
  u.user_id asc;