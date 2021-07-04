--create procedure dbo.UpdateScore_tr
--  @OrganisationId int,
--  @ScoreId int,
--  @ScoreDate date,
--  @Score int,
--  @RowVersionStamp bigint,
--  @Force bit = 0
--as

--set nocount on;
--set transaction isolation level read committed;

--begin transaction;

--update dbo.InformalScore
--set Score = @Score, ScoreDate = @ScoreDate
--where OrganisationId = @OrganisationId
--and InformalScoreId = @ScoreId
--and (RowVersionStamp = cast(@RowVersionStamp as rowversion) or @Force = 1);

--commit;

--select @OrganisationId as OrganisationId, @ScoreId as ScoreId;

--return 0;

--go

--grant execute on object::dbo.UpdateScore_tr to WebsiteRole;
--go
