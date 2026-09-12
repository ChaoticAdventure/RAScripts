// Mazin Saga: Mutant Fighter
// #ID = 2413

// $CDEC: [8-bit] Health
//        0x64= Maximum
function health() => byte(0xCDEC)
function healthWord() => word(0xCDEC)

// $CEB0: [8-bit] Boss Health
function bossHealth() => byte(0xCEB0)

// $F162: [8-bit] Gamestate
//        0x00= In-Game
//        0x01= Title Screen
//        0x02= Battle Flash Screens
function gamestate() => byte(0xF162)

// $F164: [8-bit] Stage
//        0x00= 1-1
//        0x01= 1-2
//        0x02= 1-3
//        0x03= 1-4
//        0x04= 2-1
//        0x05= 2-2
//        0x06= 2-3
//        0x07= 2-4
//        0x08= 3-1
//        0x09= 3-2
//        0x0a= 3-3
//        0x0b= 3-4
//        0x0c= 4-1
//        0x0d= 4-2
//        0x0e= 4-3
//        0x0f= 4-4
//        0x10= 5-1
//        0x11= 5-2
//        0x12= 5-3
//        0x13= 5-4
//        0x14= 1-4 Redux
//        0x15= 2-4 Redux
//        0x16= 3-4 Redux
//        0x17= 4-4 Redux
//        0x18= 5-4 Redux
//        0x19= 6
//        0xff= Main Menu
function stage() => byte(0xF164)

StageLookup = {
    0x00: "1-1",
    0x01: "1-2",
    0x02: "1-3",
    0x03: "Garada-K7 Fight",
    0x04: "2-1",
    0x05: "2-2",
    0x06: "2-3",
    0x07: "Slug Head Fight",
    0x08: "3-1",
    0x09: "3-2",
    0x0a: "3-3",
    0x0b: "Dino Beast Fight",
    0x0c: "4-1",
    0x0d: "4-2",
    0x0e: "4-3",
    0x0f: "Buster Claw Fight",
    0x10: "5-1",
    0x11: "5-2",
    0x12: "5-3",
    0x13: "Negative Mazinger Fight",
    0x14: "Garada-K7 Fight Part II",
    0x15: "Slug Head Fight Part II",
    0x16: "Dino Beast Fight Part II",
    0x17: "Buster Claw Fight Part II",
    0x18: "Negative Mazinger Fight Part II",
    0x19: "Hell Mazinger Fight",
    0x1a: "End Credits",
    0x1C: "Boss Rush • Garada-K7 Fight",
    0x1D: "Boss Rush • Slug Head Fight",
    0x1E: "Boss Rush • Dino Beast Fight",
    0x1F: "Boss Rush • Buster Claw Fight",
    0x20: "Boss Rush • Negative Mazinger Fight",
    0x21: "Boss Rush • Garada-K7 Fight Part II",
    0x22: "Boss Rush • Slug Head Fight Part II",
    0x23: "Boss Rush • Dino Beast Fight Part II",
    0x24: "Boss Rush • Buster Claw Fight Part II",
    0x25: "Boss Rush • Negative Mazinger Fight Part II",
    0x26: "Boss Rush • Hell Mazinger Fight",
    0x27: "Boss Rush • End Credits",
}

// $F28A: [32-bit] Score
function score() => word(0xF28A)

// $FA38: [8-bit] Difficulty
//        0x00= Easy
//        0x01= Normal
//        0x02= Hard
function difficulty() => byte(0xFA38)

DifficultyLookup = {
    0x00: "Easy Mode",
    0x01: "Medium Mode",
    0x02: "Hard Mode",
}

function prog(stage) {
    return gamestate() == 0 && prev(stage()) == stage && stage() == stage + 1
}

function boss(stage) {
    return gamestate() == 2 && prev(stage()) == stage && stage() == stage + 1
}

function hard(stage) {
    return gamestate() == 2 && difficulty() == 2 && prev(stage()) == stage && stage() == stage + 1
}

// $FA3C: [8-bit] Continues
function continues() => byte(0xFA3C)

// $FA40: [8-bit] Lives
function lives() => byte(0xFA40)

achievement(
    title = "Round 1-1", points = 5, type="progression",
    description = "Clear Round 1-1",
    trigger = prog(0)
)

