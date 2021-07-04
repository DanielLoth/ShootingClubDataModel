create procedure dbo.ConfirmSignup_tr
  @VerificationCode nvarchar(100)
as

set nocount on;
set transaction isolation level read committed;

declare @UserUnverifiedId table (
  UserUnverifiedId int primary key
);

begin try
  begin transaction;

  delete dbo.UserUnverified
  output deleted.UserUnverifiedId
  into @UserUnverifiedId
  where VerificationCode = @VerificationCode;

  declare @UserId int = (select UserUnverifiedId from @UserUnverifiedId);
  declare @CurrentTime datetimeoffset(0) = getutcdate();

  update dbo.[User]
  set IsVerified = 1
  where UserId = @UserId;

  insert into dbo.UserVerified (UserVerifiedId, CreatedDtm, UpdatedDtm)
  values (@UserId, @CurrentTime, @CurrentTime);

  commit;

  select @UserId as UserId;
end try
begin catch
  rollback;
  select * from Error_V;
  return 1;
end catch

return 0;

go

grant execute on object::dbo.ConfirmSignup_tr to WebsiteRole;
go
