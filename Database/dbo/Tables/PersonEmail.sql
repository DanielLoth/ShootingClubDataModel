create table dbo.PersonEmail (
  OrganisationId int not null,
  PersonId int not null,
  RowVersionStamp rowversion not null,
  Email dbo.EmailAddress not null,
  
  constraint UC_PersonEmail_PK primary key clustered (OrganisationId, PersonId),
  constraint Person_Has_EmailAddress_FK foreign key (OrganisationId, PersonId) references dbo.Person (OrganisationId, PersonId)
);
go

exec sp_addextendedproperty
  @name = N'sys_information_type_id', @value = N'5c503e21-22c6-81fa-620b-f369b8ec38d1',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'PersonEmail', @level2type = N'column', @level2name = N'Email';
go

exec sp_addextendedproperty
  @name = N'sys_information_type_name', @value = N'Contact Info',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'PersonEmail', @level2type = N'column', @level2name = N'Email';
go

exec sp_addextendedproperty
  @name = N'sys_sensitivity_label_id', @value = N'331f0b13-76b5-2f1b-a77b-def5a73c73c2',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'PersonEmail', @level2type = N'column', @level2name = N'Email';
go

exec sp_addextendedproperty
  @name = N'sys_sensitivity_label_name', @value = N'Confidential',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'PersonEmail', @level2type = N'column', @level2name = N'Email';
go
