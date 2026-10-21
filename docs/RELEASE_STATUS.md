# Release status: BLOCKED

## Requested content update (2026-10-21)

Implemented locally: a mobile-safe Coming soon screen button and a chef NPC
with a taco display. Both open a closeable preview; neither sells, charges,
or grants anything. Compilation, UIDoc viewport diagnostics, phone-client
button open/close, walking to the vendor, and vendor interaction passed.

Still blocked: Juice WRLD at 1yyy/s, mutation buffs with Christmas best at
15x, and three displayed one-use fish reward codes with rarity-weighted
index draws. This prototype contains no fish definitions/index, mutation
system, passive-income system, or codes/reward persistence to modify.
Load the correct game's source before implementing or publishing those changes.
The preview additions do not resolve the source/version release gate below.

Recovery check: inspected all four commits in the local Git branch and its
Flyin tag. No historical scripts define Juice WRLD, mutations, Christmas,
fish-index rewards, or code redemption. Those systems cannot be recovered
from the available local project history. No checkout or source replacement
was performed.

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
