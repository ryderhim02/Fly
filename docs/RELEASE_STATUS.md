# Release status: BLOCKED

The local fishing prototype compiles and passes local interaction/join checks,
but is NOT verified as the source of the deployed game. Do not publish this
workspace as a repair for the live game until the source/version is reconciled.

Production error query on 2026-10-17 (2-day lookback) reports:
- 25 invalid Item_Instance -> Brainrot_Item casts, stack:
  perf_commands.csl:3 bay_perf_remove_items -> player.csl:224 ao_start.
- 3 client allocation/panic reports, stack:
  admin_panel.csl:44 bay_admin_rows -> ui.csl:229 draw_bay_rows ->
  ui.csl:210 draw_bay_panel -> player.csl:433 ao_late_update.

None of those systems exists in this workspace. Here player.csl only declares
fish_caught. Local ao.project lists game 6ac81537f01a391b7e774f43, while bootstrap
metadata references 6ad3eac4f6032675dd49ab35. Production query reports game
6ac81537f01a391b7e774f43 and latest version 6ad3e6fba48d3f59d8e297fd.

Required: load the deployed game's correct source/version, then inspect item
runtime types before downcasts and profile/cache the admin row-building path.
Those are investigation directions, not verified fixes for the absent code.

Additional local fixes in this pass:
- Static markers render on layer 0, above the default ground.
- Synthetic anglers only change explicitly marked fixture spots; normal spots
  remain unaffected even when the fixture has fewer spots than anglers.
- CPU sampler defaults to three 30-second samples instead of one short sample.
  Earlier benchmark numbers remain historical, not new measurements.

2026-10-20: source mismatch still blocks deployment. Added only prototype seasonal
fish/content and repeatable frame profiling. See PERFORMANCE_2026-10-20.md. The
requested original-species removals, world merge, and basement closure remain
blocked on loading the actual source. Passing local tests does not resolve this.

## Release recheck after publish-readiness request (2026-10-20)
Status remains BLOCKED; this is not a planning-only status.

Recovery investigation:
- GitHub repository ryderhim02/Fly has main and
  cloud-build/6ad7c21e5e79917b0da8f573 at the same commit,
  5e0afbea07647370a1eb6211766cbbdad04771d0.
- All four commits were inspected. Earlier script trees contain only a small
  main.csl prototype, not the production fish/Brainrot/world systems.
- Current bootstrap metadata identifies game 6ad7c21e5e79917b0da8f573;
  ao.project still identifies 6ac81537f01a391b7e774f43. IDs were NOT silently
  rewritten, and no branch was restored over the user's current work.
- No MCP source-recovery resources or templates are exposed.
- Fresh production logs for the ao.project game report latest version
  6ad6d0312117e45f46a92f3f (2026-10-20T02:21:43.168Z), with five invalid
  Item_Instance -> Brainrot_Item casts between 19:27:33 and 19:30:33 UTC.
  Current crash path: brainrot_view.csl:70 refresh_for -> player.csl:931
  rebuild_views -> player.csl:357 ao_update. None of this code exists here.

Required owner action: open/export the actual source for the intended live game,
including fish definitions, player systems, world scene/assets and save schema.
The missing features and production type-cast crash must be fixed and tested in
that source before publication. Do not reconstruct unknown save migrations or
substitute a new prototype for the live game's existing collections.

Additional recovery check: the repository owner's public repository listing exposes
only Fly, whose description is a /fly command for Life Together. No alternate
public fishing-game project is available from that account. The intended source
cannot be recovered through the exposed repository, branches, history, MCP
resources, or public account repositories. Further feature edits against the
production game's missing schema require owner-provided source, not more local
prototype changes or repeated tests.
