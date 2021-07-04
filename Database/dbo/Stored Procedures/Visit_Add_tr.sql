create procedure dbo.Visit_Add_tr
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

if exists (
  select 1
  from dbo.Visit
  where OrganisationId = @OrganisationId
    and PersonId = @PersonId
    and VisitDate = @VisitDate
)
begin
  raiserror (100301, -1, -1, @ProcName); -- Visit on the given date has already been recorded.
end

------------------------------------------------------------
-- Execute block
------------------------------------------------------------

-- This 'set transaction isolation level' statement is an
-- alternative to specifying the 'holdlock' int as done below.
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

if exists (
  select 1
  from dbo.Visit
  with (holdlock)
  where OrganisationId = @OrganisationId
    and PersonId = @PersonId
    and VisitDate = @VisitDate
)
begin
  rollback;
  raiserror (100301, -1, -1, @ProcName); -- Visit on the given date has already been recorded.
end

insert into dbo.Visit (OrganisationId, PersonId, VisitDate)
values (@OrganisationId, @PersonId, @VisitDate);

commit;

return 0;
