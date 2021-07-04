declare @DisciplineCategories dbo.DisciplineCategory;

insert into @DisciplineCategories (DisciplineCategoryCode, DisciplineCategoryName)
values
  ('P', N'Pistol'),
  ('R', N'Rifle'),
  ('S', N'Shotgun');

if (N'$(InsertReferenceData)' = 'True')
begin
  exec dbo.AddDisciplineCategories_tr @DisciplineCategories;
end
