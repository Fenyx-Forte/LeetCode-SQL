CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    with rank_salary as (
      select
          e.salary
        , dense_rank() over(
            order by
              e.salary desc
          ) as "rank"
      from
        employee as e
    )
    select distinct
      r.salary
    from
      rank_salary as r
    where
      r.rank = N
  );
END