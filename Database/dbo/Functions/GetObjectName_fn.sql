create function dbo.GetObjectName_fn (
  @ObjectId int
)
returns nvarchar(257)
as
begin

return object_schema_name(@ObjectId) + '.' + object_name(@ObjectId);

end
