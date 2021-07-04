create procedure dbo.AddParticipationTypes_tr
  @ParticipationTypes dbo.ParticipationType readonly,
  @LocationParticipationTypes dbo.LocationParticipationType readonly
as
begin
  set nocount on;
  set transaction isolation level serializable;

  begin try
    begin transaction;

    merge into dbo.ParticipationType t
    using @ParticipationTypes s
      on s.ParticipationTypeCode = t.ParticipationTypeCode
    when matched then
      update set
        t.ParticipationTypeName = s.ParticipationTypeName
    when not matched by target then
      insert (ParticipationTypeCode, ParticipationTypeName)
      values (s.ParticipationTypeCode, s.ParticipationTypeName);

    merge into dbo.LocationParticipationType t
    using @LocationParticipationTypes s
      on s.CountryCode = t.CountryCode
      and s.SubdivisionCode = t.SubdivisionCode
      and s.ParticipationTypeCode = t.ParticipationTypeCode
    when matched then
      update set
        t.ParticipationTypeName = s.ParticipationTypeName
    when not matched by target then
      insert (CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationTypeName)
      values (s.CountryCode, s.SubdivisionCode, s.ParticipationTypeCode, s.ParticipationTypeName);

    commit;
  end try
  begin catch
    rollback;
    throw;
  end catch;

  return 0;
end
go