achievement(
    title = "Round 1-2", points = 5, type="progression",
    description = "Clear Round 1-2",
    trigger = prog(1)
)

achievement(
    title = "Round 1-3", points = 5, type="progression",
    description = "Clear Round 1-3",
    trigger = prog(2)
)

achievement(
    title = "Garada-K7", points = 10, type="progression",
    description = "Defeat Garada-K7",
    trigger = boss(3)
)

achievement(
    title = "Tokyo (Hard)", points = 25,
    description = "Clear Tokyo on Hard difficulty",
    trigger = hard(3)
)

achievement(
    title = "Round 2-1", points = 5, type="progression",
    description = "Clear Round 2-1",
    id = 40621, badge = "41722", published = "10/3/2016 8:06:40 PM", modified = "1/5/2025 5:24:55 PM",
    trigger = prog(4)
)

achievement(
    title = "Round 2-2", points = 5, type="progression",
    description = "Clear Round 2-2",
    id = 40622, badge = "41723", published = "10/3/2016 8:06:51 PM", modified = "1/5/2025 5:24:55 PM",
    trigger = prog(5)
)

achievement(
    title = "Round 2-3", points = 5, type="progression",
    description = "Clear Round 2-3",
    id = 40623, badge = "41724", published = "10/3/2016 8:06:55 PM", modified = "1/5/2025 5:24:55 PM",
    trigger = prog(6)
)

achievement(
    title = "Slug Head", points = 5, type="progression",
    description = "Defeat Slug Head",
    id = 40624, badge = "41725", published = "10/3/2016 8:07:00 PM", modified = "1/5/2025 5:24:55 PM",
    trigger = boss(7)
)

achievement(
    title = "India (Hard)", points = 25,
    description = "Clear India on Hard difficulty",
    id = 40625, badge = "41726", published = "10/3/2016 8:07:13 PM", modified = "1/5/2025 5:24:55 PM",
    trigger = hard(7)
)

achievement(
    title = "Round 3-1", points = 5, type="progression",
    description = "Clear Round 3-1",
    id = 40626, badge = "41728", published = "10/3/2016 8:07:44 PM", modified = "1/5/2025 5:24:56 PM",
    trigger = prog(8)
)

achievement(
    title = "Round 3-2", points = 5, type="progression",
    description = "Clear Round 3-2",
    id = 40627, badge = "41729", published = "10/3/2016 8:07:49 PM", modified = "1/5/2025 5:24:56 PM",
    trigger = prog(9)
)

achievement(
    title = "Round 3-3", points = 5, type="progression",
    description = "Clear Round 3-3",
    id = 40628, badge = "41730", published = "10/3/2016 8:07:53 PM", modified = "1/5/2025 5:24:56 PM",
    trigger = prog(10)
)

achievement(
    title = "Dino Beast", points = 10, type="progression",
    description = "Defeat Dino Beast",
    id = 40629, badge = "41731", published = "10/3/2016 8:08:00 PM", modified = "1/5/2025 5:24:56 PM",
    trigger = boss(11)
)

achievement(
    title = "Europe (Hard)", points = 25,
    description = "Clear Europe on Hard difficulty",
    id = 40630, badge = "41732", published = "10/3/2016 8:08:12 PM", modified = "1/5/2025 5:24:57 PM",
    trigger = hard(11)
)

achievement(
    title = "Round 4-1", points = 5, type="progression",
    description = "Clear Round 4-1",
    id = 40631, badge = "41733", published = "10/3/2016 8:08:18 PM", modified = "1/5/2025 5:24:57 PM",
    trigger = prog(12)
)

achievement(
    title = "Round 4-2", points = 5, type="progression",
    description = "Clear Round 4-2",
    id = 40632, badge = "41734", published = "10/3/2016 8:08:26 PM", modified = "1/5/2025 5:24:57 PM",
    trigger = prog(13)
)

achievement(
    title = "Round 4-3", points = 5, type="progression",
    description = "Clear Round 4-3",
    id = 40633, badge = "41735", published = "10/3/2016 8:08:29 PM", modified = "1/5/2025 5:24:57 PM",
    trigger = prog(14)
)

