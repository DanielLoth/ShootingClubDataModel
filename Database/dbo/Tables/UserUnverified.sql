create table UserUnverified (
  UserUnverifiedId int not null,
  VerificationCode nvarchar(100) not null,
  RowVersionStamp rowversion not null,

  constraint UC_UserUnverified_PK
  primary key clustered (UserUnverifiedId),

  constraint U__UserUnverified_AK2
  unique (VerificationCode),

  constraint Registrant_Is_UserUnverified_FK
  foreign key (UserUnverifiedId)
  references [User] (UserId)
);
