create function ValidateCompetitionType_fn(
  @OrganisationId int,
  @CompetitionId int,
  @IsHosted bit
)
returns bit
with schemabinding
as
begin

declare @Result bit = 0;

select @Result = 1
from dbo.Competition -- Must have schema.table (two-part format) for schemabinding
where OrganisationId = @OrganisationId
  and CompetitionId = @CompetitionId
  and IsHosted = @IsHosted;

return @Result;

end;
