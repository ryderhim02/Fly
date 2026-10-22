# Dreamtide — fishing, collections & Halloween 2.0

The supplied project is a four-spot fishing scaffold, not an existing economy: preserve hold-to-cast and free movement; build persistent depth rather than replacing the loop.
Comparable: Fisch's rod/bestiary ladder (https://fisch.wiki/wiki/fishing-rods/) combines cash, collection and level requirements. Here keep reachable short goals alongside long-term mastery, without copying its live balance.

## Three loops
- Seconds: approach animated pond, hold to cast, reveal a weighted fish/mutation/weight, store it in the native inventory. Personal cooldown eliminates shared-spot griefing.
- Minutes: sell, upgrade a rod, complete a rotating three-part contract, discover a fish, buy research or sail to the Reef.
- Hours: 10 rods beyond Driftwood, 40 research ranks, 72 fish/mutation discoveries, 2,500+ catch mastery, permanent ascensions, six passive brainrots, recurring Halloween rewards.

## World & content
Harbor: four original fishing coordinates, fishmonger, tackle merchant, research station, Reef boat. Taco chef at a seaside kiosk and a locked basement explicitly say COMING SOON; neither charges players.
Sunken Reef: rod 2 access, improved rarity, return boat, 3 ponds, nautical trees and treasure.
Hollowmere: Halloween event realm, 3 haunted ponds, ghosts, scarecrows, pumpkin portal, candles, dead trees, community harvest meter. Free portal access while Halloween is active. Safely return anglers on event expiry.
Fish tiers (old + one new each): Common Minnow/Bubble Guppy, Uncommon Clownfish/Lantern Perch, Rare Chillfin/Moonveil Koi, Epic Blobfish/Phantom Ray, Legendary Pumpkin Angler/Sun King Marlin, Mythic Circuit Carp/Eclipse Leviathan. Mutations: Natural, Gilded, Aurora, Haunted, Cosmic, Eclipse.
Rods: Driftwood starter; Copper, Tideglass, Reefcaller, Sunforge, Stormweaver, Aurora, Ghostline, Harvest Reaper, Voidwake, Eternal. Bespoke fish and rod icons generated in matching styles. Mechanical perks stack: speed, luck, twin catches, gilded chance, event luck, mastery, candy, pity, mutation and value.
Brainrots: Banana Dolphin, Chef Crab, Chimera, Cactus Cowboy, Dragon Mascot, Juice WRLD; unlock through catch milestones. All original baseline rates multiply by 0.97; Juice WRLD has a 1 zzz/s baseline before that universal debuff (final 0.970 zzz/s). Zzz represented in 1/1000 units in Economy, spent on permanent research. No paid currency.

## Economy
Start: free Driftwood, zero coins, native restored bag plus exactly 14 slots, once per player (new bags: 24 → 38; larger existing bags preserved and expanded). No stamina or consumable cost; always a recovery path.
Rod prices: 180 / 600 / 1,800 / 4,800 / 12,500 / 32,000 / 85,000 / 220,000 / 600,000 / 1,800,000. Lifetime catch requirements: 6 / 18 / 45 / 90 / 160 / 280 / 450 / 700 / 1,050 / 1,600. Catch value starts 12–900 before rarity, weight, mutation, rod and permanent bonuses. First upgrade ~30–60 seconds; first 10 minutes add Reef access, contracts and research. Late-game rods require hours of casts and income scaling.
Four research tracks, 10 ranks each: Baitcraft, Swift Reel, Merchant's Eye, Mutation Lantern. Each costs 250 * 2^rank coins, also 1 + rank zzz. Halloween: Lantern (50 candy), Ghost Companion (150), Harvest Blessing ranks (100 * (rank+1)).
Contracts repeat and scale, award coins and candy; discoveries pay once; every 12 mutation variants adds a permanent 4% luck and a growing coin reward. Ascension requires Eternal, 2,500 * (rank+1) lifetime catches, and 1,000,000 * (rank+1) coins; resets rod only, preserves collections/research/brainrots and grants +15% value/+8% luck per rank.
Events automatically rotate every 5 minutes for 2 minutes; Halloween every third event. Admin Snap walks a giant avatar replica through the harbor, animates a snap, then rolls event, 2–8x luck and a featured mutation. Permission checks protect both UI and handler, cooldown prevents overlap.

## Multiplayer & first minute
World events and community meter shared; inventory, coins, progression, tutorial and casting cooldown personal. Synced state executes on clients/server, no gameplay server gates. Late-join event state is stored on a scene component. Native saves and inventory preserve progression.
Spawn facing the four ponds. Managed tutorial: catch once → sell once → finish. A catch reveal with art/sound, a clear sell target and a visible next-rod goal provide immediate direction without a wall of instructions.

