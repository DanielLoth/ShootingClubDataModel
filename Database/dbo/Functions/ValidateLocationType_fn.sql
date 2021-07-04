create function ValidateLocationType_fn(
  @CountryCode char(2),
  @SubdivisionCode char(3),
  @LocationType char(1)
)
returns bit
with schemabinding
as
begin

declare @Result bit = 0;

select @Result = 1
from dbo.Location
where CountryCode = @CountryCode
  and SubdivisionCode = @SubdivisionCode
  and LocationType = @LocationType;

return @Result;

end;
