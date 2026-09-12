// Gunstar Super Heroes
// #ID = 5077

function menuResults() => word(0x001A7C)
function resultsScreenPageGamestate() => byte(0x001B30)

playerLookup = {
    0x2: "Red",
    0x3: "Blue",
}
function roomCasino() => word(0x00A7B0)
function weaponUsed() => byte(0x02C800)
function playersHealthMaxIs960() => word(0x02C802)
function firstPartOfMemoryForScore() => dword(0x02C828)
function timerInGame() => byte(0x02C82C)
function timerInGameWord() => word(0x02C82C)
function worldRoomId() => word(0x02CB70)
function world() => byte(0x02CB71)

worldLookup = {
    0x0: "Earth",
    0x1: "Moon 1",
    0x2: "Moon 2",
    0x3: "Moon 3",
    0x4: "Moon 4",
    0x5: "Moon 5",
    0x6: "G-Arc",
}
function easy() => byte(0x02DC84)
function easyWord() => word(0x02DC84)

diffLookup = {
    0x1: "Easy Mode",
    0x2: "Normal Mode",
    0x3: "Normal Mode",
    0x4: "Hard Mode",
    0x5: "Hard Mode",
}
function redsAnimations() => byte(0x02E9C0)
function redsAnimationsWord() => word(0x02E9C0)
function orangeBoss2HealthMaxIsH64() => word(0x031222)
function weaponEnergyFull() => byte(0x031228)
function bossHealthIsVisible() => byte(0x03122B)
function superWeaponActive() => byte(0x031310)
function xcoordinate() => word(0x032E7E)
function ycoordinateInverted() => word(0x032E82)
function room() => word(0x03348A)


// New notes

/* [16-bit] Pointer
+0x00: [8-bit] Boss Actions
-- Earth Boss --
0x00= Not Spawned
0x01= Spawning
0x02= Normal
0x03= Slamming Ship
0x04= Shaking Left Hand
0x05= Shaking Right Hand
0x06= Becoming Enraged
0x07= Enraged Normal
0x08= Enraged Blasting
0x09= Enraged Slamming Fists
-- Super Gondola --
0x00= Still
0x10= Moving Slowly Left
0x20= Moving Slowly Right
0xf0= End
0x4e= Starting
+0x3a: [16-bit] Earth Boss Left Arm Health
+0x3c: [16-bit] Earth Boss Right Arm Health
+0xa6: [8-bit] Moon 1 Chicks Currently Held
*/

// Difficulty Check
Normal = 0
Hard = 1
function difficulty(diff) {
    if (diff == Normal) { return byte(0x2dc84) >= 2 }
    else { return byte(0x2dc84) >= 4 }
}

// Room Check
function room() => word(0x02CB70)

// Pointers & Related Functions
function healthPtr() => word(word(0x0312d4) +0x162)
function healthCalc(num) =>  num * 16 - 15
function timesBlackHit() => byte(word(0x33a84) + 0x06)
function boardTileOn() => byte(word(0x341d0) + 0x101)
function birdsSaved() => byte(word(0x341d0) + 0x20)
function bossAction() => word(word(0x341e0) + 0x00)
function birdsHeld() => byte(word(0x341e0) + 0xa6)

// Other Needed Functions
function bossHealth() => word(0x31222)
function timer() => word(0x2c82c)
function timerCalc(num) => (num / 60) - 1

// More Complex Functions
function damageless() => never(prev(healthPtr()) > healthPtr())
function bossDamageless() => prev(resultsScreenPageGamestate()) == 0 && resultsScreenPageGamestate() == 1

/*
[Array] [28 Byte Struct] Statistics
|0x00: [32-bit] Area Score
|0x04: [32-bit] Area Time
|0x08: [32-bit] Area Health

0: Earth Full Stage
1: Earth Area 2
2: Earth Area 3
3: Moon 1 Full Stage
4: Moon 1 Area 2
5: Moon 1 Area 3
6: Moon 1 Area 4
7: Moon 1 Area 5
8: Moon 2 Full Stage
9: Moon 2 Area 2
10: Moon 3 Full Stage
11: Moon 3 Area 2
12: Moon 4 Full Stage
13: Moon 4 Area 2
14: Moon 5 Full Stage
15: Moon 5 Area 2
16: Moon 5 Area 3
17: G-Arc Full Stage
18: G-Arc Area 2
*/

