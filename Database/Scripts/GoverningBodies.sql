declare @GoverningBodies dbo.GoverningBody;
declare @ShooterCohorts dbo.ShooterCohort;
declare @Disciplines dbo.Discipline;
declare @DisciplineOfferings dbo.DisciplineOffering;
declare @Grades dbo.Grade;

insert into @GoverningBodies (GoverningBodyCode, OrganisationName)
values
  ('ISSF', N'International Shooting Sport Federation'),
  ('NRA', N'National Rifle Association'),
  ('PA', N'Pistol Australia'),
  ('PNZ', N'Pistol New Zealand'),
  ('WPPC', N'World Association Precision Pistol Competition 1500');

insert into @ShooterCohorts (GoverningBodyCode, ShooterCohortCode, ShooterCohortName)
values
  -- ISSF
  ('ISSF', 'M', N'Men'),
  ('ISSF', 'W', N'Women'),
  ('ISSF', 'B', N'Junior Men'),
  ('ISSF', 'G', N'Junior Women'),
  -- NRA (Action Pistol)
  ('NRA', 'M', N'Men'),
  ('NRA', 'W', N'Women'),
  ('NRA', 'B', N'Junior Men'),
  ('NRA', 'G', N'Junior Women'),
  -- Pistol Australia
  ('PA', 'M', N'Men'),
  ('PA', 'W', N'Women'),
  ('PA', 'B', N'Junior Men'),
  ('PA', 'G', N'Junior Women'),
  -- WPPC
  ('WPPC', 'M', N'Men'),
  ('WPPC', 'W', N'Women'),
  ('WPPC', 'B', N'Junior Men'),
  ('WPPC', 'G', N'Junior Women');

insert into @Disciplines (GoverningBodyCode, DisciplineCode, DisciplineName, DisciplineCategoryCode)
values
  ('ISSF', 'AP60', N'10m Air Pistol', 'P'),
  ('ISSF', 'FP', N'50m Pistol', 'P'),
  ('ISSF', 'SP', N'25m Pistol', 'P'),
  ('ISSF', 'RFP', N'25m Rapid Fire Pistol', 'P'),
  ('ISSF', 'CFP', N'25m Center Fire Pistol', 'P'),
  ('ISSF', 'STDP', N'25m Standard Pistol', 'P'),
  ('NRA', 'AP', N'Action Pistol', 'P'),
  ('PA', 'SP', N'Service Pistol', 'P'),
  ('PA', 'SU', N'Service Unrestricted', 'P'),
  ('PA', 'S25', N'Service 25 Yard', 'P'),
  ('PA', 'BP25', N'25m Black Powder', 'P'),
  ('PA', 'BP50', N'50m Black Powder', 'P'),
  ('WPPC', 'P150', N'Pistol 1500', 'P'),
  ('WPPC', 'R150', N'Revolver 1500', 'P'),
  ('WPPC', 'DP', N'Distinguished Pistol Match', 'P'),
  ('WPPC', 'DR', N'Distinguished Revolver Match', 'P'),
  ('WPPC', 'OM', N'Open Match', 'P'),
  ('WPPC', 'SR4i', N'Standard Revolver 4" Match', 'P'),
  ('WPPC', 'SR2i', N'Standard Revolver 2.75" Match', 'P');

