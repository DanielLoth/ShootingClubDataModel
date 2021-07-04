--create procedure dbo.AddScore_tr
--  @OrganisationId int,
--  @ScoreId int output,
--  @PersonId int,
--  @GoverningBodyCode char(4),
--  @DisciplineCode char(4),
--  @ShooterCohortCode char(1),
--  @ScoreDate date,
--  @Score int
--as

--set nocount on;
--set transaction isolation level read committed;

--select @ScoreId = next value for dbo.ScoreIdSequence where @ScoreId is null;

--begin transaction;

--insert into dbo.InformalScore (OrganisationId, InformalScoreId, PersonId, GoverningBodyCode, DisciplineCode, ShooterCohortCode, ScoreDate, Score)
--values (@OrganisationId, @ScoreId, @PersonId, @GoverningBodyCode, @DisciplineCode, @ShooterCohortCode, @ScoreDate, @Score);

--commit;

--select @OrganisationId as OrganisationId, @ScoreId as ScoreId;

--return 0;
