if (N'$(InsertTestData)' = 'True')
begin

declare @CurrentTime datetimeoffset(0) = getutcdate();
declare @OrganisationName nvarchar(100) = concat('Org - ', replace(newid(), '-', ''));
declare @Email nvarchar(320);

declare @UserId int;
declare @OrganisationId int;
declare @PersonId int;
declare @ShootingRangeId int;
declare @CompetitionId int;
declare @ScoreId int;
declare @ParticipationId int;
declare @Result int;
declare @Rv bigint;

exec @Result = dbo.GetUserIdByEmail_tr N'test@test.com', @UserId output;

if @UserId is null
begin
  exec @Result = dbo.AddSignup_tr @UserId output, N'Daniel Loth', N'test@test.com',
    'AQAAAAEAACcQAAAAEHT9BdcaKp6KYQuwKh0TbeocdoKx7EQ0Ags5et9AQKJ5mOjERisxjXz8VkgTeYx/rQ==',
    'MyCode', @CurrentTime;

  print formatmessage('AddSignup_tr result: %d', @Result);

  exec @Result = dbo.ConfirmSignup_tr 'MyCode';

  print formatmessage('ConfirmSignup_tr result: %d', @Result);
end



exec @Result = dbo.AddOrganisation_tr @UserId, @OrganisationId output, @OrganisationName, @CurrentTime;

print formatmessage('AddOrganisation_tr: %d', @Result);


select @PersonId = null, @Rv = null, @Email = null;
exec dbo.AddPerson_tr @OrganisationId, @PersonId output, N'Daniel J', N'Loth', null, @CurrentTime;
select @Email = Email from dbo.PersonEmail where OrganisationId = @OrganisationId and PersonId = @PersonId;
print formatmessage('UpdatePerson_tr: Result = %d - Email = %s', @Result, @Email);

select @Rv = null, @Email = null;
exec dbo.GetPersonRowVersion_tr @OrganisationId, @PersonId, @Rv output;
exec dbo.UpdatePerson_tr @OrganisationId, @PersonId, N'Daniel James', N'Loth', N'lothyis+dan@gmail.com', @Rv, @CurrentTime;
select @Email = Email from dbo.PersonEmail where OrganisationId = @OrganisationId and PersonId = @PersonId;
print formatmessage('UpdatePerson_tr: Result = %d - Email = %s', @Result, @Email);

select @Rv = null, @Email = null;
exec dbo.GetPersonRowVersion_tr @OrganisationId, @PersonId, @Rv output;
exec dbo.UpdatePerson_tr @OrganisationId, @PersonId, N'Daniel James', N'Loth', N'lothyis@gmail.com', @Rv, @CurrentTime;
select @Email = Email from dbo.PersonEmail where OrganisationId = @OrganisationId and PersonId = @PersonId;
print formatmessage('UpdatePerson_tr: Result = %d - Email = %s', @Result, @Email);

select @Rv = null, @Email = null;
exec dbo.GetPersonRowVersion_tr @OrganisationId, @PersonId, @Rv output;
exec dbo.UpdatePerson_tr @OrganisationId, @PersonId, N'Daniel James', N'Loth', null, @Rv, @CurrentTime;
select @Email = Email from dbo.PersonEmail where OrganisationId = @OrganisationId and PersonId = @PersonId;
print formatmessage('UpdatePerson_tr: Result = %d - Email = %s', @Result, @Email);

select @Rv = null, @Email = null;
exec dbo.GetPersonRowVersion_tr @OrganisationId, @PersonId, @Rv output;
exec dbo.UpdatePerson_tr @OrganisationId, @PersonId, N'Daniel James', N'Loth', N'lothyis@gmail.com', @Rv, @CurrentTime;
select @Email = Email from dbo.PersonEmail where OrganisationId = @OrganisationId and PersonId = @PersonId;
print formatmessage('UpdatePerson_tr: Result = %d - Email = %s', @Result, @Email);

exec dbo.Visit_Add_tr @OrganisationId, @PersonId, '2021-03-07'; -- Test add

begin try
  exec dbo.Visit_Add_tr @OrganisationId, @PersonId, '2021-03-07'; -- Test double-add (idempotent/safe)
end try
begin catch
  if (ERROR_NUMBER() <> 100301) throw 999999, 'Unexpected failure when adding duplicate visit date', 1;
end catch

exec dbo.Visit_Add_tr @OrganisationId, @PersonId, '2021-03-08'; -- Another add
exec dbo.Visit_Add_tr @OrganisationId, @PersonId, '2021-03-09';-- Another add
exec dbo.Visit_Delete_tr @OrganisationId, @PersonId, '2021-03-09'; -- Test delete

--select @ParticipationId = null;
--exec dbo.AddParticipation_tr @OrganisationId, @PersonId, @ParticipationId output, 'AU', 'NSW', 'S', '2021-03-07'; -- Test add
--select @ParticipationId = null;
--exec dbo.AddParticipation_tr @OrganisationId, @PersonId, @ParticipationId output, 'AU', 'NSW', 'T', '2021-03-07'; -- Test add
--select @ParticipationId = null;
--exec dbo.AddParticipation_tr @OrganisationId, @PersonId, @ParticipationId output, 'AU', 'NSW', 'T', '2021-03-07'; -- Oops, added the same thing twice
--exec dbo.DeleteParticipation_tr @OrganisationId, @PersonId, @ParticipationId; -- Test delete

--select @ScoreId = null;
--exec dbo.AddScore_tr @OrganisationId, @ScoreId output, @PersonId, 'ISSF', 'FP', 'M', '2021-03-07', 509;
--select @ScoreId = null;
--exec dbo.AddScore_tr @OrganisationId, @ScoreId output, @PersonId, 'ISSF', 'FP', 'M', '2021-03-07', 511;
--exec dbo.GetScoreRowVersion_tr @OrganisationId, @ScoreId, @Rv output;
--exec dbo.UpdateScore_tr @OrganisationId, @ScoreId, '2021-03-07', 515, @RowVersionStamp = null, @Force = 1;

print formatmessage('UpdatePerson_tr: Result = %d', @Result);


select @ShootingRangeId = null, @Rv = null;
exec dbo.AddShootingRange_tr @OrganisationId, @ShootingRangeId output, N'Range 1', 8, @CurrentTime;

select @ShootingRangeId = null, @Rv = null;
exec dbo.AddShootingRange_tr @OrganisationId, @ShootingRangeId output, N'Range 2', 8, @CurrentTime;

select @ShootingRangeId = null, @Rv = null;
exec dbo.AddShootingRange_tr @OrganisationId, @ShootingRangeId output, N'Range 3', 24, @CurrentTime;

select @ShootingRangeId = null, @Rv = null;
exec dbo.AddShootingRange_tr @OrganisationId, @ShootingRangeId output, N'Range 4', 30, @CurrentTime;

-- This one should not result in records inserted. Too many bays at this time (we only allow 30).
select @ShootingRangeId = null, @Rv = null;
exec dbo.AddShootingRange_tr @OrganisationId, @ShootingRangeId output, N'Range 5', 40, @CurrentTime;


select @CompetitionId = null, @Rv = null;
exec dbo.AddCompetition_tr @Organisationid, @CompetitionId output, N'My comp', @CurrentTime;

end