// Stat Savedata Parsing
Score = 0
Time = 1
Health = 2
function partComplete(part) {
    base = 0x02c83c + (28 * part)
    loc = base + 4
    return prev(dword(loc)) == 0 && dword(loc) != 0
}

achievement(
    title = "Secrets of the World", points = 3,
    description = "Find a hidden room on Earth.",
    trigger = difficulty(Normal) && worldRoomId() == 2 && ycoordinateInverted() <= 603 && prev(xcoordinate()) <= 274 &&
              xcoordinate() >= 275
)

achievement(
    title = "She's Not Your Plaything!", points = 5,
    description = "Free Yellow from the clutches of the boss of Earth before killing it.",
    trigger = difficulty(Normal) && worldRoomId() == 0 &&  bossHealthIsVisible() == 1 && prev(bossAction()) == 6 && bossAction() == 7
)

achievement(
    title = "Ending the Terra", points = 5, type="progression",
    description = "Defeat the boss and clear Earth. All achievements require Normal difficulty or higher.",
    trigger = difficulty(Normal) && worldRoomId() == 0 && partComplete(2)
)

achievement(
    title = "The Bot Stops Here!", points = 10,
    description = "Defeat the boss of Earth without taking damage.",
    trigger = difficulty(Normal) && never(worldRoomId() != 0) && once(prev(xcoordinate()) < 530 && xcoordinate() >= 530) && 
    bossDamageless() && damageless()
)

achievement(
    title = "Superheroic Speedster on Earth", points = 5,
    description = "Clear Earth in 2:15 or less.",
    trigger = easy() >= 2 && worldRoomId() == 0 && word(tbyte(0x0312D4) + 0x162) != 0 &&
              prev(resultsScreenPageGamestate()) == 0 && resultsScreenPageGamestate() == 1 && timerInGameWord() <= 8158
)

// Ticket 93020: Triggered on loading a save from which I had already cleared Moon 1.
achievement(
    title = "Happily Forever After Burner", points = 10,
    description = "Clear the first area of Moon 1 without taking damage.",
    trigger = difficulty(Normal) &&
              once(worldRoomId() == 257 && prev(resultsScreenPageGamestate()) == 0 && resultsScreenPageGamestate() == 40) &&
              prev(worldRoomId()) == 257 && trigger_when(worldRoomId() == 256) &&
              damageless()
)

achievement(
    title = "Papaya Shake", points = 5, type="progression",
    description = "Defeat the first miniboss on Moon 1.",
    trigger = difficulty(Normal) && worldRoomId() == 256 && xcoordinate() <= 1781 && xcoordinate() >= 1551 &&
              prev(orangeBoss2HealthMaxIsH64()) > 0 && orangeBoss2HealthMaxIsH64() == 0
)

achievement(
    title = "Delicious Dance", points = 10,
    description = "Defeat the first miniboss on Moon 1 without taking damage.",
    trigger = difficulty(Normal) && worldRoomId() == 256 && once(prev(xcoordinate()) < 1551 && xcoordinate() >= 1551) &&
              xcoordinate() <= 1781 && xcoordinate() >= 1551 && prev(bossHealth()) > 0 &&
              bossHealth() == 0 &&
              damageless()
)

achievement(
    title = "Chick Magnet", points = 5,
    description = "Bring at least 8 chicks to the exit at the same time on Moon 1.",
    trigger = difficulty(Normal) && worldRoomId() == 260 && prev(birdsHeld()) >= 8 &&
              (prev(birdsHeld()) - birdsHeld()) == 1
)

achievement(
    title = "Flick of the Wrist", points = 10,
    description = "Bring every chick to the exit at the same time on Moon 1.",
    trigger = difficulty(Normal) && worldRoomId() == 260 && prev(birdsHeld()) == 16 &&
              birdsHeld() == 15
)

achievement(
    title = "Flying the Coop", points = 10, type="progression",
    description = "Save every chick on Moon 1.",
    trigger = difficulty(Normal) && worldRoomId() == 260 && prev(byte(tbyte(0x0341D0) + 0x20)) == 15 &&
              byte(tbyte(0x0341D0) + 0x20) == 16
)

