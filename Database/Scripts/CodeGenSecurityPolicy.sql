with TablesWithOrgId (SchemaName, TableName, ColumnName) as (
  select
    object_schema_name(t.object_id) as SchemaName,
    t.name as TableName,
    c.name as ColumnName
  from sys.tables t
  inner join sys.columns c on t.object_id = c.object_id
  where c.name = 'OrganisationId'
),
SecurityOperations (DmlOpDisplayOrder, DmlOpCode, PredicateType, FuncName, AfterClause) as (
  select 0, 'S', 'filter', 'SecurityReadPredicate_fn', ''
  union
  select 1, 'I', 'block', 'SecurityWritePredicate_fn', ' after insert'
  union
  select 2, 'U', 'block', 'SecurityWritePredicate_fn', ' after update'
),
PredicateCount as (
  select (select count(1) from TablesWithOrgId) * (select count(1) from SecurityOperations) as NumPredicateLines
),
TablesWithSecurityOps as (
  select
    row_number() over (order by t.SchemaName, t.TableName, so.DmlOpDisplayOrder) as PredicateLineDisplayOrder,
    t.*, so.*
  from TablesWithOrgId t
  outer apply SecurityOperations so
),
QueryLines (DisplayOrder, Line) as (
  select -10, '-- This security policy is code-generated. Refer to CodeGenSecurityPolicy.sql'
  union all
  select 0, 'create security policy dbo.OrganisationSecurityPolicy'
  union all
  select t.PredicateLineDisplayOrder,
    concat(
      '  add ', t.PredicateType, ' predicate ',
      t.SchemaName, '.', t.FuncName, '(', t.ColumnName, ')',
      ' on ',
      t.SchemaName, '.', t.TableName, t.AfterClause,

      case when t.PredicateLineDisplayOrder = pc.NumPredicateLines then '' else ',' end
    ) as Line
  from TablesWithSecurityOps t
  outer apply PredicateCount pc
  union all
  select (select NumPredicateLines + 1000 from PredicateCount), 'with (state = on, schemabinding = on);'
  union all
  select (select NumPredicateLines + 2000 from PredicateCount), '' -- Empty newline
)
select Line
from QueryLines
order by DisplayOrder;
