create procedure dbo.AddSignup_tr
  @UserId int output,
  @FullName nvarchar(150),
  @Email dbo.EmailAddress,
  @PasswordHash dbo.PasswordHash,
  @VerificationCode nvarchar(100),
  @CurrentTime datetimeoffset(0) output
as

set nocount on;
set transaction isolation level read committed;

select @CurrentTime = getutcdate() where @CurrentTime is null;
select @UserId = next value for UserIdSequence where @UserId is null;

begin try
  begin transaction;

  insert into dbo.[User] (UserId, FullName, Email, PasswordHash, CreatedDtm, IsVerified)
  values (@UserId, @FullName, @Email, @PasswordHash, @CurrentTime, 0);

  insert into dbo.UserUnverified (UserUnverifiedId, VerificationCode)
  values (@UserId, @VerificationCode);

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

grant execute on object::dbo.AddSignup_tr to WebsiteRole;
go
