create table UserVerified (
  UserVerifiedId int not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset (0) not null,
  UpdatedDtm datetimeoffset (0) not null,

  constraint UC_UserVerified_PK
  primary key clustered (UserVerifiedId),

  constraint Registrant_Is_UserVerified_FK
  foreign key (UserVerifiedId)
  references [User] (UserId)
);
