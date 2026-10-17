# Sunlit Shores — focused fishing polish
A quiet multiplayer fishing harbor inspired by Fisch's catch/sell/upgrade loop. This supplied project had no catalog to remove: keep exactly one common, rare, epic, legendary and mythic fish, plus two admin exclusives. No ambient fish simulations or per-fish update loops.

Seconds: hold to reel at any of four pier stations, splash, burst, illustrated catch reveal. Minutes: sell catches and buy a better rod. Long term: eight persistent rod upgrades and rare fish collection. Admin exclusives never roll naturally or sell for currency.

Five fish: Silverfin (12), Jade Perch (35), Prism Ray (100), Golden Clown (400), Astral Guardian (1600). Base chances: 60%,25%,10%,4%,1%. Rod upgrades move chance toward higher rarities. Prices: 75,200,500,1200,3000,7500,18000,45000. Start at 0 coins, free unlimited fishing. First rod costs about four typical catches (expected base catch value 62). This is a compact session loop, not a claim of weeks of content.

Multiplayer: per-player inventory, RNG, cooldown and progression; four shared stations don't lock out other fishers. Inventory, currency and rods persist through engine APIs. Static scenery, three palms, two terrain surfaces, one pier. Navmesh keeps players on shore/pier.

First minute: spawn beside a reachable fishing marker, managed cue prompts first catch, sell button unlocks, currency pop-up and chime. Admin commands `/admin`, `/sanic`, `/dr_egg_man` restricted to owner/editor. Admin UI rechecks permission on grant.
