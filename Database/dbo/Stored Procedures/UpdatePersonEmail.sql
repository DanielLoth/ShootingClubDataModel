create procedure dbo.UpdatePersonEmail
  @OrganisationId int,
  @PersonId int,
  @Email dbo.EmailAddress
as

set nocount on;
set transaction isolation level read committed;

exec dbo.EnsureTransactionCountIsOneOrThrow @@procid;

-- At this point, we should be running within the context of a transaction that has checked
-- the rowversion column in the dbo.Person table is equal to a given value AND updated the record
-- within dbo.Person thereby changing the rowversion to something else.
-- That means that we're effectively protected from all concurrency phenomena right now.

select @Email = isnull(@Email, N'');

delete dbo.PersonEmail
where OrganisationId = @OrganisationId and PersonId = @PersonId and @Email = N'';

if @@ROWCOUNT <> 0 goto finish; -- Cheeky, am I right?

update dbo.PersonEmail
set Email = @Email
where OrganisationId = @OrganisationId and PersonId = @PersonId and @Email <> N'';

if @@ROWCOUNT <> 0 goto finish;

begin try
  insert into dbo.PersonEmail (OrganisationId, PersonId, Email)
  values (@OrganisationId, @PersonId, @Email)
end try
begin catch
  -- Swallow the exception, as this procedure is an upsert.
end catch

finish:
return 0;

go
