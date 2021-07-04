create procedure dbo.GetPasswordHashByEmail_tr
  @Email dbo.EmailAddress
as

set nocount on;
set transaction isolation level read committed;

select UserId, PasswordHash, IsVerified
from dbo.[User]
where Email = @Email;

return 0;

go

grant execute on object::dbo.GetPasswordHashByEmail_tr to WebsiteRole;
go
