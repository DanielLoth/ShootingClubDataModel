--create procedure dbo.AddParticipation_tr
--  @OrganisationId int,
--  @PersonId int,
--  @ParticipationId int output,
--  @CountryCode char(2),
--  @SubdivisionCode char(3),
--  @ParticipationTypeCode char(1),
--  @ParticipationDate date
--as

--set nocount on;
--set transaction isolation level read committed;

--select @ParticipationId = next value for dbo.ParticipationIdSequence where @ParticipationId is null;

--begin try
--  insert into dbo.Participation (OrganisationId, PersonId, ParticipationId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate)
--  values (@OrganisationId, @PersonId, @ParticipationId, @CountryCode, @SubdivisionCode, @ParticipationTypeCode, @ParticipationDate);
--end try
--begin catch
--  -- Swallow the exception.
--end catch

--return 0;
