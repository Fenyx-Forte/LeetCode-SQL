select
  w1.id as Id
from
  weather as w1
inner join
  weather as w2
    on datediff(w1.recorddate, w2.recorddate) = 1
where
  w1.temperature > w2.temperature;

