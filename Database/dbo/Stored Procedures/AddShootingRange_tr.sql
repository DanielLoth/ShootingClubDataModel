create procedure dbo.AddShootingRange_tr
  @OrganisationId int,
  @ShootingRangeId int output,
  @RangeName nvarchar(50),
  @BayCount int,
  @CurrentTime datetimeoffset(0)
as

set nocount on;
set transaction isolation level read committed;

select @CurrentTime = getutcdate() where @CurrentTime is null;
select @ShootingRangeId = next value for ShootingRangeIdSequence where @ShootingRangeId is null;

begin try
  begin transaction;

  insert into dbo.ShootingRange (OrganisationId, ShootingRangeId, CreatedDtm, UpdatedDtm, RangeName)
  values (@OrganisationId, @ShootingRangeId, @CurrentTime, @CurrentTime, @RangeName);

  insert into dbo.ShootingRangeBay (OrganisationId, ShootingRangeId, BayNumber)
  select @OrganisationId, @ShootingRangeId, Number
  from dbo.Number30_V
  where Number < @BayCount -- Numbers less than @BayCount, but not @BayCount
  union
  -- If @BayCount is more than permitted, this will ensure CHECK constraint violation
  -- even in the event where there are fewer numbers returned by the dbo.Number30_V view.
  -- We want this behaviour to ensure that it doesn't silently just insert 30 bays despite
  -- the customer indicating that they want more, such as 50 bays.
  select @OrganisationId, @ShootingRangeId, @BayCount;

  insert into dbo.ShootingRangeSchedule (OrganisationId, ShootingRangeId, UpdatedDtm)
  values (@OrganisationId, @ShootingRangeId, @CurrentTime);

  commit;

  select @OrganisationId as OrganisationId, @ShootingRangeId as ShootingRangeId;
end try
begin catch
  rollback;
  select * from Error_V;
  return 1;
end catch

return 0;

go

grant execute on object::dbo.AddShootingRange_tr to WebsiteRole;
go
