create procedure dbo.ThrowError_OpenTransaction (
  @ProcId int
)
as
begin

declare @ErrorMessage nvarchar(512) = concat(
  'The procedure ''', dbo.GetObjectName_fn(@ProcId), ''' is a transaction, which is atomic. ',
  'It has been called within an open transaction, which would render it a non-transaction. ',
  'This is not allowed.'
);

throw 100000, @ErrorMessage, 0;

end