achievement(
    title = "Buster Claw", points = 10, type="progression",
    description = "Defeat Buster Claw",
    id = 40634, badge = "41736", published = "10/3/2016 8:08:34 PM", modified = "1/5/2025 5:24:58 PM",
    trigger = boss(15)
)

achievement(
    title = "New York (Hard)", points = 25,
    description = "Clear New York on Hard difficulty",
    id = 40635, badge = "41737", published = "10/3/2016 8:09:05 PM", modified = "1/5/2025 5:24:58 PM",
    trigger = hard(15)
)

achievement(
    title = "Round 5-1", points = 5, type="progression",
    description = "Clear Round 5-1",
    id = 40636, badge = "41738", published = "10/3/2016 8:10:10 PM", modified = "1/5/2025 5:24:59 PM",
    trigger = prog(16)
)

achievement(
    title = "Round 5-2", points = 5, type="progression",
    description = "Clear Round 5-2",
    id = 40637, badge = "41739", published = "10/3/2016 8:10:20 PM", modified = "1/5/2025 5:24:59 PM",
    trigger = prog(17)
)

// Ticket 111194: Like with several others, this achievement is failing to activate for me. It is the same with the
//               Round II battles, as well as https://retroachievements.org/achievement/40646 .
// Ticket 110709: Completed level with 5 lives and 5 continues on easy and the achievement didn't unlock. I was able to
//               get the achievement for beating the final boss.
achievement(
    title = "Round 5-3", points = 5, type="progression",
    description = "Clear Round 5-3",
    id = 40638, badge = "41740", published = "10/3/2016 8:10:24 PM", modified = "1/5/2025 5:24:59 PM",
    trigger = prog(18)
)

achievement(
    title = "Negative Mazinger", points = 10, type="progression",
    description = "Defeat Negative Mazinger",
    id = 40639, badge = "41741", published = "10/3/2016 8:10:32 PM", modified = "1/5/2025 5:25:00 PM",
    trigger = boss(19)
)

achievement(
    title = "Egypt (Hard)", points = 25,
    description = "Clear Egypt on Hard difficulty",
    id = 40640, badge = "41742", published = "10/3/2016 8:10:38 PM", modified = "1/5/2025 5:25:00 PM",
    trigger = hard(19)
)

// Ticket 113901: All achievements related to the Level 6 boss rush do not unlock. Whether on Normal or Hard mode, with
//               or without continues.
achievement(
    title = "Garada K7 II", points = 25, type="progression",
    description = "Defeat Garada K7 again",
    id = 40641, badge = "41743", published = "10/3/2016 8:11:01 PM", modified = "1/5/2025 5:25:00 PM",
    trigger = prog(20)
)

// Ticket 113902: All achievements related to the Level 6 boss rush do not unlock. Whether on Normal or Hard mode, with
//               or without continues.
achievement(
    title = "Slug Head II", points = 25, type="progression",
    description = "Defeat Slug Head again",
    id = 40642, badge = "41744", published = "10/3/2016 8:11:07 PM", modified = "1/5/2025 5:25:00 PM",
    trigger = prog(21)
)

// Ticket 113903: All achievements related to the Level 6 boss rush do not unlock. Whether on Normal or Hard mode, with
//               or without continues.
achievement(
    title = "Dino Beast II", points = 25, type="progression",
    description = "Defeat Dino Beast again",
    id = 40643, badge = "41745", published = "10/3/2016 8:11:12 PM", modified = "1/5/2025 5:25:02 PM",
    trigger = prog(22)
)

// Ticket 113904: All achievements related to the Level 6 boss rush do not unlock. Whether on Normal or Hard mode, with
//               or without continues.
// Ticket 103711: Normal difficulty, 5 lives 5 continues, beat buster claw round 2, achievement did not trigger, this
//               also happened on the PicoDrive core and BizHawk Emulator
achievement(
    title = "Buster Claw II", points = 25, type="progression",
    description = "Defeat Buster Claw again",
    id = 40644, badge = "41746", published = "10/3/2016 8:11:17 PM", modified = "1/5/2025 5:25:02 PM",
    trigger = prog(23)
)

