create view dbo.Number35_V
with schemabinding
as
with lv0 (n) as (
  select 1 union all select 1 union all select 1 union all select 1 union all select 1 union all -- 5 rows
  select 1 union all select 1 union all select 1 union all select 1 union all select 1 union all
  select 1 union all select 1 union all select 1 union all select 1 union all select 1 union all
  select 1 union all select 1 union all select 1 union all select 1 union all select 1 union all
  select 1 union all select 1 union all select 1 union all select 1 union all select 1 union all
  select 1 union all select 1 union all select 1 union all select 1 union all select 1 union all
  select 1 union all select 1 union all select 1 union all select 1 union all select 1
),
Tally (Number) as (
  select row_number() over (order by (select 1)) from lv0
)
select Number from Tally;
