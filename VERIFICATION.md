# Verification

- Core cast → saved native inventory → fishmonger sale → first rod → shore collision: 20 passing checks, including a three-player session.
- Halloween portal, candy, community harvest, Snap replicas, random event/luck/mutation, cleanup and realm closure: 20 passing checks.
- Eternal purchase, research, Halloween rewards/companion, ascension, retained upgrades, mythic pity and passive income: 26 passing checks.
- Reopened live client: ascension, research, ghost companion, fish item and 38-slot inventory restored correctly; the +14 migration was not repeated.
- PC and iPhone SE live screenshots inspected; UIDoc viewport diagnostics clean. Core and Halloween/Snap suites also pass all 40 checks on iPhone SE. Final late-progression rerun passes all 26 checks.
- Fresh-eyes world review implemented: purposeful branching trails, solid service footprints, blue ghosts, distinct haunted landmark, clear return points.
- Asset validation clean. Session warnings/errors clean after gameplay checks.

Editor-only `/harbor_test_setup` supports deterministic integration fixtures and explicitly refuses published sessions. Published admin actions use native owner/editor permissions; editor sessions use the built-in test context.


Fresh-start validation: 9 additional checks pass for zero debug currencies, the starter rod, exact 24-to-38 bag expansion, all ten fishing locations, and both COMING SOON signs. Final editor test save left at a fresh start.