achievement(
    title = "Buoy Buddy", points = 2,
    description = "Relax in the water for a few seconds on Moon 1 on Normal difficulty or higher.",
    trigger = difficulty(Normal) && never(worldRoomId() != 258) && repeated(100, ycoordinateInverted() == 1012)
)

achievement(
    title = "A Brave Bravoo", points = 2, type="progression",
    description = "Defeat the second miniboss on Moon 1.",
    trigger = difficulty(Normal) && worldRoomId() == 258 && xcoordinate() <= 1397 && xcoordinate() >= 1087 &&
              prev(orangeBoss2HealthMaxIsH64()) > 0 && orangeBoss2HealthMaxIsH64() == 0
)

achievement(
    title = "Pink Hits the Road", points = 5, type="progression",
    description = "Defeat Pink and clear Moon 1.",
    trigger = difficulty(Normal) && worldRoomId() == 259 && word(tbyte(0x0312D4) + 0x162) != 0 &&
              prev(resultsScreenPageGamestate()) == 0 && resultsScreenPageGamestate() == 1
)

achievement(
    title = "Kain & Kotaro's Kute Kommander", points = 10,
    description = "Defeat Pink on Moon 1 without taking damage.",
    trigger = difficulty(Normal) && never(worldRoomId() != 259) &&
              once(prev(ycoordinateInverted()) == 42 && ycoordinateInverted() > 42) &&
              word(tbyte(0x0312D4) + 0x162) != 0 && prev(resultsScreenPageGamestate()) == 0 &&
              resultsScreenPageGamestate() == 1 &&
              never(prev(word(tbyte(0x0312D4) + 0x162)) > word(tbyte(0x0312D4) + 0x162))
)

achievement(
    title = "Superheroic Speedster on Moon 1", points = 5,
    description = "Clear Moon 1  in 6:00 or less.",
    trigger = difficulty(Normal) && worldRoomId() == 259 && word(tbyte(0x0312D4) + 0x162) != 0 &&
              prev(resultsScreenPageGamestate()) == 0 && resultsScreenPageGamestate() == 1 && timerInGameWord() <= 21658
)

achievement(
    title = "Super Blunder Blade", points = 5, type="progression",
    description = "Clear the first area of Moon 2.",
    trigger = difficulty(Normal) && prev(worldRoomId()) == 513 && worldRoomId() == 514
)

achievement(
    title = "Orange Is the New Black & Blue", points = 5, type="progression",
    description = "Defeat Orange and clear Moon 2.",
    trigger = difficulty(Normal) && worldRoomId() == 514 && word(tbyte(0x0312D4) + 0x162) != 0 &&
              prev(resultsScreenPageGamestate()) == 0 && resultsScreenPageGamestate() == 1
)

achievement(
    title = "On a Wing and a Prayer", points = 10,
    description = "Defeat Orange on Moon 2 without taking damage.",
    trigger = difficulty(Normal) && never(worldRoomId() != 514) &&
              once(prev(ycoordinateInverted()) == 235 && ycoordinateInverted() <= 204) &&
              word(tbyte(0x0312D4) + 0x162) != 0 && prev(resultsScreenPageGamestate()) == 0 &&
              resultsScreenPageGamestate() == 1 &&
              never(prev(word(tbyte(0x0312D4) + 0x162)) > word(tbyte(0x0312D4) + 0x162))
)

achievement(
    title = "Superheroic Speedster on Moon 2", points = 5,
    description = "Clear Moon 2 in 5:00 or less.",
    trigger = difficulty(Normal) && worldRoomId() == 514 && word(tbyte(0x0312D4) + 0x162) != 0 &&
              prev(resultsScreenPageGamestate()) == 0 && resultsScreenPageGamestate() == 1 && timerInGameWord() <= 18058
)

// Ticket 93003: Triggered during the tiger form on losing the fight and getting a game over.
achievement(
    title = "Unite the Seven", points = 5, type="progression",
    description = "Defeat Green and clear Moon 3 on Normal difficulty or higher.",
    trigger = difficulty(Normal) && worldRoomId() == 768 && word(tbyte(0x0312D4) + 0x162) != 0 &&
              prev(resultsScreenPageGamestate()) == 0 && resultsScreenPageGamestate() == 1
)

