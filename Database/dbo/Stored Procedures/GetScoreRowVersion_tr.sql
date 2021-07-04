--create procedure dbo.GetScoreRowVersion_tr
--  @OrganisationId int,
--  @ScoreId int,
--  @RowVersionStamp bigint output
--as

--set nocount on;
--set transaction isolation level read committed;

--set @RowVersionStamp = 0;

--select @RowVersionStamp = cast(RowVersionStamp as bigint)
--from dbo.InformalScore
--where OrganisationId = @OrganisationId and InformalScoreId = @ScoreId;

--return 0;

--go

--grant execute on object::dbo.GetScoreRowVersion_tr to WebsiteRole;
--go
