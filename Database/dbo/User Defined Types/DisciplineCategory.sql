create type dbo.DisciplineCategory as table (
  DisciplineCategoryCode char(2) not null,
  DisciplineCategoryName nvarchar(50) not null,

  primary key clustered (DisciplineCategoryCode),
  unique (DisciplineCategoryName)
);
go
