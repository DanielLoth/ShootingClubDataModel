create procedure dbo.AddLocations_tr
  @Countries dbo.Country readonly,
  @Subdivisions dbo.Subdivision readonly,
  @SubdivisionCategories dbo.SubdivisionCategory readonly
as
begin
  set nocount on;
  set transaction isolation level serializable;

  begin try
    begin transaction;

    merge into dbo.Location t
    using (
      select CountryCode, '' as SubdivisionCode, ShortName, 'C' as LocationType
      from @Countries

      union all

      select CountryCode, SubdivisionCode, ShortName, 'S' as LocationType
      from @Subdivisions
    ) s
      on t.CountryCode = s.CountryCode
      and t.SubdivisionCode = s.SubdivisionCode
    when not matched by target then
      insert (CountryCode, SubdivisionCode, LocationType, ShortName)
      values (s.CountryCode, s.SubdivisionCode, s.LocationType, s.ShortName);

    merge into dbo.Country t
    using @Countries s
      on t.CountryCode = s.CountryCode
    when not matched by target then
      insert (CountryCode, SubdivisionCode)
      values (s.CountryCode, '');

    merge into dbo.SubdivisionCategory t
    using @SubdivisionCategories s
      on t.CountryCode = s.CountryCode
      and t.SubdivisionCategoryCode = s.SubdivisionCategoryCode
    when not matched by target then
      insert (CountryCode, SubdivisionCategoryCode, SubdivisionCategoryName)
      values (s.CountryCode, s.SubdivisionCategoryCode, s.SubdivisionCategoryName);

    merge into dbo.Subdivision t
    using @Subdivisions s
      on t.CountryCode = s.CountryCode
      and t.SubdivisionCode = s.SubdivisionCode
    when not matched by target then
      insert (CountryCode, SubdivisionCode, SubdivisionCategoryCode)
      values (s.CountryCode, s.SubdivisionCode, s.SubdivisionCategoryCode);

    commit;
  end try
  begin catch
    rollback;
    throw;
  end catch
end
go
