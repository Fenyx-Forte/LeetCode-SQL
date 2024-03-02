select
  c.name
from
  customer as c
where
  COALESCE(c.referee_id, 0) <> 2;