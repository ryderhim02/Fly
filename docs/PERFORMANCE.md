# Performance pass

## Admin load test
`/perf_test [spots=128] [seconds=120] [anglers=8]`

Owner/editor only. Caps: 256 spots, 600 seconds, 32 synthetic anglers.
`/perf_test 0` clears it. Re-running replaces the fixture, rather than stacking it.
Synthetic anglers exercise proximity queries and cooldown contention, not real player
networking or character animation. No save or catch-counter changes. This project
has no end-game progression to unlock; this is an oversized fishing-harbor workload.
For networking/rig load also connect friends, or use the editor's
`client_action spawn_dummy_players(count=3)` before measurement.

## Measurements (2026-10-17)
Same 128 spots, 8 synthetic anglers, local client + 3 dummy clients, PC 944x477.
Restarted between original and optimized game; 3 seconds initial settling.
Three 10-second process-CPU samples, one at each camera/player location.
CPU milliseconds consumed per wall-clock second, summed over all four clients:

| Scenario / location | Before clients | After clients | Before server | After server |
| --- | ---: | ---: | ---: | ---: |
| Idle / (0,0) | 169.46 | 105.89 | 24.87 | 42.05 |
| Crowded / (0,7) | 312.92 | 82.48 | 18.68 | 40.47 |
| Far shore / (0,-5) | 121.47 | 42.09 | 15.57 | 31.18 |

Client CPU reductions: 37.5%, 73.6%, 65.4%. Server CPU increased;
these short, noisy process-level samples are NOT proof of a server improvement.
No frame profiler/run_tests tool was exposed in this environment. Consequently
no frame-time, GPU-time, p95, or 50%+ frame-time claim is made. CPU includes
rendering, prediction, waiting behavior and other engine work. Re-run longer
samples on target devices and a real remote server before claiming a latency win.
Raw measurements: `perf-cpu-results.json`. Repeat sampler from the project root:
`powershell -File tools/measure-cpu.ps1 -Label comparison`.

## Changes
- Replaced every dynamic-light marker with an automatically culled static sprite.
- Combined each interaction listener and engine prompt into one component.
- Removed empty global/player per-frame and lifecycle hooks and redundant boat
  permission callback; gameplay remains shared predicted code.
- Fishing counter saturates instead of overflowing into negative values.
- Removed 13,943,873 bytes (13.30 MiB) of unreferenced legacy playercharacter
  assets from res/ao_player. The engine player rig remains in use. Local recovery
  copies are in ignored .ao/unused-assets, not packaged game resources.

## Validation
Compilation and project asset validation passed. Four local clients joined after
asset removal. Fishing increments the catch counter, boat travel reaches (0,-5),
repeated fixture creation stays at 16 test + 4 normal spots, explicit clear and
10-second automatic expiry both return to 4 normal spots. No error-level session
logs during these checks. This is not a guarantee that all possible bugs or remote
join failures are fixed; no production join failure was reproduced.

## Release gate
See RELEASE_STATUS.md: deployed crash stacks reference source absent from this workspace. Do not treat these local checks as a fix for those production crashes.
