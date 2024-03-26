/*
- Table
. Triangle

- Columns
. x
. y
. z

- Question
. Report for every three line segments whether they can form a triangle.

- Output
. x
. y
. z
. triangle ("No" or "Yes")
*/
/*
Purpose: Report whether every three line segments can form a triangle
*/

select
    t.x
  , t.y
  , t.z
  , case
      when (t.x + t.y > t.z)
          and (t.x + t.z > t.y)
          and (t.y + t.z > t.x) then 'Yes'
      else 'No'
    end as triangle
from
  triangle as t;