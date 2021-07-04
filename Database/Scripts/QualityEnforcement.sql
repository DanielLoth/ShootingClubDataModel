-- Stackoverflow answer outlining the conventions that this script enforces adherence with:
-- https://stackoverflow.com/questions/4702728/relational-table-naming-convention/4703155#4703155

declare @ObjectSchema sysname;
declare @ObjectName sysname;
declare @Message nvarchar(2000);

--------------------------------------------------------------------------------
-- Key constraint rules
-- 1. Primary key constraint names must end with suffix _PK
-- 2. Unique key constraint names must end with suffix _AK1, _AK2 ... _AK5
-- 3. All key constraints must have an explicit name (must not be system-named)
--------------------------------------------------------------------------------
select @ObjectSchema = schema_name(schema_id), @ObjectName = name
from sys.key_constraints
where
  name not like '%_PK'
  and name not like 'PK__sysdiagr%'
  and name not like 'PK_%Refact_%'
  and type = 'PK'
  and is_ms_shipped = 0;

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: All primary key constraints must end in ''_PK''. Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


select @ObjectSchema = schema_name(schema_id), @ObjectName = name
from sys.key_constraints
where
  type = 'UQ'
  and is_ms_shipped = 0
  and name not like 'UK_principal_name'
  and (
    name not like '%_AK1'
    and name not like '%_AK2'
    and name not like '%_AK3'
    and name not like '%_AK4'
    and name not like '%_AK5'
  );

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: All unique key constraints must end in ''_AK<Number>'' (for example _AK1 or _AK2). Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


select @ObjectSchema = schema_name(schema_id), @ObjectName = name
from sys.key_constraints
where
  is_ms_shipped = 0
  and name not like 'PK__sysdiagr%'
  and name not like 'PK_%Refact_%'
  and is_system_named = 1;

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: All key constraints must have an explicit constraint name (must not be system-named). Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


--------------------------------------------------------------------------------
-- Check constraint rules
-- 1. Check constraint names must end with suffix _CK
-- 2. Check constraints must have an explicit name (must not be system-named)
--------------------------------------------------------------------------------
select @ObjectSchema = schema_name(schema_id), @ObjectName = name
from sys.check_constraints
where
  is_ms_shipped = 0
  and name not like '%_ck';

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: Check constraint names must end in ''_ck''. Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


select @ObjectSchema = schema_name(schema_id), @ObjectName = name
from sys.check_constraints
where
  is_ms_shipped = 0
  and is_system_named = 1;

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: All check constraints must have an explicit constraint name (must not be system-named). Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


--------------------------------------------------------------------------------
-- Default constraint rules
-- 1. Default constraints are forbidden
--------------------------------------------------------------------------------
select @ObjectSchema = schema_name(schema_id), @ObjectName = name
from sys.default_constraints;

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: Default constraints are forbidden. Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


--------------------------------------------------------------------------------
-- Foreign key constraint rules
-- 1. Foreign key constraint names must end with suffix _FK
-- 2. Foreign key constraints must have an explicit name
-- 3. Foreign keys must specify NO ACTION for updates and deletes
--------------------------------------------------------------------------------
select @ObjectSchema = schema_name(schema_id), @ObjectName = name
from sys.foreign_keys
where name not like '%_FK' and is_ms_shipped = 0;

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: All foreign key names must end in ''_FK''. Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


select @ObjectSchema = schema_name(schema_id), @ObjectName = name
from sys.foreign_keys
where is_ms_shipped = 0 and is_system_named = 1;

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: All foreign keys must have an explicit name (must not be system-named). Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


select @ObjectSchema = schema_name(schema_id), @ObjectName = name
from sys.foreign_keys
where
  is_ms_shipped = 0
  and (
    delete_referential_action_desc <> 'NO_ACTION'
    or update_referential_action_desc <> 'NO_ACTION'
  );

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: Foreign keys must specify NO ACTION for cascading updates and deletes. Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


--------------------------------------------------------------------------------
-- Index rules
-- 1. Clustered unique indexes must have name starting with UC_
-- 2. Non-clustered unique indexes must have name starting with U__
-- 3. Non-clustered non-unique indexes must have name starting with ___
--------------------------------------------------------------------------------
select @ObjectSchema = schema_name(t.schema_id), @ObjectName = i.name
from sys.indexes i
inner join sys.tables t
on i.object_id = t.object_id
where
  i.auto_created = 0
  and t.is_ms_shipped = 0
  and i.name not like 'PK__sysdiagr%'
  and i.name not like 'PK_%Refact_%'
  and i.type_desc in ('CLUSTERED', 'NONCLUSTERED')
  and (
    (i.type_desc = 'CLUSTERED' and is_unique = 1 and i.name not like 'UC_%')
    or (i.type_desc = 'NONCLUSTERED' and is_unique = 1 and i.name not like 'U__%')
    or (i.type_desc = 'NONCLUSTERED' and is_unique = 0 and i.name not like '___%')
  );

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: Indexes must have names that comply with standards. Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


