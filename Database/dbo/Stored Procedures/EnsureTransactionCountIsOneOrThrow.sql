create procedure dbo.EnsureTransactionCountIsOneOrThrow
  @ProcId int
as

set nocount on;

if @@TRANCOUNT <> 1
begin
  declare @Msg nvarchar(400) = formatmessage(
    N'Procedure ''%s.%s'' must be executed within an existing transaction and @@TRANCOUNT must equal exactly 1',
    object_schema_name(@ProcId), object_name(@ProcId));

  throw 100000, @Msg, 1;
end;

return 0;

go
