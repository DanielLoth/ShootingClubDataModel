create procedure dbo.AddGoverningBodies_tr
  @GoverningBodies dbo.GoverningBody readonly,
  @Disciplines dbo.Discipline readonly,
  @ShooterCohorts dbo.ShooterCohort readonly,
  @DisciplineOfferings dbo.DisciplineOffering readonly,
  @Grades dbo.Grade readonly
as
begin

  set nocount on;
  set transaction isolation level serializable;

  begin try
    begin transaction;

    declare @CurrentTime datetimeoffset(0) = getutcdate();

    merge into dbo.GoverningBody t
    using @GoverningBodies s
    on t.GoverningBodyCode = s.GoverningBodyCode
    when matched then
      update set
        t.OrganisationName = s.OrganisationName,
        t.UpdatedDtm = @CurrentTime
    when not matched by target then
      insert (GoverningBodyCode, OrganisationName, CreatedDtm, UpdatedDtm)
      values (s.GoverningBodyCode, s.OrganisationName, @CurrentTime, @CurrentTime);

    merge into dbo.Discipline t
    using @Disciplines s
    on t.GoverningBodyCode = s.GoverningBodyCode and t.DisciplineCode = s.DisciplineCode
    when matched then
      update set
        t.DisciplineName = s.DisciplineName,
        t.DisciplineCategoryCode = s.DisciplineCategoryCode,
        t.UpdatedDtm = @CurrentTime
    when not matched by target then
      insert (GoverningBodyCode, DisciplineCode, DisciplineName, DisciplineCategoryCode, CreatedDtm, UpdatedDtm)
      values (s.GoverningBodyCode, s.DisciplineCode, s.DisciplineName, s.DisciplineCategoryCode, @CurrentTime, @CurrentTime);

    merge into dbo.ShooterCohort t
    using @ShooterCohorts s
    on t.GoverningBodyCode = s.GoverningBodyCode and t.ShooterCohortCode = s.ShooterCohortCode
    when matched then
      update set
        t.ShooterCohortName = s.ShooterCohortName,
        t.UpdatedDtm = @CurrentTime
    when not matched by target then
      insert (GoverningBodyCode, ShooterCohortCode, ShooterCohortName, CreatedDtm, UpdatedDtm)
      values (s.GoverningBodyCode, s.ShooterCohortCode, s.ShooterCohortName, @CurrentTime, @CurrentTime);

    merge into dbo.DisciplineOffering t
    using @DisciplineOfferings s
    on t.GoverningBodyCode = s.GoverningBodyCode
      and t.DisciplineCode = s.DisciplineCode
      and t.ShooterCohortCode = s.ShooterCohortCode
    when not matched by target then
      insert (GoverningBodyCode, DisciplineCode, ShooterCohortCode, CreatedDtm, UpdatedDtm)
      values (s.GoverningBodyCode, s.DisciplineCode, s.ShooterCohortCode, @CurrentTime, @CurrentTime);

    merge into dbo.Grade t
    using @Grades s
    on t.GoverningBodyCode = s.GoverningBodyCode
      and t.DisciplineCode = s.DisciplineCode
      and t.ShooterCohortCode = s.ShooterCohortCode
      and t.GradeCode = s.GradeCode
    when matched then
      update set
        t.GradeName = s.GradeName,
        t.MinimumScore = s.MinimumScore,
        t.DisplayOrder = s.DisplayOrder
    when not matched by target then
      insert (GoverningBodyCode, DisciplineCode, ShooterCohortCode, GradeCode, GradeName, MinimumScore, DisplayOrder)
      values (s.GoverningBodyCode, s.DisciplineCode, s.ShooterCohortCode, s.GradeCode, s.GradeName, s.MinimumScore, s.DisplayOrder);

    commit;
  end try
  begin catch
    rollback;
    throw;
  end catch

end
go
