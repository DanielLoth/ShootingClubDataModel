create view dbo.Error_V
with schemabinding
as
select
  ERROR_NUMBER() as ErrorNumber,
  ERROR_SEVERITY() as ErrorSeverity,
  ERROR_STATE() as ErrorState,
  ERROR_PROCEDURE() as ErrorProcedure,
  ERROR_MESSAGE() as ErrorMessage,
  ERROR_LINE() as ErrorLine;

go