// Ticket 98558: European version with language set to Spanish, playing as Red on normal difficulty, had the other
//               achievements related to beating this stage and boss triggered at the game over screen after dying
//               against it, upon re-entering the stage and as this achievement appears as active, pausing and quitting
//               before getting hit also made this one trigger at the game over screen
achievement(
    title = "All Too Familiar", points = 10,
    description = "Defeat Green on Moon 3 without taking damage.",
    trigger = difficulty(Normal) && never(worldRoomId() != 768) &&
              once((prev(byte(tbyte(0x0341D0) + 0x20)) == 19) && byte(tbyte(0x0341D0) + 0x20) == 20) &&
              word(tbyte(0x0312D4) + 0x162) != 0 && trigger_when(prev(resultsScreenPageGamestate()) == 0) &&
              trigger_when(resultsScreenPageGamestate() == 1) &&
              never(prev(word(tbyte(0x0312D4) + 0x162)) > word(tbyte(0x0312D4) + 0x162))
)

achievement(
    title = "Superheroic Speedster on Moon 3", points = 5,
    description = "Clear Moon 3 on Normal difficulty or higher in under 5:00.",
    trigger = difficulty(Normal) && worldRoomId() == 768 && word(tbyte(0x0312D4) + 0x162) != 0 &&
              prev(resultsScreenPageGamestate()) == 0 && resultsScreenPageGamestate() == 1 && timerInGameWord() <= 18058
)

achievement(
    title = "Real Combat Series", points = 5,
    description = "Defeat the first boss in the Fortress Game on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1033 && prev(bit0(0x02C834)) < bit0(0x02C834)
)

achievement(
    title = "Punch-Clock Opponent", points = 5,
    description = "Defeat the second boss in the Fortress Game on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1036 && prev(bit1(0x02C834)) < bit1(0x02C834)
)

achievement(
    title = "Going, Going, Gondola", points = 5,
    description = "Defeat the third boss in the Fortress Game on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1027 && prev(bit2(0x02C834)) < bit2(0x02C834)
)

achievement(
    title = "Gels That Fight Like Men", points = 5,
    description = "Defeat the seventh boss in the Fortress Game on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1030 && prev(bit0(0x02C835)) < bit0(0x02C835)
)

achievement(
    title = "Short Stuff", points = 5,
    description = "Defeat the fourth boss in the Fortress Game on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1026 && prev(bit3(0x02C834)) < bit3(0x02C834)
)

achievement(
    title = "Prison Burst", points = 5,
    description = "Escape the bubble room in the Fortress Game on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1041 && prev(bit4(0x02C834)) < bit4(0x02C834)
)

// Ticket 93520: At the point this triggered, I had just defeated the miniboss on the first section of Moon 4 (the one
//               with the laser wheel thing). My health was at 165, my score was 16500, and I had weapon 1 of 3
//               equipped.
achievement(
    title = "Use Bubble Beam!", points = 5,
    description = "Defeat the fifth boss in the Fortress Game on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1041 && prev(bit5(0x02C834)) < bit5(0x02C834)
)

achievement(
    title = "Blazing Lasers", points = 5,
    description = "Defeat the sixth boss in the Fortress Game on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1028 && prev(bit6(0x02C834)) < bit6(0x02C834)
)

achievement(
    title = "Guess Who's Coming to Dinner", points = 5,
    description = "Defeat the eighth boss in the Fortress Game on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1031 && prev(bit1(0x02C835)) < bit1(0x02C835)
)

achievement(
    title = "A Dictator in the Alps", points = 5,
    description = "Defeat the ninth boss in the Fortress Game on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1038 && prev(bit3(0x02C835)) < bit3(0x02C835)
)

achievement(
    title = "Road Kill", points = 5,
    description = "Defeat the tenth boss in the Fortress Game on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1029 && prev(bit5(0x02C835)) < bit5(0x02C835)
)

achievement(
    title = "Data Recovery", points = 25,
    description = "Escape from the File Crash room in the Fortress Game on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1025 && prev(byte(tbyte(0x0341D0) + 0x101)) == 19 &&
              byte(tbyte(0x0341D0) + 0x101) == 17
)

