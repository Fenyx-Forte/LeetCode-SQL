select
    t.id
  , case
      when t.p_id is null then "Root"
      when t.id in (
        select
          t2.p_id
        from
          tree as t2) then "Inner"
      else "Leaf"
    end as "type"
from
  tree as t;