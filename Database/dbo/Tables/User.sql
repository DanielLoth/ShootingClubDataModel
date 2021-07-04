create table dbo.[User] (
  UserId int not null,
  FullName nvarchar(100) not null,
  Email dbo.EmailAddress not null,
  PasswordHash dbo.PasswordHash not null,
  IsVerified bit not null,
  CreatedDtm datetimeoffset(0) not null,
  RowVersionStamp rowversion not null,

  constraint UC_User_PK primary key clustered (UserId),
  constraint U__User_Email_AK1 unique (Email),
);
go

exec sp_addextendedproperty
  @name = N'sys_information_type_id', @value = N'5c503e21-22c6-81fa-620b-f369b8ec38d1',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'User', @level2type = N'column', @level2name = N'Email';
go

exec sp_addextendedproperty
  @name = N'sys_information_type_name', @value = N'Contact Info',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'User', @level2type = N'column', @level2name = N'Email';
go

exec sp_addextendedproperty
  @name = N'sys_sensitivity_label_id', @value = N'331f0b13-76b5-2f1b-a77b-def5a73c73c2',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'User', @level2type = N'column', @level2name = N'Email';
go

exec sp_addextendedproperty
  @name = N'sys_sensitivity_label_name', @value = N'Confidential',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'User', @level2type = N'column', @level2name = N'Email';
go

exec sp_addextendedproperty
  @name = N'sys_information_type_id', @value = N'57845286-7598-22f5-9659-15b24aeb125e',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'User', @level2type = N'column', @level2name = N'FullName';
go

exec sp_addextendedproperty
  @name = N'sys_information_type_name', @value = N'Name',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'User', @level2type = N'column', @level2name = N'FullName';
go

exec sp_addextendedproperty
  @name = N'sys_sensitivity_label_id', @value = N'989adc05-3f3f-0588-a635-f475b994915b',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'User', @level2type = N'column', @level2name = N'FullName';
go

exec sp_addextendedproperty
  @name = N'sys_sensitivity_label_name', @value = N'Confidential - GDPR',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'User', @level2type = N'column', @level2name = N'FullName';
go

exec sp_addextendedproperty
  @name = N'sys_information_type_id', @value = N'c64aba7b-3a3e-95b6-535d-3bc535da5a59',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'User', @level2type = N'column', @level2name = N'PasswordHash';
go

exec sp_addextendedproperty
  @name = N'sys_information_type_name', @value = N'Credentials',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'User', @level2type = N'column', @level2name = N'PasswordHash';
go

exec sp_addextendedproperty
  @name = N'sys_sensitivity_label_id', @value = N'331f0b13-76b5-2f1b-a77b-def5a73c73c2',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'User', @level2type = N'column', @level2name = N'PasswordHash';
go

exec sp_addextendedproperty
  @name = N'sys_sensitivity_label_name', @value = N'Confidential',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'User', @level2type = N'column', @level2name = N'PasswordHash';
go
