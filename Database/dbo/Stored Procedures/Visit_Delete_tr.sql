create procedure dbo.Visit_Delete_tr
  @OrganisationId int,
  @PersonId int,
  @VisitDate date
as

set implicit_transactions off;

declare @ProcName sysname = object_name(@@procid);

if @@TRANCOUNT > 0
begin
  raiserror (100001, -1, -1, @ProcName);
end

------------------------------------------------------------
-- Validation block
------------------------------------------------------------
set transaction isolation level read committed;

if not exists (
  select 1
  from dbo.Organisation
  where OrganisationId = @OrganisationId
)
begin
  raiserror (100100, -1, -1, @ProcName); -- Organisation does not exist
end

if not exists (
  select 1
  from dbo.Person
  where OrganisationId = @OrganisationId
    and PersonId = @PersonId
)
begin
  raiserror (100200, -1, -1, @ProcName); -- Person does not exist
end

if not exists (
  select 1
  from dbo.Visit
  where OrganisationId = @OrganisationId
    and PersonId = @PersonId
    and VisitDate = @VisitDate
)
begin
  raiserror (100300, -1, -1, @ProcName); -- Visit does not exist.
end

------------------------------------------------------------
-- Execute block
------------------------------------------------------------
set transaction isolation level serializable;

begin transaction;

if not exists (
  select 1
  from dbo.Organisation
  with (holdlock)
  where OrganisationId = @OrganisationId
)
begin
  rollback;
  raiserror (100100, -1, -1, @ProcName); -- Organisation does not exist
end

if not exists (
  select 1
  from dbo.Person
  with (holdlock)
  where OrganisationId = @OrganisationId
    and PersonId = @PersonId
)
begin
  rollback;
  raiserror (100200, -1, -1, @ProcName); -- Person does not exist
end

if not exists (
  select 1
  from dbo.Visit
  with (holdlock)
  where OrganisationId = @OrganisationId
    and PersonId = @PersonId
    and VisitDate = @VisitDate
)
begin
  rollback;
  raiserror (100300, -1, -1, @ProcName); -- Visit does not exist.
end

delete dbo.Visit
where OrganisationId = @OrganisationId
  and PersonId = @PersonId
  and VisitDate = @VisitDate;

commit;

return 0;