achievement(
    title = "Casino Royale", points = 25,
    description = "In a single session, visit every room in the Fortress Game before defeating Black on Moon 4.",
    trigger = difficulty(Normal) &&
              measured(tally(14, once(worldRoomId() == 1026), once(worldRoomId() == 1027), once(worldRoomId() == 1028),
                  once(worldRoomId() == 1029), once(worldRoomId() == 1030), once(worldRoomId() == 1031),
                  once(worldRoomId() == 1033), once(worldRoomId() == 1034), once(worldRoomId() == 1035),
                  once(worldRoomId() == 1036), once(worldRoomId() == 1037), once(worldRoomId() == 1038),
                  once(worldRoomId() == 1040), once(worldRoomId() == 1041))
              ) && never(worldRoomId() == 1039)
)

achievement(
    title = "Donjon Master", points = 5, type="progression",
    description = "Defeat Black in the Fortress Game and clear Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1039 && word(tbyte(0x0312D4) + 0x162) != 0 &&
              prev(resultsScreenPageGamestate()) == 0 && resultsScreenPageGamestate() == 1
)

achievement(
    title = "A Wily Gambler", points = 3,
    description = "Make Black beg for mercy on Moon 4.",
    trigger = difficulty(Normal) && worldRoomId() == 1039 && prev(byte(tbyte(0x033A84) + 0x06)) == 4 &&
              byte(tbyte(0x033A84) + 0x06) == 5
)

achievement(
    title = "Superheroic Speedster on Moon 4", points = 5,
    description = "Clear Moon 4  in under 6:00.",
    trigger = difficulty(Normal) && worldRoomId() == 1039 && word(tbyte(0x0312D4) + 0x162) != 0 &&
              prev(resultsScreenPageGamestate()) == 0 && resultsScreenPageGamestate() == 1 && timerInGameWord() <= 21658
)

achievement(
    title = "The Gray Area", points = 5, type="progression",
    description = "Clear the first area of Moon 5 on Normal difficulty or higher.",
    id = 157953, badge = "177661", published = "6/9/2021 10:44:24 AM", modified = "6/9/2021 10:44:24 AM",
    trigger = difficulty(Normal) && partComplete(14)
)

achievement(
    title = "Situational Gravity", points = 5, type="progression",
    description = "Clear the second area of Moon 5 on Normal difficulty or higher.",
    id = 157904, badge = "177675", published = "6/9/2021 10:44:06 AM", modified = "6/9/2021 11:39:15 AM",
    trigger = difficulty(Normal) && partComplete(15)
)

achievement(
    title = "Galactic Forcefulness", points = 5, type="progression",
    description = "Clear the third and final area of Moon 5 on Normal difficulty or higher.",
    id = 157905, badge = "177676", published = "6/9/2021 10:44:06 AM", modified = "6/9/2021 11:39:26 AM",
    trigger = difficulty(Normal) && partComplete(16)
)

// Ticket 116704: I beat the game which includes needing to play through and beat this to achieve the achievement for
//               beating the game but this one didn't trigger. It's for doing a boss rush of all previous main bosses
//               before the final boss which that achievement did trigger.
achievement(
    title = "Color Me Unfazed", points = 10, type="progression",
    description = "Defeat Pink, Orange, Black, and Green in G-Arc on Normal difficulty or higher.",
    id = 157954, badge = "177662", published = "6/9/2021 10:44:24 AM", modified = "6/9/2021 10:44:24 AM",
    trigger = difficulty(Normal) && partComplete(17)
)

achievement(
    title = "Superheroic Speedster on G-Arc", points = 5,
    description = "Clear G-Arc on Normal difficulty or higher in under 5:00.",
    id = 157958, badge = "177666", published = "6/9/2021 10:44:26 AM", modified = "5/13/2023 10:29:14 PM",
    trigger = never(world() != 6) && never(timerInGameWord() > 18064) && once(room() == 128) &&
              trigger_when((room() == 200 && roomCasino() == 1537 && prev(orangeBoss2HealthMaxIsH64()) > 0)) &&
              trigger_when(orangeBoss2HealthMaxIsH64() == 0)
)

