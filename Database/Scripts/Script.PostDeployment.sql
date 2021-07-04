/*
Post-Deployment Script Template
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.
 Use SQLCMD syntax to include a file in the post-deployment script.
 Example:      :r .\myfile.sql
 Use SQLCMD syntax to reference a variable in the post-deployment script.
 Example:      :setvar TableName MyTable
               SELECT * FROM [$(TableName)]
--------------------------------------------------------------------------------------
*/

--------------------------------------------------------------------------------
-- Insert messages into sys.messages
--------------------------------------------------------------------------------
:r .\Messages.sql

--------------------------------------------------------------------------------
-- Run quality enforcement script. This just ensures that names of things are
-- consistent within the database. Also enforces other things, such as the
-- presence of ROWVERSION columns.
--------------------------------------------------------------------------------
:r .\QualityEnforcement.sql

--------------------------------------------------------------------------------
-- Insert role data
--------------------------------------------------------------------------------
:r .\Roles.sql

--------------------------------------------------------------------------------
-- Insert location data
--------------------------------------------------------------------------------
:r .\Locations.sql

--------------------------------------------------------------------------------
-- Insert discipline data
--------------------------------------------------------------------------------
:r .\DisciplineCategories.sql

--------------------------------------------------------------------------------
-- Insert governing body data
--------------------------------------------------------------------------------
:r .\GoverningBodies.sql

--------------------------------------------------------------------------------
-- Insert organisation test data
--------------------------------------------------------------------------------
:r .\OrganisationData.sql
