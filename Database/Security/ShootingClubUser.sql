create login ShootingClubUser with password = N'ShootingClubUser';
go

create user ShootingClubUser
for login ShootingClubUser
with default_schema = dbo;
go

grant connect to ShootingClubUser;
go

alter role WebsiteRole add member ShootingClubUser;
go