achievement(
    title = "Crimson Courage", points = 10, type="win_condition",
    description = "Clear G-Arc and beat the game as Red on Normal difficulty or higher.",
    id = 157955, badge = "177663", published = "6/9/2021 10:44:25 AM", modified = "11/23/2022 3:29:57 AM",
    trigger = world() == 6 && (word(0x0062D0) == 4 || byte(0x0062D0) == 2) && easy() != 1 && room() == 200 &&
              roomCasino() == 1537 && prev(orangeBoss2HealthMaxIsH64()) > 0 && orangeBoss2HealthMaxIsH64() == 0
)

achievement(
    title = "Sapphire Strength", points = 10, type="win_condition",
    description = "Clear G-Arc and beat the game as Blue on Normal difficulty or higher.",
    id = 157956, badge = "177664", published = "6/9/2021 10:44:25 AM", modified = "11/23/2022 3:30:17 AM",
    trigger = world() == 6 && (word(0x0062D0) == 5 || byte(0x0062D0) == 3) && easy() != 1 && room() == 200 &&
              roomCasino() == 1537 && prev(orangeBoss2HealthMaxIsH64()) > 0 && orangeBoss2HealthMaxIsH64() == 0
)

achievement(
    title = "What the Gunstars Are Made Of", points = 25,
    description = "Clear G-Arc and beat the game on Hard difficulty.",
    id = 157957, badge = "177665", published = "6/9/2021 10:44:25 AM", modified = "6/9/2021 10:44:25 AM",
    trigger = once(orangeBoss2HealthMaxIsH64() == 999) && room() == 200 && world() == 6 && roomCasino() == 1537 &&
              orangeBoss2HealthMaxIsH64() == 0 &&
              ((easy() == 4) ||
               (easy() == 5))
)

achievement(
    title = "Let 'Em Have It!", points = 2,
    description = "Fire the Supercharge on Normal difficulty or higher.",
    id = 157959, badge = "177667", published = "6/9/2021 10:44:26 AM", modified = "11/20/2022 7:35:54 PM",
    trigger = superWeaponActive() > 1 && timerInGame() > 0 && playersHealthMaxIs960() != 0 &&
              firstPartOfMemoryForScore() != 0 &&
              once(prev(weaponEnergyFull()) > weaponEnergyFull() && never(superWeaponActive() == 1))
)

achievement(
    title = "Charge Attack", points = 3,
    description = "Max out the Supercharge of Blue's Lightning weapon on Normal difficulty or higher.",
    id = 157901, badge = "177673", published = "6/9/2021 10:43:55 AM", modified = "5/15/2023 6:18:12 PM",
    trigger = easy() != 1 && (prev(weaponUsed()) == 0 && weaponEnergyFull() == 48) &&
              (byte(0x0062D0) == 3 || byte(0x0062D0) == 5)
)

achievement(
    title = "Azure Aiming", points = 3,
    description = "Max out the Supercharge of Blue's Chaser weapon on Normal difficulty or higher.",
    id = 157902, badge = "177672", published = "6/9/2021 10:43:55 AM", modified = "5/15/2023 6:18:12 PM",
    trigger = easy() != 1 && (prev(weaponUsed()) == 1 && weaponEnergyFull() == 48) &&
              (byte(0x0062D0) == 3 || byte(0x0062D0) == 5)
)

achievement(
    title = "Color Temperature", points = 3,
    description = "Max out the Supercharge of Blue's Fire weapon on Normal difficulty or higher.",
    id = 157903, badge = "177671", published = "6/9/2021 10:43:56 AM", modified = "5/15/2023 6:18:12 PM",
    trigger = easy() != 1 && (prev(weaponUsed()) == 2 && weaponEnergyFull() == 48) &&
              (byte(0x0062D0) == 3 || byte(0x0062D0) == 5)
)

achievement(
    title = "Trigger-Happy", points = 3,
    description = "Max out the Supercharge of Red's Force weapon on Normal difficulty or higher.",
    id = 157923, badge = "177631", published = "6/9/2021 10:44:14 AM", modified = "5/15/2023 6:16:23 PM",
    trigger = easy() != 1 && (prev(weaponUsed()) == 0 && weaponEnergyFull() == 48) &&
              (byte(0x0062D0) == 2 || byte(0x0062D0) == 4)
)