insert into @DisciplineOfferings (GoverningBodyCode, DisciplineCode, ShooterCohortCode, DisciplineOfferingName)
values
  -- ('', '', '', '', N''),
  ('ISSF', 'AP60', 'M', N'10m Air Pistol Men'),
  ('ISSF', 'AP60', 'W', N'10m Air Pistol Women'),
  ('ISSF', 'AP60', 'B', N'10m Air Pistol Junior (Men)'),
  ('ISSF', 'AP60', 'G', N'10m Air Pistol Junior (Women)'),
  ('ISSF', 'FP', 'M', N'50m Pistol Men'),
  ('ISSF', 'FP', 'B', N'50m Pistol Junior'),
  ('ISSF', 'FP', 'G', N'50m Pistol Junior'),
  ('ISSF', 'SP', 'W', N'25m Pistol Women'),
  ('ISSF', 'SP', 'B', N'25m Pistol Junior'),
  ('ISSF', 'SP', 'G', N'25m Pistol Junior'),
  ('ISSF', 'RFP', 'M', N'25m Rapid Fire Men'),
  ('ISSF', 'RFP', 'B', N'25m Rapid Fire Junior'),
  ('ISSF', 'RFP', 'G', N'25m Rapid Fire Junior'),
  ('ISSF', 'CFP', 'M', N''), -- 25m Center Fire Pistol
  ('ISSF', 'CFP', 'W', N''), -- 25m Center Fire Pistol
  ('ISSF', 'STDP', 'M', N''), -- 25m Standard Pistol
  ('ISSF', 'STDP', 'W', N''), -- 25m Standard Pistol
  ('ISSF', 'STDP', 'B', N'25m Standard Pistol Junior'),
  ('ISSF', 'STDP', 'G', N'25m Standard Pistol Junior'),
  ('NRA', 'AP', 'M', N''),
  ('NRA', 'AP', 'W', N''),
  ('NRA', 'AP', 'B', N''),
  ('NRA', 'AP', 'G', N''),
  ('PA', 'SP', 'M', N''),
  ('PA', 'SP', 'W', N''),
  ('PA', 'SP', 'B', N''),
  ('PA', 'SP', 'G', N''),
  ('PA', 'SU', 'M', N''),
  ('PA', 'SU', 'W', N''),
  ('PA', 'SU', 'B', N''),
  ('PA', 'SU', 'G', N''),
  ('PA', 'S25', 'M', N''),
  ('PA', 'S25', 'W', N''),
  ('PA', 'S25', 'B', N''),
  ('PA', 'S25', 'G', N''),
  ('PA', 'BP25', 'M', N''),
  ('PA', 'BP25', 'W', N''),
  ('PA', 'BP25', 'B', N''),
  ('PA', 'BP25', 'G', N''),
  ('PA', 'BP50', 'M', N''),
  ('PA', 'BP50', 'W', N''),
  ('PA', 'BP50', 'B', N''),
  ('PA', 'BP50', 'G', N''),
  ('WPPC', 'P150', 'M', N''),
  ('WPPC', 'P150', 'W', N''),
  ('WPPC', 'P150', 'B', N''),
  ('WPPC', 'P150', 'G', N''),
  ('WPPC', 'R150', 'M', N''),
  ('WPPC', 'R150', 'W', N''),
  ('WPPC', 'R150', 'B', N''),
  ('WPPC', 'R150', 'G', N'');

