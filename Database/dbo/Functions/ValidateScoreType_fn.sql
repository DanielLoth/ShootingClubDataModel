create function ValidateScoreType_fn(
  @OrganisationId int,
  @PersonId int,
  @GoverningBodyCode char(4),
  @DisciplineCode char(4),
  @ShooterCohortCode char(1),
  @ScoreDifferentiator int,
  @IsCompetitionScore bit
)
returns bit
with schemabinding
as
begin

declare @Result bit = 0;

select @Result = 1
from dbo.Score
where OrganisationId = @OrganisationId
  and PersonId = @PersonId
  and GoverningBodyCode = @GoverningBodyCode
  and DisciplineCode = @DisciplineCode
  and ShooterCohortCode = @ShooterCohortCode
  and ScoreDifferentiator = @ScoreDifferentiator
  and IsCompetitionScore = @IsCompetitionScore;

return @Result;

end;
