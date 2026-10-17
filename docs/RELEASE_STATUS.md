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
