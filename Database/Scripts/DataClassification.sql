-- Defunct. Must use 'sp_addextendedproperty' explicitly.
-- Otherwise SqlDeploy tool, when deploying DACPAC, will drop and re-create rather than recognise the presence of existing extended properties.

--exec dbo.AddClassificationLabel_internal_tr N'dbo', N'PersonEmail', N'Email', N'Contact Info', N'Confidential';
--exec dbo.AddClassificationLabel_internal_tr N'dbo', N'Registrant_Email', N'Email', N'Contact Info', N'Confidential';
--exec dbo.AddClassificationLabel_internal_tr N'dbo', N'Registrant_FullName', N'FullName', N'Name', N'Confidential - GDPR';
--exec dbo.AddClassificationLabel_internal_tr N'dbo', N'Registrant_Password', N'PasswordHash', N'Credentials', N'Confidential';
--exec dbo.AddClassificationLabel_internal_tr N'dbo', N'ReplacementEmail', N'NewEmail', N'Contact Info', N'Confidential';
