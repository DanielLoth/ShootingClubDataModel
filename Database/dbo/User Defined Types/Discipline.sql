create type dbo.Discipline as table (
  GoverningBodyCode char(4) not null,
  DisciplineCode char(4) not null,
  DisciplineName nvarchar(50) not null,
  DisciplineCategoryCode char(2) not null,

  primary key clustered (GoverningBodyCode, DisciplineCode)
);