insert into @Grades (GoverningBodyCode, DisciplineCode, ShooterCohortCode, GradeCode, GradeName, MinimumScore, DisplayOrder)
values
  -- 10m Air Pistol Men
  ('ISSF', 'AP60', 'M', 'M', N'Master', 575, 100),
  ('ISSF', 'AP60', 'M', 'A', N'A', 560, 200),
  ('ISSF', 'AP60', 'M', 'B', N'B', 540, 300),
  ('ISSF', 'AP60', 'M', 'C', N'C', 500, 400),
  ('ISSF', 'AP60', 'M', 'D', N'D', 0, 500),

  -- 10m Air Pistol Women
  ('ISSF', 'AP60', 'W', 'M', N'Master', 570, 100),
  ('ISSF', 'AP60', 'W', 'A', N'A', 550, 200),
  ('ISSF', 'AP60', 'W', 'B', N'B', 525, 300),
  ('ISSF', 'AP60', 'W', 'C', N'C', 480, 400),
  ('ISSF', 'AP60', 'W', 'D', N'D', 0, 500),

  -- 10m Air Pistol Junior (Men)
  ('ISSF', 'AP60', 'B', 'M', N'Master', 565, 100),
  ('ISSF', 'AP60', 'B', 'A', N'A', 540, 200),
  ('ISSF', 'AP60', 'B', 'B', N'B', 510, 300),
  ('ISSF', 'AP60', 'B', 'C', N'C', 450, 400),
  ('ISSF', 'AP60', 'B', 'D', N'D', 0, 500),

  -- 10m Air Pistol Junior (Women)
  ('ISSF', 'AP60', 'G', 'M', N'Master', 560, 100),
  ('ISSF', 'AP60', 'G', 'A', N'A', 540, 200),
  ('ISSF', 'AP60', 'G', 'B', N'B', 510, 300),
  ('ISSF', 'AP60', 'G', 'C', N'C', 450, 400),
  ('ISSF', 'AP60', 'G', 'D', N'D', 0, 500),

  -- 50m Pistol Men
  ('ISSF', 'FP', 'M', 'M', N'Master', 555, 100),
  ('ISSF', 'FP', 'M', 'A', N'A', 540, 200),
  ('ISSF', 'FP', 'M', 'B', N'B', 510, 300),
  ('ISSF', 'FP', 'M', 'C', N'C', 465, 400),
  ('ISSF', 'FP', 'M', 'D', N'D', 0, 500),

  -- 50m Pistol Junior
  ('ISSF', 'FP', 'B', 'M', N'Master', 545, 100),
  ('ISSF', 'FP', 'B', 'A', N'A', 530, 200),
  ('ISSF', 'FP', 'B', 'B', N'B', 500, 300),
  ('ISSF', 'FP', 'B', 'C', N'C', 450, 400),
  ('ISSF', 'FP', 'B', 'D', N'D', 0, 500),
  ('ISSF', 'FP', 'G', 'M', N'Master', 545, 100),
  ('ISSF', 'FP', 'G', 'A', N'A', 530, 200),
  ('ISSF', 'FP', 'G', 'B', N'B', 500, 300),
  ('ISSF', 'FP', 'G', 'C', N'C', 450, 400),
  ('ISSF', 'FP', 'G', 'D', N'D', 0, 500),

  -- 25m Pistol Women
  ('ISSF', 'SP', 'W', 'M', N'Master', 580, 100),
  ('ISSF', 'SP', 'W', 'A', N'A', 555, 200),
  ('ISSF', 'SP', 'W', 'B', N'B', 520, 300),
  ('ISSF', 'SP', 'W', 'C', N'C', 480, 400),
  ('ISSF', 'SP', 'W', 'D', N'D', 0, 500),

  -- 25m Pistol Junior
  ('ISSF', 'SP', 'B', 'M', N'Master', 580, 100),
  ('ISSF', 'SP', 'B', 'A', N'A', 550, 200),
  ('ISSF', 'SP', 'B', 'B', N'B', 510, 300),
  ('ISSF', 'SP', 'B', 'C', N'C', 465, 400),
  ('ISSF', 'SP', 'B', 'D', N'D', 0, 500),
  ('ISSF', 'SP', 'G', 'M', N'Master', 580, 100),
  ('ISSF', 'SP', 'G', 'A', N'A', 550, 200),
  ('ISSF', 'SP', 'G', 'B', N'B', 510, 300),
  ('ISSF', 'SP', 'G', 'C', N'C', 465, 400),
  ('ISSF', 'SP', 'G', 'D', N'D', 0, 500),

  -- 25m Rapid Fire Men
  ('ISSF', 'RFP', 'M', 'M', N'Master', 575, 100),
  ('ISSF', 'RFP', 'M', 'A', N'A', 560, 200),
  ('ISSF', 'RFP', 'M', 'B', N'B', 525, 300),
  ('ISSF', 'RFP', 'M', 'C', N'C', 470, 400),
  ('ISSF', 'RFP', 'M', 'D', N'D', 0, 500),

  -- 25m Rapid Fire Junior
  ('ISSF', 'RFP', 'B', 'M', N'Master', 565, 100),
  ('ISSF', 'RFP', 'B', 'A', N'A', 545, 200),
  ('ISSF', 'RFP', 'B', 'B', N'B', 515, 300),
  ('ISSF', 'RFP', 'B', 'C', N'C', 460, 400),
  ('ISSF', 'RFP', 'B', 'D', N'D', 0, 500),
  ('ISSF', 'RFP', 'G', 'M', N'Master', 565, 100),
  ('ISSF', 'RFP', 'G', 'A', N'A', 545, 200),
  ('ISSF', 'RFP', 'G', 'B', N'B', 515, 300),
  ('ISSF', 'RFP', 'G', 'C', N'C', 460, 400),
  ('ISSF', 'RFP', 'G', 'D', N'D', 0, 500),

  -- 25m Center Fire Pistol
  ('ISSF', 'CFP', 'M', 'M', N'Master', 583, 100),
  ('ISSF', 'CFP', 'M', 'A', N'A', 565, 200),
  ('ISSF', 'CFP', 'M', 'B', N'B', 540, 300),
  ('ISSF', 'CFP', 'M', 'C', N'C', 500, 400),
  ('ISSF', 'CFP', 'M', 'D', N'D', 0, 500),
  ('ISSF', 'CFP', 'W', 'M', N'Master', 583, 100),
  ('ISSF', 'CFP', 'W', 'A', N'A', 565, 200),
  ('ISSF', 'CFP', 'W', 'B', N'B', 540, 300),
  ('ISSF', 'CFP', 'W', 'C', N'C', 500, 400),
  ('ISSF', 'CFP', 'W', 'D', N'D', 0, 500),

  -- 25m Standard Pistol
  ('ISSF', 'STDP', 'M', 'M', N'Master', 570, 100),
  ('ISSF', 'STDP', 'M', 'A', N'A', 555, 200),
  ('ISSF', 'STDP', 'M', 'B', N'B', 530, 300),
  ('ISSF', 'STDP', 'M', 'C', N'C', 500, 400),
  ('ISSF', 'STDP', 'M', 'D', N'D', 0, 500),
  ('ISSF', 'STDP', 'W', 'M', N'Master', 570, 100),
  ('ISSF', 'STDP', 'W', 'A', N'A', 555, 200),
  ('ISSF', 'STDP', 'W', 'B', N'B', 530, 300),
  ('ISSF', 'STDP', 'W', 'C', N'C', 500, 400),
  ('ISSF', 'STDP', 'W', 'D', N'D', 0, 500),

  -- 25m Standard Pistol Junior
  ('ISSF', 'STDP', 'B', 'M', N'Master', 560, 100),
  ('ISSF', 'STDP', 'B', 'A', N'A', 550, 200),
  ('ISSF', 'STDP', 'B', 'B', N'B', 510, 300),
  ('ISSF', 'STDP', 'B', 'C', N'C', 465, 400),
  ('ISSF', 'STDP', 'B', 'D', N'D', 0, 500),
  ('ISSF', 'STDP', 'G', 'M', N'Master', 560, 100),
  ('ISSF', 'STDP', 'G', 'A', N'A', 550, 200),
  ('ISSF', 'STDP', 'G', 'B', N'B', 510, 300),
  ('ISSF', 'STDP', 'G', 'C', N'C', 465, 400),
  ('ISSF', 'STDP', 'G', 'D', N'D', 0, 500),

  -- 50m Black Powder Men
  ('PA', 'BP50', 'M', 'M', N'Master', 373, 100),
  ('PA', 'BP50', 'M', 'A', N'A', 350, 200),
  ('PA', 'BP50', 'M', 'B', N'B', 320, 300),
  ('PA', 'BP50', 'M', 'C', N'C', 290, 400),
  ('PA', 'BP50', 'M', 'D', N'D', 0, 500),

  -- 50m Black Powder Women
  ('PA', 'BP50', 'W', 'M', N'Master', 373, 100),
  ('PA', 'BP50', 'W', 'A', N'A', 350, 200),
  ('PA', 'BP50', 'W', 'B', N'B', 320, 300),
  ('PA', 'BP50', 'W', 'C', N'C', 290, 400),
  ('PA', 'BP50', 'W', 'D', N'D', 0, 500),

  -- 50m Black Powder Junior Men
  ('PA', 'BP50', 'B', 'M', N'Master', 373, 100),
  ('PA', 'BP50', 'B', 'A', N'A', 350, 200),
  ('PA', 'BP50', 'B', 'B', N'B', 320, 300),
  ('PA', 'BP50', 'B', 'C', N'C', 290, 400),
  ('PA', 'BP50', 'B', 'D', N'D', 0, 500),

  -- 50m Black Powder Junior Women
  ('PA', 'BP50', 'G', 'M', N'Master', 373, 100),
  ('PA', 'BP50', 'G', 'A', N'A', 350, 200),
  ('PA', 'BP50', 'G', 'B', N'B', 320, 300),
  ('PA', 'BP50', 'G', 'C', N'C', 290, 400),
  ('PA', 'BP50', 'G', 'D', N'D', 0, 500),

  -- 25m Black Powder Men
  ('PA', 'BP25', 'M', 'M', N'Master', 380, 100),
  ('PA', 'BP25', 'M', 'A', N'A', 360, 200),
  ('PA', 'BP25', 'M', 'B', N'B', 340, 300),
  ('PA', 'BP25', 'M', 'C', N'C', 300, 400),
  ('PA', 'BP25', 'M', 'D', N'D', 0, 500),

  -- 25m Black Powder Women
  ('PA', 'BP25', 'W', 'M', N'Master', 380, 100),
  ('PA', 'BP25', 'W', 'A', N'A', 360, 200),
  ('PA', 'BP25', 'W', 'B', N'B', 340, 300),
  ('PA', 'BP25', 'W', 'C', N'C', 300, 400),
  ('PA', 'BP25', 'W', 'D', N'D', 0, 500),

  -- 25m Black Powder Junior Men
  ('PA', 'BP25', 'B', 'M', N'Master', 380, 100),
  ('PA', 'BP25', 'B', 'A', N'A', 360, 200),
  ('PA', 'BP25', 'B', 'B', N'B', 340, 300),
  ('PA', 'BP25', 'B', 'C', N'C', 300, 400),
  ('PA', 'BP25', 'B', 'D', N'D', 0, 500),

  -- 25m Black Powder Junior Women
  ('PA', 'BP25', 'G', 'M', N'Master', 380, 100),
  ('PA', 'BP25', 'G', 'A', N'A', 360, 200),
  ('PA', 'BP25', 'G', 'B', N'B', 340, 300),
  ('PA', 'BP25', 'G', 'C', N'C', 300, 400),
  ('PA', 'BP25', 'G', 'D', N'D', 0, 500),

  -- Service Pistol Men
  ('PA', 'SP', 'M', 'M', N'Master', 870, 100),
  ('PA', 'SP', 'M', 'A', N'A', 850, 200),
  ('PA', 'SP', 'M', 'B', N'B', 800, 300),
  ('PA', 'SP', 'M', 'C', N'C', 750, 400),
  ('PA', 'SP', 'M', 'D', N'D', 0, 500),

  -- Service Pistol Women
  ('PA', 'SP', 'W', 'M', N'Master', 870, 100),
  ('PA', 'SP', 'W', 'A', N'A', 850, 200),
  ('PA', 'SP', 'W', 'B', N'B', 800, 300),
  ('PA', 'SP', 'W', 'C', N'C', 750, 400),
  ('PA', 'SP', 'W', 'D', N'D', 0, 500),

  -- Service Pistol Junior Men
  ('PA', 'SP', 'B', 'M', N'Master', 870, 100),
  ('PA', 'SP', 'B', 'A', N'A', 850, 200),
  ('PA', 'SP', 'B', 'B', N'B', 800, 300),
  ('PA', 'SP', 'B', 'C', N'C', 750, 400),
  ('PA', 'SP', 'B', 'D', N'D', 0, 500),

  -- Service Pistol Junior Women
  ('PA', 'SP', 'G', 'M', N'Master', 870, 100),
  ('PA', 'SP', 'G', 'A', N'A', 850, 200),
  ('PA', 'SP', 'G', 'B', N'B', 800, 300),
  ('PA', 'SP', 'G', 'C', N'C', 750, 400),
  ('PA', 'SP', 'G', 'D', N'D', 0, 500),

  -- Service Unrestricted Men
  ('PA', 'SU', 'M', 'M', N'Master', 885, 100),
  ('PA', 'SU', 'M', 'A', N'A', 870, 200),
  ('PA', 'SU', 'M', 'B', N'B', 840, 300),
  ('PA', 'SU', 'M', 'C', N'C', 800, 400),
  ('PA', 'SU', 'M', 'D', N'D', 0, 500),

  -- Service Unrestricted Women
  ('PA', 'SU', 'W', 'M', N'Master', 885, 100),
  ('PA', 'SU', 'W', 'A', N'A', 870, 200),
  ('PA', 'SU', 'W', 'B', N'B', 840, 300),
  ('PA', 'SU', 'W', 'C', N'C', 800, 400),
  ('PA', 'SU', 'W', 'D', N'D', 0, 500),

  -- Service Unrestricted Junior men
  ('PA', 'SU', 'B', 'M', N'Master', 885, 100),
  ('PA', 'SU', 'B', 'A', N'A', 870, 200),
  ('PA', 'SU', 'B', 'B', N'B', 840, 300),
  ('PA', 'SU', 'B', 'C', N'C', 800, 400),
  ('PA', 'SU', 'B', 'D', N'D', 0, 500),

  -- Service Unrestricted Junior women
  ('PA', 'SU', 'G', 'M', N'Master', 885, 100),
  ('PA', 'SU', 'G', 'A', N'A', 870, 200),
  ('PA', 'SU', 'G', 'B', N'B', 840, 300),
  ('PA', 'SU', 'G', 'C', N'C', 800, 400),
  ('PA', 'SU', 'G', 'D', N'D', 0, 500),

  -- Service 25 Yard Men
  ('PA', 'S25', 'M', 'M', N'Master', 630, 100),
  ('PA', 'S25', 'M', 'A', N'A', 605, 200),
  ('PA', 'S25', 'M', 'B', N'B', 565, 300),
  ('PA', 'S25', 'M', 'C', N'C', 515, 400),
  ('PA', 'S25', 'M', 'D', N'D', 0, 500),

  -- Service 25 Yard Women
  ('PA', 'S25', 'W', 'M', N'Master', 630, 100),
  ('PA', 'S25', 'W', 'A', N'A', 605, 200),
  ('PA', 'S25', 'W', 'B', N'B', 565, 300),
  ('PA', 'S25', 'W', 'C', N'C', 515, 400),
  ('PA', 'S25', 'W', 'D', N'D', 0, 500),

  -- Service 25 Yard Junior Men
  ('PA', 'S25', 'B', 'M', N'Master', 630, 100),
  ('PA', 'S25', 'B', 'A', N'A', 605, 200),
  ('PA', 'S25', 'B', 'B', N'B', 565, 300),
  ('PA', 'S25', 'B', 'C', N'C', 515, 400),
  ('PA', 'S25', 'B', 'D', N'D', 0, 500),

  -- Service 25 Yard Junior women
  ('PA', 'S25', 'G', 'M', N'Master', 630, 100),
  ('PA', 'S25', 'G', 'A', N'A', 605, 200),
  ('PA', 'S25', 'G', 'B', N'B', 565, 300),
  ('PA', 'S25', 'G', 'C', N'C', 515, 400),
  ('PA', 'S25', 'G', 'D', N'D', 0, 500),

  -- Action Pistol Men
  ('NRA', 'AP', 'M', 'SHM', N'Super High Master', 1916, 100),
  ('NRA', 'AP', 'M', 'HM', N'High Master', 1900, 200),
  ('NRA', 'AP', 'M', 'MS', N'Master', 1844, 300),
  ('NRA', 'AP', 'M', 'EX', N'Expert', 1728, 400),
  ('NRA', 'AP', 'M', 'SS', N'Sharp Shooter', 1536, 500),
  ('NRA', 'AP', 'M', 'MK', N'Marksman', 0, 600),

  -- Action Pistol Women
  ('NRA', 'AP', 'W', 'SHM', N'Super High Master', 1916, 100),
  ('NRA', 'AP', 'W', 'HM', N'High Master', 1900, 200),
  ('NRA', 'AP', 'W', 'MS', N'Master', 1844, 300),
  ('NRA', 'AP', 'W', 'EX', N'Expert', 1728, 400),
  ('NRA', 'AP', 'W', 'SS', N'Sharp Shooter', 1536, 500),
  ('NRA', 'AP', 'W', 'MK', N'Marksman', 0, 600),

  -- Action Pistol Junior (Men)
  ('NRA', 'AP', 'B', 'SHM', N'Super High Master', 1916, 100),
  ('NRA', 'AP', 'B', 'HM', N'High Master', 1900, 200),
  ('NRA', 'AP', 'B', 'MS', N'Master', 1844, 300),
  ('NRA', 'AP', 'B', 'EX', N'Expert', 1728, 400),
  ('NRA', 'AP', 'B', 'SS', N'Sharp Shooter', 1536, 500),
  ('NRA', 'AP', 'B', 'MK', N'Marksman', 0, 600),

  -- Action Pistol Junior (Women)
  ('NRA', 'AP', 'G', 'SHM', N'Super High Master', 1916, 100),
  ('NRA', 'AP', 'G', 'HM', N'High Master', 1900, 200),
  ('NRA', 'AP', 'G', 'MS', N'Master', 1844, 300),
  ('NRA', 'AP', 'G', 'EX', N'Expert', 1728, 400),
  ('NRA', 'AP', 'G', 'SS', N'Sharp Shooter', 1536, 500),
  ('NRA', 'AP', 'G', 'MK', N'Marksman', 0, 600),

  -- WA1500 Match Pistol Men
  ('WPPC', 'P150', 'M', 'HM', N'High Master', 1476, 100),
  ('WPPC', 'P150', 'M', 'MS', N'Master', 1440, 200),
  ('WPPC', 'P150', 'M', 'EX', N'Expert', 1380, 300),
  ('WPPC', 'P150', 'M', 'SS', N'Sharp Shooter', 1290, 400),
  ('WPPC', 'P150', 'M', 'MK', N'Marksman', 0, 500),

  -- WA1500 Match Pistol Women
  ('WPPC', 'P150', 'W', 'HM', N'High Master', 1476, 100),
  ('WPPC', 'P150', 'W', 'MS', N'Master', 1440, 200),
  ('WPPC', 'P150', 'W', 'EX', N'Expert', 1380, 300),
  ('WPPC', 'P150', 'W', 'SS', N'Sharp Shooter', 1290, 400),
  ('WPPC', 'P150', 'W', 'MK', N'Marksman', 0, 500),

  -- WA1500 Match Pistol Junior Men
  ('WPPC', 'P150', 'B', 'HM', N'High Master', 1476, 100),
  ('WPPC', 'P150', 'B', 'MS', N'Master', 1440, 200),
  ('WPPC', 'P150', 'B', 'EX', N'Expert', 1380, 300),
  ('WPPC', 'P150', 'B', 'SS', N'Sharp Shooter', 1290, 400),
  ('WPPC', 'P150', 'B', 'MK', N'Marksman', 0, 500),

  -- WA1500 Match Pistol Junior Women
  ('WPPC', 'P150', 'G', 'HM', N'High Master', 1476, 100),
  ('WPPC', 'P150', 'G', 'MS', N'Master', 1440, 200),
  ('WPPC', 'P150', 'G', 'EX', N'Expert', 1380, 300),
  ('WPPC', 'P150', 'G', 'SS', N'Sharp Shooter', 1290, 400),
  ('WPPC', 'P150', 'G', 'MK', N'Marksman', 0, 500),

  -- WA1500 Match Revolver Men
  ('WPPC', 'R150', 'M', 'HM', N'High Master', 1476, 100),
  ('WPPC', 'R150', 'M', 'MS', N'Master', 1440, 200),
  ('WPPC', 'R150', 'M', 'EX', N'Expert', 1380, 300),
  ('WPPC', 'R150', 'M', 'SS', N'Sharp Shooter', 1290, 400),
  ('WPPC', 'R150', 'M', 'MK', N'Marksman', 0, 500),

  -- WA1500 Match Revolver Women
  ('WPPC', 'R150', 'W', 'HM', N'High Master', 1476, 100),
  ('WPPC', 'R150', 'W', 'MS', N'Master', 1440, 200),
  ('WPPC', 'R150', 'W', 'EX', N'Expert', 1380, 300),
  ('WPPC', 'R150', 'W', 'SS', N'Sharp Shooter', 1290, 400),
  ('WPPC', 'R150', 'W', 'MK', N'Marksman', 0, 500),

  -- WA1500 Match Revolver Junior Men
  ('WPPC', 'R150', 'B', 'HM', N'High Master', 1476, 100),
  ('WPPC', 'R150', 'B', 'MS', N'Master', 1440, 200),
  ('WPPC', 'R150', 'B', 'EX', N'Expert', 1380, 300),
  ('WPPC', 'R150', 'B', 'SS', N'Sharp Shooter', 1290, 400),
  ('WPPC', 'R150', 'B', 'MK', N'Marksman', 0, 500),

  -- WA1500 Match Revolver Junior Women
  ('WPPC', 'R150', 'G', 'HM', N'High Master', 1476, 100),
  ('WPPC', 'R150', 'G', 'MS', N'Master', 1440, 200),
  ('WPPC', 'R150', 'G', 'EX', N'Expert', 1380, 300),
  ('WPPC', 'R150', 'G', 'SS', N'Sharp Shooter', 1290, 400),
  ('WPPC', 'R150', 'G', 'MK', N'Marksman', 0, 500);

if (N'$(InsertReferenceData)' = 'True')
begin
  exec dbo.AddGoverningBodies_tr @GoverningBodies, @Disciplines, @ShooterCohorts, @DisciplineOfferings, @Grades;
end
