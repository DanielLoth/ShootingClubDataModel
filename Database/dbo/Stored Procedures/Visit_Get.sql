create procedure dbo.Visit_Get
  @OrganisationId int,
  @PersonId int,
  @VisitDate date
as

set transaction isolation level read committed;

select OrganisationId, PersonId, VisitDate
from dbo.Visit
where OrganisationId = @OrganisationId
  and PersonId = @PersonId
  and VisitDate = @VisitDate;

if @@ROWCOUNT != 1
  return 1;
else
  return 0;
