create procedure dbo.AddCompetition_tr
  @OrganisationId int,
  @CompetitionId int output,
  @CompetitionName nvarchar(100),
  @CurrentTime datetimeoffset(0)
as

set nocount on;
set transaction isolation level read committed;

select @CurrentTime = getutcdate() where @CurrentTime is null;
select @CompetitionId = next value for CompetitionIdSequence where @CompetitionId is null;

begin try
  begin transaction;

  insert into dbo.Competition (OrganisationId, CompetitionId, CompetitionName, IsHosted, CreatedDtm, UpdatedDtm)
  values (@OrganisationId, @CompetitionId, @CompetitionName, 1, @CurrentTime, @CurrentTime);

  commit;

  select @OrganisationId as OrganisationId, @CompetitionId as CompetitionId;
end try
begin catch
  rollback;
  select * from Error_V;
  return 1;
end catch

return 0;

go

grant execute on object::dbo.AddCompetition_tr to WebsiteRole;
go
