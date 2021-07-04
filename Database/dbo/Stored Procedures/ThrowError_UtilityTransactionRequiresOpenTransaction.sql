create procedure dbo.ThrowError_UtilityTransactionRequiresOpenTransaction (
  @ProcId int
)
as
begin

declare @ErrorMessage nvarchar(512) = concat(
  'The procedure ''', dbo.GetObjectName_fn(@ProcId), ''' is a utility transaction. ',
  'It must be called from within an open transaction.'
);

throw 100001, @ErrorMessage, 0;

end
