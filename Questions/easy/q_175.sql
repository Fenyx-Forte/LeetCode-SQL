select
    p.firstname as firstName
  , p.lastname as lastName
  , a.city
  , a.state
from
  person as p
left join
  address as a
    on
      p.personid = a.personid;