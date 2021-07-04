create procedure dbo.GetVerificationCode_tr
  @UserUnverifiedId int
as

set nocount on;
set transaction isolation level read committed;

select u.UserUnverifiedId, u.VerificationCode, e.Email
from dbo.UserUnverified u
inner join dbo.[User] e on u.UserUnverifiedId = e.UserId
where u.UserUnverifiedId = @UserUnverifiedId;

return 0;

go

grant execute on object::dbo.GetVerificationCode_tr to WebsiteRole;
go
