select distinct
    p.product_id
  , p.product_name
from
  product as p
inner join
  sales as s
    on
      p.product_id = s.product_id
where
  p.product_id not in (
    select
      s.product_id
    from
      sales as s
    where
      s.sale_date > "2019-03-31"
      or s.sale_date < "2019-01-01"
  );