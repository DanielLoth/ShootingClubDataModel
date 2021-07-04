create table dbo.DisciplineCategory (
  DisciplineCategoryCode char(2) not null,
  DisciplineCategoryName nvarchar(50) not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset(0) not null,
  UpdatedDtm datetimeoffset(0) not null,

  constraint UC_DisciplineCategory_PK
  primary key clustered (DisciplineCategoryCode)
);
go
