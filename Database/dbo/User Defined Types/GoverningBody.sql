create type dbo.GoverningBody as table (
  GoverningBodyCode char(4) not null,
  OrganisationName nvarchar(100) not null,

  primary key clustered (GoverningBodyCode)
);
