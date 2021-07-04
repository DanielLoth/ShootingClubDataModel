create function dbo.ValidateCycleFreeSchema_fn()
returns bit
as
begin
  declare @MaxRecursionDepth int = 50;
  declare @Result bit = 1;

  with TableHierarchy (ReferencedSchema, ReferencedTable, ParentSchema, ParentTable, RecursionDepth)
  as (
    select
      schema_name(referencedTable.schema_id), referencedTable.name,
      schema_name(parentTable.schema_id), parentTable.name,
      0
    from sys.foreign_keys fk
    inner join sys.tables referencedTable on fk.referenced_object_id = referencedTable.object_id
    inner join sys.tables parentTable on fk.parent_object_id = parentTable.object_id

    union all

    select
      schema_name(referencedTable.schema_id), referencedTable.name,
      schema_name(parentTable.schema_id), parentTable.name,
      th.RecursionDepth + 1
    from sys.foreign_keys fk
    inner join sys.tables referencedTable on fk.referenced_object_id = referencedTable.object_id
    inner join sys.tables parentTable on fk.parent_object_id = parentTable.object_id
    inner join TableHierarchy th on th.ParentSchema = schema_name(referencedTable.schema_id) and th.ParentTable = referencedTable.name
    where th.RecursionDepth <= @MaxRecursionDepth
  )
  select @Result = 0
  from TableHierarchy
  where RecursionDepth >= @MaxRecursionDepth;

  return @Result;
end
