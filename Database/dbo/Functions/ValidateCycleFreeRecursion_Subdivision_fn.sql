create function dbo.ValidateCycleFreeRecursion_Subdivision_fn()
returns bit
with schemabinding
as
begin
  -- At the moment, max depth in practice should be 2.
  -- GB (United Kingdom)                      - Depth 0
  -- GB (United Kingdom) -> GB-SCT (Scotland) - Depth 1
  -- GB-SCT (Scotland) -> GB-GLG (Glasgow)    - Depth 2
  declare @MaxRecursionDepth int = 3;

  declare @Result bit = 1;

  with LocationHierarchy (CountryCode, SubdivisionCode, ParentCountryCode, ParentSubdivisionCode, RecursionDepth)
  as (
    select
      l.CountryCode,
      l.SubdivisionCode,
      cast('' as char(2)) as ParentCountryCode,
      cast('' as char(3)) as ParentSubdivisionCode,
      0 as RecursionDepth
    from dbo.Location l
    where l.LocationType = 'C'

    union all

    select
      s.CountryCode,
      s.SubdivisionCode,
      lh.ParentCountryCode,
      lh.ParentSubdivisionCode,
      lh.RecursionDepth + 1 as RecursionDepth
    from dbo.Subdivision s
    inner join LocationHierarchy lh on lh.ParentCountryCode = s.CountryCode and lh.ParentSubdivisionCode = s.SubdivisionCode
    where lh.RecursionDepth <= @MaxRecursionDepth
  )
  select @Result = 0
  from LocationHierarchy
  where RecursionDepth >= @MaxRecursionDepth;

  return @Result;
end;
