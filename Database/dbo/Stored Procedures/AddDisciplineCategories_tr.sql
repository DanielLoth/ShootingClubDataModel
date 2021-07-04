create procedure dbo.AddDisciplineCategories_tr
  @DisciplineCategories dbo.DisciplineCategory readonly
as
begin

  set nocount on;
  set transaction isolation level serializable;

  begin try
    begin transaction;

    declare @CurrentTime datetimeoffset(0) = getutcdate();

    merge into dbo.DisciplineCategory t
    using @DisciplineCategories s
    on t.DisciplineCategoryCode = s.DisciplineCategoryCode
    when matched and t.DisciplineCategoryName <> s.DisciplineCategoryName
    then
      update set
        t.DisciplineCategoryName = s.DisciplineCategoryName,
        t.UpdatedDtm = @CurrentTime
    when not matched by target then
      insert (DisciplineCategoryCode, DisciplineCategoryName, CreatedDtm, UpdatedDtm)
      values (s.DisciplineCategoryCode, s.DisciplineCategoryName, @CurrentTime, @CurrentTime);

    commit;
  end try
  begin catch
    rollback;
    throw;
  end catch

end
go
