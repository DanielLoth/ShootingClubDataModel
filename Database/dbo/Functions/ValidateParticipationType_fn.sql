create function ValidateParticipationType_fn(
  @OrganisationId int,
  @PersonId int,
  @CountryCode char(2),
  @SubdivisionCode char(3),
  @ParticipationTypeCode char(1),
  @ParticipationDate date
)
-- OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate, ExternalCompetitionId
returns bit
with schemabinding
as
begin

declare @Result bit = 0;

return @Result;

end;