achievement(
    title = "Feisty Flames", points = 3,
    description = "Max out the Supercharge of Red's Fire weapon on Normal difficulty or higher.",
    id = 157924, badge = "177632", published = "6/9/2021 10:44:14 AM", modified = "5/15/2023 6:16:23 PM",
    trigger = easy() != 1 && (prev(weaponUsed()) == 1 && weaponEnergyFull() == 48) &&
              (byte(0x0062D0) == 2 || byte(0x0062D0) == 4)
)

achievement(
    title = "Blood in the Water", points = 3,
    description = "Max out the Supercharge of Red's Chaser weapon on Normal difficulty or higher.",
    id = 157925, badge = "177633", published = "6/9/2021 10:44:15 AM", modified = "5/15/2023 6:16:23 PM",
    trigger = easy() != 1 && (prev(weaponUsed()) == 2 && weaponEnergyFull() == 48) &&
              (byte(0x0062D0) == 2 || byte(0x0062D0) == 4)
)

achievement(
    title = "Life Loaner", points = 5,
    description = "Collect 200 Life Items on Normal difficulty or higher.",
    id = 157927, badge = "177635", published = "6/9/2021 10:44:15 AM", modified = "11/19/2025 8:41:29 PM",
    trigger = easy() > 1 && prev(playersHealthMaxIs960()) < 3200 && playersHealthMaxIs960() >= 3200 &&
              playersHealthMaxIs960() < 4800
)

achievement(
    title = "Life Lover", points = 10,
    description = "Collect 250 Life Items on Normal difficulty or higher.",
    id = 157928, badge = "177636", published = "6/9/2021 10:44:16 AM", modified = "11/19/2025 8:41:29 PM",
    trigger = easy() > 1 && prev(playersHealthMaxIs960()) < 4000 && playersHealthMaxIs960() >= 4000 &&
              playersHealthMaxIs960() < 4800
)

// Ticket 103761: adding another ticket to the big pile, lol. english language setting, normal B control setting, bright
//               brightness setting (I think), playing as Red on Normal difficulty.
//               played moon 4. 4-1 was done without taking damage (you start with 3 life orbs at the beginning), then
//               I used the checkpoint to retry 4-2 until I amassed 300 health points from the remaining orbs in this
//               section. I collected the last orb I needed in what the set calls "the bubble room". achievement did
//               not trigger within the room, nor when I returned to the casino map and changed rooms.
//               
//               unfortunately I forgot to make a save state since I was concentrating on another achievement, then
//               took damage in the very next room I entered :P
//               
//               the description confusingly phrases it as if you need to collect 300 orbs total, but it simply means
//               having 300 points.
achievement(
    title = "Life Leader", points = 25,
    description = "Collect 300 Life Items on Normal difficulty or higher.",
    id = 157929, badge = "177637", published = "6/9/2021 10:44:16 AM", modified = "11/19/2025 8:41:30 PM",
    trigger = easy() > 1 && prev(playersHealthMaxIs960()) < 4800 && playersHealthMaxIs960() >= 4800
)

achievement(
    title = "Sword Master (Red)", points = 5,
    description = "With Red, use your sword 100 times during your game.",
    id = 157909, badge = "177617", published = "6/9/2021 10:44:09 AM", modified = "6/9/2021 8:47:02 PM",
    trigger = easy() == 2 && byte(0x0062D0) == 2 &&
              repeated(100, prev(redsAnimations()) == 120 && redsAnimations() == 56) && never(menuResults() == 11)
)

achievement(
    title = "Sword Master (Blue)", points = 5,
    description = "With Blue, use your sword 100 times during your game.",
    id = 157910, badge = "177618", published = "6/9/2021 10:44:10 AM", modified = "6/9/2021 8:47:07 PM",
    trigger = repeated(100, prev(byte(0x000A3E)) == 126 && byte(0x000A3E) == 142) && easyWord() != 1 &&
              never(menuResults() == 11)
)

rich_presence_display("Playing with {0} in {1}- {2} - ❤️: {3}",
    rich_presence_lookup("player", byte(0x0062D0), playerLookup),
    rich_presence_lookup("world", world(), worldLookup),
    rich_presence_lookup("diff", easy(), diffLookup),
    rich_presence_value("hearts", playersHealthMaxIs960() * 0)
)
