/*
- Table:
. Users
user_id: int
name: varchar
mail: varchar

- Question:
. Write a solution to find the users who have valid emails.

A valid e-mail has a prefix name and a domain where:

    The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'.
    The prefix name must start with a letter.
    The domain is '@leetcode.com'.

*/
select
    u.user_id
  , u.name
  , u.mail
from
  Users as u
where
  u.mail regexp '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$';
