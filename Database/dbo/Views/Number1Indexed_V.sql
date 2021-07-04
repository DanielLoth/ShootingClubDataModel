create view dbo.Number1Indexed_V
with schemabinding
as
select 1 as Number;
go

create unique clustered index UC_Number1Indexed_V on dbo.Number1Indexed_V (Number);
go
