/*
- Table:
. insurance
pid,
tiv_2015,
tiv_2016,
lat,
lon

- Question
. Write a solution to report the sum of all total investment values in 2016
tiv_2016, for all policyholders who:
have the same tiv_2015 value as one or more other policyholders,
and are not located in the same city as any other policyholder
(i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.

- Output
. tiv_2016
*/
-- Query purpose: Report the sum of tiv_2016 for eligible policyholders

with first_criteria as (
  select 
    i.pid
  from 
    insurance as i
  where
    exists (
      select
        i2.pid
      from
        insurance as i2
      where
        i2.pid != i.pid
        and i.tiv_2015 = i2.tiv_2015
    )
)
, second_criteria as (
  select
    i.pid
  from
    insurance as i
  where
    not exists (
      select
        i2.pid
      from
        insurance as i2
      where
        i2.pid != i.pid
        and i.lat = i2.lat
        and i.lon = i2.lon
    )
)
, eligible_policyholders as (
  select
    fc.pid
  from
    first_criteria as fc
  inner join
    second_criteria as sc
      on
        fc.pid = sc.pid
)
select 
  round(sum(i.tiv_2016), 2) as tiv_2016
from 
  eligible_policyholders as e
inner join
  insurance as i
    on
      e.pid = i.pid;