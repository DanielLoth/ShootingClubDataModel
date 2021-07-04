--------------------------------------------------
-- Transaction misuse messages
--------------------------------------------------
exec sp_addmessage
  @msgnum = 100001,
  @msgtext = N'%s: is a transaction, which is Atomic. It has been called from within an open transaction, which would render it a non-transaction. That is not allowed.',
  @severity = 16,
  @lang = 'us_english',
  @with_log = 'false',
  @replace = 'replace';

exec sp_addmessage
  @msgnum = 100002,
  @msgtext = N'%s: is a utility transaction. It must be called from within a open transaction.',
  @severity = 16,
  @lang = 'us_english',
  @with_log = 'false',
  @replace = 'replace';

--------------------------------------------------
-- Organisation messages
--------------------------------------------------
exec sp_addmessage
  @msgnum = 100100,
  @msgtext = N'%s: Organisation does not exist.',
  @severity = 16,
  @lang = 'us_english',
  @with_log = 'false',
  @replace = 'replace';

--------------------------------------------------
-- Person messages
--------------------------------------------------
exec sp_addmessage
  @msgnum = 100200,
  @msgtext = N'%s: Person does not exist.',
  @severity = 16,
  @lang = 'us_english',
  @with_log = 'false',
  @replace = 'replace';

--------------------------------------------------
-- Visit messages
--------------------------------------------------
exec sp_addmessage
  @msgnum = 100300,
  @msgtext = N'%s: Visit does not exist.',
  @severity = 16,
  @lang = 'us_english',
  @with_log = 'false',
  @replace = 'replace';

exec sp_addmessage
  @msgnum = 100301,
  @msgtext = N'%s: Visit has already been recorded for the given date.',
  @severity = 16,
  @lang = 'us_english',
  @with_log = 'false',
  @replace = 'replace';

go