// Ticket 113905: All achievements related to the Level 6 boss rush do not unlock. Whether on Normal or Hard mode, with
//               or without continues.
// Ticket 103712: Normal difficulty, 5 lives 5 continues, beat Negative Mazinger Round 2, achievement did not trigger,
//               this also happened on the PicoDrive core and BizHawk Emulator
achievement(
    title = "Negative Mazinger II", points = 25, type="progression",
    description = "Defeat Negative Mazinger again",
    id = 40645, badge = "41747", published = "10/3/2016 8:11:23 PM", modified = "1/5/2025 5:25:02 PM",
    trigger = prog(24)
)

// Ticket 113974: It doesn't unlock, no matter what. I tried with both supported games, Mazin Saga (Japan, Korea)
//               (Ja).md f3ae6147d9ad2d40e781a49c7263f746
//               and Mazin Saga - Mutant Fighter (USA).md f978463dca8bc6f44f28c665b59965f6. Not the single boss, not
//               the full boss rush on hard mode
achievement(
    title = "The Bio Beasts Counter Attack (Hard)", points = 25,
    description = "Defeat all the Bio Beasts again on Hard difficulty",
    id = 40646, badge = "41748", published = "10/3/2016 8:11:41 PM", modified = "1/5/2025 5:25:03 PM",
    trigger = hard(24)
)

achievement(
    title = "Hell Mazinger", points = 25, type="win_condition",
    description = "Defeat Hell Mazinger",
    id = 40647, badge = "41749", published = "10/3/2016 8:12:20 PM", modified = "1/5/2025 5:25:03 PM",
    trigger = boss(25)
)

achievement(
    title = "The Last Battle (Hard)", points = 25,
    description = "Clear the Last Battle on Hard difficulty",
    id = 40648, badge = "41750", published = "10/3/2016 8:12:27 PM", modified = "1/5/2025 5:25:03 PM",
    trigger = hard(25)
)

achievement(
    title = "50,000 Points", points = 5,
    description = "Earn 50,000 Points",
    id = 40649, badge = "41751", published = "10/3/2016 8:12:31 PM", modified = "1/5/2025 5:25:03 PM",
    trigger = prev(word(0x00F28C)) < 50000 && word(0x00F28C) >= 50000 && health() > 0
)

achievement(
    title = "100,000 Points", points = 5,
    description = "Earn 100,000 Points",
    id = 40650, badge = "41752", published = "10/3/2016 8:12:38 PM", modified = "1/5/2025 5:25:03 PM",
    trigger = prev(word(0x00F28C)) < 34464 && word(0x00F28C) >= 34464 && score() >= 1 && healthWord() > 0
)

achievement(
    title = "200,000 Points", points = 5,
    description = "Earn 200,000 Points",
    id = 40651, badge = "41753", published = "10/3/2016 8:12:45 PM", modified = "1/5/2025 5:25:04 PM",
    trigger = prev(word(0x00F28C)) < 3392 && word(0x00F28C) >= 3392 && score() >= 3 && healthWord() > 0
)

achievement(
    title = "600,000 Points", points = 10,
    description = "Earn 600,000 Points",
    id = 40652, badge = "41754", published = "10/3/2016 8:12:50 PM", modified = "1/5/2025 5:25:04 PM",
    trigger = prev(word(0x00F28C)) < 10176 && word(0x00F28C) >= 10176 && score() >= 9 && healthWord() > 0
)

achievement(
    title = "1,200,000 Points", points = 25,
    description = "Earn 1,200,000 Points",
    id = 40653, badge = "41755", published = "10/3/2016 8:12:57 PM", modified = "1/5/2025 5:25:05 PM",
    trigger = prev(word(0x00F28C)) < 20352 && word(0x00F28C) >= 20352 && score() >= 18 && healthWord() > 0
)

rich_presence_conditional_display(stage() == 255, "Preparing to clean up the mutant scum of the Steelmask Force")

rich_presence_display("🚩 {0} • Score: {1} • HP {2}/100 • {3} Lives • {4}",
    rich_presence_lookup("Stage", stage(), StageLookup),
    rich_presence_value("Value", score() * 65536 + word(0x00F28C)),
    rich_presence_value("Value", health()),
    rich_presence_value("Value", lives()),
    rich_presence_lookup("Difficulty", difficulty(), DifficultyLookup)
)
