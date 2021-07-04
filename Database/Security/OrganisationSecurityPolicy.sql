---- This security policy is code-generated. Refer to CodeGenSecurityPolicy.sql
--create security policy dbo.OrganisationSecurityPolicy
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.Visit,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Visit after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Visit after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.Competition,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Competition after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Competition after update,
--  --add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.Competitor,
--  --add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Competitor after insert,
--  --add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Competitor after update,
--  --add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.InformalScore,
--  --add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.InformalScore after insert,
--  --add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.InformalScore after update,
--  --add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.Match,
--  --add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Match after insert,
--  --add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Match after update,
--  --add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.MatchCompetitor,
--  --add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.MatchCompetitor after insert,
--  --add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.MatchCompetitor after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.Organisation,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Organisation after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Organisation after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.OrganisationUser,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.OrganisationUser after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.OrganisationUser after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.OrganisationUserRole,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.OrganisationUserRole after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.OrganisationUserRole after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.Participation,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Participation after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Participation after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.Person,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Person after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.Person after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.PersonEmail,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.PersonEmail after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.PersonEmail after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.PersonSchedule,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.PersonSchedule after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.PersonSchedule after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.PersonScheduleItem,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.PersonScheduleItem after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.PersonScheduleItem after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.ShootingRange,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.ShootingRange after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.ShootingRange after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.ShootingRangeBay,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.ShootingRangeBay after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.ShootingRangeBay after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.ShootingRangeSchedule,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.ShootingRangeSchedule after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.ShootingRangeSchedule after update,
--  add filter predicate dbo.SecurityReadPredicate_fn(OrganisationId) on dbo.ShootingRangeScheduleItem,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.ShootingRangeScheduleItem after insert,
--  add block predicate dbo.SecurityWritePredicate_fn(OrganisationId) on dbo.ShootingRangeScheduleItem after update
--with (state = on, schemabinding = on);
