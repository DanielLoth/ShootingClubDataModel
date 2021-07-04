-- Insert location types
declare @LocationTypes dbo.LocationType;

insert into @LocationTypes (LocationTypeCode, LocationTypeName)
values
  ('C', N'Country'),
  ('S', N'Subdivision');

-- Insert into dbo.Locations type
declare @Countries as dbo.Country;
declare @Subdivisions as dbo.Subdivision;
declare @Locations as dbo.Location;
declare @SubdivisionCategories as dbo.SubdivisionCategory;

insert into @Countries (CountryCode, ShortName)
values
  ('AU', N'Australia');

insert into @SubdivisionCategories (CountryCode, SubdivisionCategoryCode, SubdivisionCategoryName)
values
  ('AU', 'S', N'State'),
  ('AU', 'T', N'Territory');

insert into @Subdivisions (CountryCode, SubdivisionCode, SubdivisionCategoryCode, ShortName)
values
  ('AU', 'ACT', 'T', N'Australian Capital Territory'),
  ('AU', 'NSW', 'S', N'New South Wales'),
  ('AU', 'NT', 'T', N'Northern Territory'),
  ('AU', 'QLD', 'S', N'Queensland'),
  ('AU', 'SA', 'S', N'South Australia'),
  ('AU', 'TAS', 'S', N'Tasmania'),
  ('AU', 'VIC', 'S', N'Victoria'),
  ('AU', 'WA', 'S', N'Western Australia');

declare @ParticipationTypes dbo.ParticipationType;
declare @LocationParticipationTypes dbo.LocationParticipationType;

insert into @ParticipationTypes (ParticipationTypeCode, ParticipationTypeName)
values
  ('E', N'Endorsed competition at another club'),
  ('O', N'Officiating a match'),
  ('S', N'Firearms safety training'),
  ('T', N'Target practice / shooting training');

insert into @LocationParticipationTypes (CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationTypeName)
values
  ('AU', 'NSW', 'E', N'Endorsed competition at another club'),
  ('AU', 'NSW', 'O', N'Officiating a match'),
  ('AU', 'NSW', 'S', N'Firearms safety training'),
  ('AU', 'NSW', 'T', N'Target practice / shooting training');

if (N'$(InsertReferenceData)' = 'True')
begin
  exec dbo.AddLocationTypes_tr @LocationTypes;
  exec dbo.AddLocations_tr @Countries, @Subdivisions, @SubdivisionCategories;
  exec dbo.AddParticipationTypes_tr @ParticipationTypes, @LocationParticipationTypes;
end
