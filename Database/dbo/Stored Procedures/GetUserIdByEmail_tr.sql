create procedure dbo.GetUserIdByEmail_tr
  @Email dbo.EmailAddress,
  @UserId int output
as

set nocount on;
set transaction isolation level read committed;

select @UserId = UserId
from dbo.[User]
where Email = @Email;

return 0;

go

grant execute on object::dbo.GetUserIdByEmail_tr to WebsiteRole;
go
