create procedure dbo.GetUserSignInDetails_tr
  @UserId int
as

set nocount on;
set transaction isolation level read committed;

select s.UserId, s.Email as Email, s.IsVerified
from dbo.[User] s
where s.UserId = @UserId;

return 0;

go

grant execute on object::dbo.GetUserSignInDetails_tr to WebsiteRole;
go
