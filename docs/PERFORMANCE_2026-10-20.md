# Performance and content pass — 2026-10-20

## Source limitation / release gate
This checkout contains a minimal four-spot fishing prototype and initially had no
fish definitions, progression/end-game systems, world geometry, Demon World,
Angel World, or basement. `scene_find_entities` initially returned zero entities.
Do not publish this prototype as an update to the deployed game. The existing
`RELEASE_STATUS.md` source/version mismatch remains unresolved.

The following requested edits require the actual source: retiring three fish
from each original rarity, migrating existing collections/loot safely, connecting
Demon/Angel World, and disabling/marking the actual basement entrance. Nothing
was invented or deleted to pretend those systems were present.

## Shipped in this prototype
- `/perf_test [spots=256] [seconds=120] [anglers=32]`, owner/editor only.
  Caps remain 256 spots, 600 seconds, 32 synthetic stationary anglers; duration
  has a 10-second minimum. `/perf_test 0` clears it. Repeating replaces the load.
- Three repeatable stress views: spawn/idle, crowded harbor, far shore. Tests add
  three real dummy clients (four connected clients total) for networking/rig load.
  A chat command cannot spawn real connected players: its 32 anglers are synthetic.
- Synthetic casts and manually fishing fixture spots never grant items, coins,
  or catches. Normal spots are left alone. Automatic expiry destroys all fixtures.
- Fixed angler/spot pairings use cached native proximity results, invalidated when
  a non-null target is destroyed. Empty results are cached too. Cache lifetime is
  the bounded fixture lifetime. Arrays reserve capacity before construction.
  No server-only gameplay, artificial waits, reduced player count, or reduced
  spot count were used to manufacture an improvement.
- Candy Cane Guppy (Christmas) and Pumpkinfin (Halloween), with custom generated
  art, engine inventory items, both Rare, equally catchable year-round. Catch
  payout is 96 Coins instead of a base 100 (exactly 4% lower). There were no
  pre-existing species or fish combat stats to debuff in this checkout.
- Persistent engine inventory/Coins, personal cooldowns (no other player can steal
  your fishing turn), personal rising catch rewards, collection chime, and hotbar.
- Taco landmark at (5,-1) with `COMING SOON?!?!` above it. It has no purchase,
  interaction or collision and does not block the route.

## Measurements
PC, 944x477; same 256 spots, 32 synthetic anglers and three dummy clients.
240 measured frames at each view, after settling. Full raw profiler trees and
frame summaries are under `benchmarks/{before,optimized,final}`.

| Scenario | Original average / p95 | Cache-only average / p95 | Final content average / p95 |
| --- | --- | --- | --- |
| Idle | 2.054 / 5.549 ms | 1.948 / 5.343 ms | 1.660 / 4.025 ms |
| Crowded | 1.908 / 4.770 ms | 2.205 / 6.271 ms | 1.706 / 3.745 ms |
| Far shore | 2.219 / 5.197 ms | 2.191 / 5.284 ms | 1.700 / 3.900 ms |

Whole stress-test frame sample summaries (startup 300 frames discarded):
- Before: average 1.903 ms, p95 4.650 ms (1068 samples).
- Cache-only: average 2.037 ms, p95 5.355 ms (1038 samples).
- Final with content: average 1.622 ms, p95 3.626 ms (1070 samples).

The final run is 14.8% lower average and 22.0% lower p95 than the original,
NOT 50%. The intermediate run regressed, illustrating scheduling/logging noise;
the final run also includes new content, so it is not a controlled attribution
of whole-frame improvement to caching. Do not claim a robust frame-time win from
these single runs. This is local simulation timing, not GPU frame time, a phone
benchmark, or a production remote-server result.

The repeatable local optimization is narrower: steady-state range queries went
from 576–608 per profile window to zero. `Perf_Load::ao_update` total cost fell
from 1.518–1.905 ms per 240-frame window to 0.487–0.689 ms in the cache-only run
(about 64–68% less). Its p95 callback fell from 66–67 microseconds to 6–7.
Before optimization, script plus script-triggered engine work accounted for only
about 1% of the frame. State restoration/memcpy, thread waits, engine logging,
and character updates dominate. More script rewrites cannot plausibly remove
half the total frame cost here. Profile the real full game before further work.

## Validation
All 31 checks passed across `test_seasonal_fishing` (17), `test_perf_cleanup` (9),
and `test_perf_harbor` (5). Covered rarity/value, repeated catches and payout,
personal cooldown, exact taco copy, fixture cap/count, replacement without
stacking, casts/query caching, cleanup/expiry, and no synthetic catch progression.
Compilation and all five project asset validations passed. Walked from spawn to
the taco and fishing spot using real movement; verified catch animation/hotbar
and sign visually. No error-level client/server session logs. Game stopped.

Run again with `run_tests(testName:"test_perf_harbor", device:"pc")`.
Tests that clear player state should only run on disposable local test accounts.
