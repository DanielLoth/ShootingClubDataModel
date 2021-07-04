create table dbo.Discipline (
  GoverningBodyCode char(4) not null,
  DisciplineCode char(4) not null,
  DisciplineName nvarchar(50) not null,
  DisciplineCategoryCode char(2) not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset (0) not null,
  UpdatedDtm datetimeoffset (0) not null,
  
  constraint UC_Discipline_PK
  primary key clustered (GoverningBodyCode, DisciplineCode),

  constraint GoverningBody_Sanctions_Discipline_FK
  foreign key (GoverningBodyCode)
  references dbo.GoverningBody (GoverningBodyCode),

  constraint DisciplineCategory_categorises_Discipline_FK
  foreign key (DisciplineCategoryCode)
  references dbo.DisciplineCategory (DisciplineCategoryCode)
);
go
