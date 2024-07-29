(
  select
      p.product_id
    , "store1" as store
    , p.store1 as price
  from
    products as p
  where
    p.store1 is not null
)
union
(
  select
      p.product_id
    , "store2" as store
    , p.store2 as price
  from
    products as p
  where
    p.store2 is not null
)
union(
  select
      p.product_id
    , "store3" as store
    , p.store3 as price
  from
    products as p
  where
    p.store3 is not null
);