--------------------------------------------------------------------------------
-- Column rules
-- 1. datetimeoffset columns in tables must be datetimeoffset(0)
-- 2. datetimeoffset columns in TVPs must be datetimeoffset(0)
-- 3. datetimeoffset parameters in procedures and functions must be datetimeoffset(0)
--------------------------------------------------------------------------------
select @ObjectSchema = schema_name(t.schema_id), @ObjectName = concat(t.name, '.', c.name)
from sys.columns c
inner join sys.tables t on c.object_id = t.object_id
inner join sys.types ut on c.user_type_id = ut.user_type_id
where t.is_ms_shipped = 0
  and ut.name = 'datetimeoffset'
  and (
    c.max_length <> 8
    or c.precision <> 26
    or c.scale <> 0
  );

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: All datetimeoffset columns in tables must be datetimeoffset(0). Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


select @ObjectSchema = schema_name(t.schema_id), @ObjectName = concat(t.name, '.', c.name)
from sys.columns c
inner join sys.table_types t on c.object_id = t.type_table_object_id
inner join sys.types ut on c.user_type_id = ut.user_type_id
where ut.name = 'datetimeoffset'
  and (
    c.max_length <> 8
    or c.precision <> 26
    or c.scale <> 0
  );

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: All datetimeoffset columns in TVPs must be datetimeoffset(0). Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


select @ObjectSchema = schema_name(t.schema_id), @ObjectName = concat(t.name, '.', p.name)
from sys.parameters p
inner join sys.types t on p.user_type_id = t.user_type_id
where t.name = 'datetimeoffset'
  and (
    p.max_length <> 8
    or p.precision <> 26
    or p.scale <> 0
  );

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: All datetimeoffset parameters in functions and procedures must be datetimeoffset(0). Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


--------------------------------------------------------------------------------
-- Function rules
-- 1. Function names must end with suffix _fn
--------------------------------------------------------------------------------
select @ObjectSchema = schema_name(schema_id), @ObjectName = name
from sys.objects
where is_ms_shipped = 0
  and type in ('FN', 'IF')
  and name <> 'fn_diagramobjects'
  and name not like '%_fn';

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: All function names must end with suffix ''_fn''. Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;


--------------------------------------------------------------------------------
-- Row versions
-- 1. Each table must have a rowversion column, it must not be nullable, and it
--    must have the name 'RowVersionStamp' unless an exception exists.
--------------------------------------------------------------------------------
declare @RowVersionException table (
  SchemaName sysname not null,
  TableName sysname not null,
  primary key (SchemaName, TableName)
);

insert into @RowVersionException (SchemaName, TableName)
values
  ('dbo', 'Location'), -- Reference data
  ('dbo', 'LocationType'), -- Reference data
  ('dbo', 'MatchType'), -- Reference data
  ('dbo', 'Role'), -- Reference data
  ('dbo', 'ShootingRangeBayNumber'), -- Reference data
  ('dbo', 'Subdivision'), -- Reference data
  ('dbo', 'SubdivisionCategory'); -- Reference data

select @ObjectSchema = schema_name(t.schema_id), @ObjectName = t.name
from sys.tables t
left join sys.columns c on t.object_id = c.object_id and c.name = 'RowVersionStamp'
left join sys.types ut on c.user_type_id = ut.user_type_id
left join @RowVersionException ex on schema_name(t.schema_id) = ex.SchemaName and t.name = ex.TableName
where t.is_ms_shipped = 0
  and t.name <> 'sysdiagrams'
  and t.name <> '__RefactorLog'
  and ex.TableName is null -- No exception exists
  and (
    c.name is null
    or ut.name <> 'timestamp'
    or c.is_nullable = 1
  )
order by schema_name(t.schema_id), t.name;

if @@ROWCOUNT <> 0
begin
  set @Message = formatmessage('Violated design rule: All tables without exemptions must have a ROWVERSION column that is NOT NULL and named ''RowVersionStamp''. Schema: %s - Object: %s', @ObjectSchema, @ObjectName);
  throw 100000, @Message, 1;
end;
