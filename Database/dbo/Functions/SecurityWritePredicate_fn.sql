create function SecurityWritePredicate_fn(@OrganisationId int)
returns table
with schemabinding
as
return
select 1 as Result
where
  (
    convert(int, session_context(N'OrgId')) = @OrganisationId
    or session_context(N'OrgId') is null
  )
  and (
    convert(bit, session_context(N'IsUser')) = 1
    or session_context(N'IsUser') is null
  );
