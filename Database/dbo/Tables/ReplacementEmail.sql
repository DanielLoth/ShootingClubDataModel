create table dbo.ReplacementEmail (
  UserVerifiedId int not null,
  NewEmail dbo.EmailAddress not null,
  VerificationCode nvarchar(100) not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset (0) not null,

  constraint UC_ReplacementEmail_PK primary key clustered (UserVerifiedId),

  constraint UserVerified_IntendsToBeContactableBy_ReplacementEmail_FK
  foreign key (UserVerifiedId)
  references dbo.UserVerified (UserVerifiedId)
);
go

exec sp_addextendedproperty
  @name = N'sys_information_type_id', @value = N'5c503e21-22c6-81fa-620b-f369b8ec38d1',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'ReplacementEmail', @level2type = N'column', @level2name = N'NewEmail';
go

exec sp_addextendedproperty
  @name = N'sys_information_type_name', @value = N'Contact Info',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'ReplacementEmail', @level2type = N'column', @level2name = N'NewEmail';
go

exec sp_addextendedproperty
  @name = N'sys_sensitivity_label_id', @value = N'331f0b13-76b5-2f1b-a77b-def5a73c73c2',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'ReplacementEmail', @level2type = N'column', @level2name = N'NewEmail';
go

exec sp_addextendedproperty
  @name = N'sys_sensitivity_label_name', @value = N'Confidential',
  @level0type = N'schema', @level0name = N'dbo', @level1type = N'table', @level1name = N'ReplacementEmail', @level2type = N'column', @level2name = N'NewEmail';
go
