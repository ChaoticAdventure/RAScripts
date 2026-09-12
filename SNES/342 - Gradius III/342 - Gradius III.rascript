// Gradius III
// #ID = 342

function gameScreens() => byte(0x0032)
function gameScreensWord() => word(0x0032)
function eventId() => byte(0x0052)
function gamestate_2() => byte(0x0070)
function player1Lives() => byte(0x007C)
function player1LivesWord() => word(0x007C)
function levelNumber() => byte(0x0086)
function levelNumberLow4() => low4(0x0086)
function levelNumberWord() => word(0x0086)

LevelLookup = {
    0x0: "1",
    0x1: "2",
    0x2: "3",
    0x3: "4",
    0x4: "7",
    0x5: "5",
    0x6: "6",
    0x7: "8",
    0x8: "9",
    0x9: "10",
    0xb: "B1",
    0xc: "B2",
    0xd: "B3",
    0xa: "B4",
    0xe: "B5",
}

// Level Constants
Level1 = 0
Level2 = 1
Level3 = 2
Level4 = 3
Level5 = 5
Level6 = 6
Level7 = 4
Level8 = 7
Level9 = 8
Level10 = 9
BonusLevelUnknown1 = 10
BonusLevel2 = 11
BonusLevel3 = 12
BonusLevel4 = 13
BonusLevelUnknown2 = 14

function loopNumber() => byte(0x0088)
function loopNumberLow4() => low4(0x0088)
function loopNumberWord() => word(0x0088)
function region() => byte(0x0096)
function speedModifier() => byte(0x00B2)
function primaryWeapon() => byte(0x00B6)

// Laser Constant
Laser = 6

function primaryWeaponLow4() => low4(0x00B6)

WeaponLookup = {
    0x0: "",
    0x1: "Single",
    0x2: "Double",
    0x3: "TailGun",
    0x4: "FreeWay",
    0x5: "Vertical",
    0x6: "RippleLaser",
    0x7: "CycloneLaser",
    0x8: "TwinLaser",
    0x9: "EnergyLaser",
    0xa: "TwinLaser",
}
function reduceShieldPower() => byte(0x00DE)
function object2() => byte(0x0240)
function shieldStrength() => byte(0x0346)
function shieldStrengthLow4() => low4(0x0346)
function disruptTimer() => word(0x08E4)
function bubbleEyeTimer() => word(0x08F2)
function goliathAndTwinVaifTimer() => word(0x08F6)
function bacterionTimer() => word(0x08FE)
function objectSlot2Health() => byte(0x0906)
function deathTimer() => word(0x0924)
function twinVaifLowerHeadAndBigCoreMkiiUpperCoreHealth() => byte(0x0946)
function crystalCoreHealth() => byte(0x0986)
function crystalCoreTimer() => word(0x09A4)
function coveredCoreEnergy() => byte(0x0A46)
function coveredCoreTimer() => word(0x0A64)
function bigCoreMkiiLowerCoreEnergy() => byte(0x0A86)
function bigCoreMkiiTimer() => word(0x0AA4)
function bigCoreMkiii3rdCoreAndDellingerCoreEnergy() => byte(0x0BC6)
function bigCoreMkiiiAndDellingerCoreTimer() => word(0x0BE4)
function disruptCore2Energy() => byte(0x0CC6)
function disruptCore3Energy() => byte(0x0E06)
function gorgonEnergy() => byte(0x0EC6)
function gorgonLowerHeadTimer() => word(0x0EF6)
function bloatWeedAndBeaconLastCoreEnergy() => byte(0x11C6)
function beaconLastCoreTimer() => word(0x11E4)
function bloatWeedTimer() => word(0x11F2)
function _1WordFrameOrDistanceIndicatorOfCurrentStagePresumed() => byte(0x12CA)
function _1WordFrameOrDistanceIndicatorOfCurrentStagePresumedWord() => word(0x12CA)
function sandDragonOnscreen() => word(0x14EB)
function pauseCodeInput2_12OneButtonBeforePowerUpCheat() => byte(0x1902)
function pauseCodesAvailable() => word(0x1906)
function extraLivesCheat() => byte(0x1E04)
function extraLivesCheatWord() => word(0x1E04)
function credits() => byte(0x1E06)
function difficultyPlayer1() => byte(0x1E20)
function difficultyPlayer1Low4() => low4(0x1E20)

ModeLookup = {
    0x0: "Easy",
    0x1: "Normal",
    0x2: "Hard",
    0x3: "Arcade",
    0x55: "Init",
}
function _32BitBcdPlayerScore() => word(0x1F44)
function _32BitBcdPlayerScoreLow4() => low4(0x1F44)
function _32BitBcdPlayerScoreHigh4() => high4(0x1F44)
function waves() => word(0xCC)

MissilesLookup = {
    0x0: "",
    0xb: "Missile",
    0xc: "SpreadBomb",
    0xd: "2-Way",
    0xe: "PhotonTorpedo",
    0xf: "SmallSpread",
    0x10: "2-WayBack",
    0x11: "HawkWind",
}

// New Constants
Loading = 0
MainMenu = 1
Intro = 2
P1Start = 3
InGame = 4
Options = 5

Easy = 0
Medium = 1
Hard = 2
Arcade = 3

// New Functions
function cheatProtection() {
    return once(prev(gameScreens()) == P1Start && gameScreens() == InGame) && 
           never(pauseCodesAvailable() < prev(pauseCodesAvailable())) && 
           pauseCodesAvailable() != 0xffff &&
           extraLivesCheat() != 0xff && 
           difficultyPlayer1() != Easy && 
           credits() <= 4
}

function cheatProtectionReset() {
    return once(prev(gameScreens()) == P1Start && gameScreens() == InGame) && 
           never(pauseCodesAvailable() < prev(pauseCodesAvailable())) && 
           never(pauseCodesAvailable() == 0xffff) &&
           never(extraLivesCheat() == 0xff) && 
           never(difficultyPlayer1() == Easy) && 
           never(credits() > 4)
}

function progression(level1,level2) {
    return prev(levelNumber()) == level1 && levelNumber() == level2
}

// Object Data Parsing
ObjectStart = 0x8C0

// Health
BeforeRed = 2
Red = 1
Dead = 0

// Object IDs
SmallExplosion = 0x01
MediumExplosion = 0x02
LargeExplosion = 0x03
PowerItem = 0x05
Hatch1 = 0x14
Hatch2 = 0x15
IronMaiden = 0x2b
MoaiExplosion = 0x43
Hatch3 = 0x44
Moai1 = 0x48
Moai2 = 0x52
Moai3 = 0x54
Moai4 = 0x61
MoaiTower = 0x53
SandDragonAlive = 0x1d
ScoreItem = 0x76
LifeItem = 0x77
SandDragonExplosion = 0xbe

// Heath Values
MoaiTowerHP = 0xff
MoaiTowerHPExplosion = 0xfe

// Generates a flat list of conditions for multiple objects/offsets
function check_objects(values, explosions, offsets) {
    conditions = []
    
    for i in range(1, 39) {
        newObjectStart = ObjectStart + (64 * (i - 1))
        
        // Loop through each object configuration passed in
        for index in range(0, length(values) - 1) {
            val = values[index]
            exp = explosions[index]
            offset = offsets[index]
            
            objectLoc = newObjectStart + offset
            cond = (prev(byte(objectLoc)) == val && byte(objectLoc) == exp)
            array_push(conditions, cond)
        }
    }
    return conditions
}

// Specifically for Moais because they're ass
function check_moais() {
    conditions = []
    // Normal Checks
    for i in range(1, 39) {
        newObjectStart = ObjectStart + (64 * (i - 1))
        loc1 = newObjectStart + 0x10
        cond = ((prev(byte(loc1)) >= Moai1 && prev(byte(loc1)) <= Moai4 && prev(byte(loc1)) != MoaiTower) && byte(loc1) == MoaiExplosion)
        array_push(conditions, cond)
        }
    // Checks for Towers
    for i in range(1,39) {
        newObjectStart = ObjectStart + (64 * (i - 1))
        idLoc = newObjectStart + 0x10
        hpLoc = newObjectStart + 0x06
        cond = (byte(idLoc) == MoaiTower && prev(byte(hpLoc)) == MoaiTowerHP && byte(hpLoc) == MoaiTowerHPExplosion)
        array_push(conditions, cond)
    }
    return measured(tally(50,conditions))
}


//Type IDs (Arbitrary)
Health = 0
ID = 1

//Boss and Enemy Slot Constants
// Level 1
Goliath = 1
GoliathTimer = 0x36
// Level 2
BubbleEye = 1
BubbleEyeTimer = 0x32
// Level 3
LowerBigCoreMkIII = 8
LowerBigCoreMkIIITimer = 0x24
BackBigCoreMkIII = 13
BackBigCoreMkIIITimer = 0x24
// Level 4
TwinVaif = 1
TwinVaifTimer = 0x36
TwinVaifUpperHead = 2
TwinVaifLowerHead = 3
// Level 5
GorgonUpperHead = 2
GorgonLowerHead = 25
GorgonLowerHeadTimer = 0x36
// Level 6
ChokingWeed = 37
ChokingWeedTimer = 0x32
// Level 7
LastBeacon = 37
LastBeaconTimer = 0x24
// Level 8
Death = 2
CrystalCore = 4
UpperBigCoreMkII = 3
CoveredCore = 7
DellingerCore = 13
BossRushTimer = 0x24
// Level 9
FirstDisrupt = 1
FirstDisruptTimer = 0x24
SecondDisrupt = 17
ThirdDisrupt = 22
FirstShadowGearMkII = 2
SecondShadowGearMkII = 15
// Level 10
Bacterion = 1
BacterionTimer = 0x3e
// Other
SandDragon = 2

// Uses a specific object slot to make a comparison, e.g. for bosses when I know exactly
// which slot the object will appear in.
// ID Example: specificObject(SandDragon,ID,SandDragonAlive,SandDragonExplosion)
// Health Example: specificObject(SandDragon,Health,1,0)
function specificObject(slot,type,val1,val2) {
    newObjectStart = ObjectStart + (64 * (slot - 1))
    if (type == Health) {
        objectLoc = newObjectStart + 0x06
        return (prev(byte(objectLoc)) == val1 && byte(objectLoc) == val2)
    }
    if (type == ID) {
        objectLoc = newObjectStart + 0x10
        return (prev(byte(objectLoc)) == val1 && byte(objectLoc) == val2)
    }
}

// Arbitrary G/L
G = 0
L = 1
GE = 2
LE = 3

// This version is for timers specifically.
function timer(slot,offset,val,gOrL) {
    newObjectStart = ObjectStart + (64 * (slot - 1))
    timerLoc = newObjectStart + offset
    if (gOrL == G) {
        return word(timerLoc) > val
    }
    if (gOrL == L) {
        return word(timerLoc) < val
    }
    if (gOrL == GE) {
        return word(timerLoc) >= val
    }
    if (gOrL == LE) {
        return word(timerLoc) <= val
    }
}

achievement(
    title = "Sand Storm", points = 5, type="progression",
    description = "Defeat Goliath and clear Stage 1 - All achievements require Normal difficulty or higher",
    trigger = cheatProtection() && progression(Level1,Level2)
)

achievement(
    title = "Aqua Illusion", points = 5, type="progression",
    description = "Defeat Bubble Eye and clear Stage 2",
    id = 38827, badge = "39799", published = "8/10/2016 1:35:44 AM", modified = "4/17/2024 3:20:48 PM",
    trigger = cheatProtection() && progression(Level2,Level3)
)

achievement(
    title = "In the Wind", points = 5, type="progression",
    description = "Defeat Big Core MK III and clear Stage 3",
    id = 38826, badge = "39797", published = "8/10/2016 1:35:37 AM", modified = "4/17/2024 3:20:59 PM",
    trigger = cheatProtection() && progression(Level3,Level4)
)

achievement(
    title = "Easter Stone", points = 5, type="progression",
    description = "Defeat Twin Vaif and clear Stage 4",
    id = 38828, badge = "39802", published = "8/10/2016 1:35:47 AM", modified = "4/17/2024 3:21:10 PM",
    trigger = cheatProtection() && progression(Level4,Level5)
)

achievement(
    title = "Fire Scramble", points = 5, type="progression",
    description = "Defeat Vulture Dragon and clear Stage 5",
    id = 38829, badge = "39807", published = "8/10/2016 1:35:52 AM", modified = "4/17/2024 3:21:23 PM",
    trigger = cheatProtection() && progression(Level5,Level6)
)

achievement(
    title = "Cosmo Plant", points = 5, type="progression",
    description = "Defeat Choking Weed and clear Stage 6",
    id = 38830, badge = "39811", published = "8/10/2016 1:35:56 AM", modified = "4/17/2024 3:21:32 PM",
    trigger = cheatProtection() && progression(Level6,Level7)
)

achievement(
    title = "Accident Road", points = 10, type="progression",
    description = "Defeat Beacon and clear Stage 7",
    id = 38831, badge = "39858", published = "8/10/2016 1:35:59 AM", modified = "4/17/2024 3:21:41 PM",
    trigger = cheatProtection() && progression(Level7,Level8)
)

achievement(
    title = "Boss on Parade", points = 10, type="progression",
    description = "Defeat Dellinger Core and clear Stage 8",
    id = 38832, badge = "39866", published = "8/10/2016 1:36:03 AM", modified = "4/17/2024 3:21:56 PM",
    trigger = cheatProtection() && progression(Level8,Level9)
)

achievement(
    title = "Mechanical Base", points = 10, type="progression",
    description = "Defeat the Shadow Gear MK IIs and clear Stage 9",
    id = 38833, badge = "39847", published = "8/10/2016 1:36:06 AM", modified = "4/17/2024 3:22:07 PM",
    trigger = cheatProtection() && progression(Level9,Level10)
)

achievement(
    title = "Unpleasant Cell", points = 25, type="win_condition",
    description = "Defeat Bacterian and beat the game",
    id = 38834, badge = "39855", published = "8/10/2016 1:36:10 AM", modified = "4/17/2024 3:22:16 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 9) && eventId() == 131 && never(region() != 60) &&
              disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Light-Speed Battle I - Goliath", points = 3,
    description = "Turn Goliath's core red before reaching its second phase without using any Laser weapons",
    id = 38847, badge = "39757", published = "8/10/2016 1:37:05 AM", modified = "4/20/2024 6:25:11 PM",
    trigger = cheatProtection() && levelNumber() == Level1 && primaryWeapon() < Laser &&
              trigger_when(specificObject(Goliath,Health,BeforeRed,Red)) && timer(Goliath,GoliathTimer,0x170,GE)
)

achievement(
    title = "Light-Speed Battle II - Bubble Eye", points = 3,
    description = "Get Bubble Eye down to one health in 29 seconds or less without using any Laser weapons",
    id = 38848, badge = "39774", published = "8/10/2016 1:37:09 AM", modified = "4/20/2024 6:24:52 PM",
    trigger = cheatProtection() && levelNumber() == Level2 && primaryWeapon() < Laser &&
              trigger_when(specificObject(BubbleEye,Health,BeforeRed,Red)) && timer(BubbleEye,BubbleEyeTimer,0x400,GE)
)

achievement(
    title = "Light-Speed Battle III - Big Core MK III", points = 5,
    description = "Turn Big Core MK III's backmost core red without using any Laser weapons",
    id = 38852, badge = "39796", published = "8/10/2016 1:37:23 AM", modified = "4/20/2024 6:25:25 PM",
    trigger = cheatProtection() && levelNumber() == Level3 && primaryWeapon() < Laser &&
              trigger_when(specificObject(BackBigCoreMkIII,Health,BeforeRed,Red)) && timer(BackBigCoreMkIII,BackBigCoreMkIIITimer,0x250,GE)
)

achievement(
    title = "Light-Speed Battle IV - Twin Vaif", points = 5,
    description = "Get Twin Vaif down to one health in _ seconds or less without using any Laser weapons",
    id = 38858, badge = "39804", published = "8/10/2016 1:37:53 AM", modified = "4/20/2024 6:25:35 PM",
    trigger = cheatProtection() && levelNumber() == Level4 && primaryWeapon() < Laser &&
              trigger_when(once(specificObject(TwinVaifLowerHead,Health,BeforeRed,Red)) && once(specificObject(TwinVaifUpperHead,Health,BeforeRed,Red))) && 
              timer(TwinVaif,TwinVaifTimer,0x400,GE)
)

achievement(
    title = "Light-Speed Battle V - Vulture Dragon", points = 5,
    description = "Reach Vulture Dragon's second phase in _ seconds or less without using any Laser weapons",
    id = 38861, badge = "39808", published = "8/10/2016 1:38:03 AM", modified = "4/20/2024 6:25:46 PM",
    trigger = cheatProtection() && levelNumber() == Level5 && primaryWeapon() < Laser &&
              trigger_when(specificObject(GorgonLowerHead,Health,BeforeRed,Red)) && timer(GorgonLowerHead,GorgonLowerHeadTimer,0x150,GE)
)

achievement(
    title = "Light-Speed Battle VI - Choking Weed", points = 10,
    description = "Get Choking Weed down to one health in _ seconds or less without using any Laser weapons",
    id = 38865, badge = "39813", published = "8/10/2016 1:38:18 AM", modified = "4/20/2024 6:25:58 PM",
    trigger = cheatProtection() && levelNumber() == Level6 && primaryWeapon() < Laser &&
              trigger_when(specificObject(ChokingWeed,Health,BeforeRed,Red)) && timer(ChokingWeed,ChokingWeedTimer,0x500,GE)
)

achievement(
    title = "Light-Speed Battle VII - Beacon", points = 10,
    description = "Turn Beacon's backmost core red __(time frame) without using any Laser weapons",
    id = 38867, badge = "39815", published = "8/10/2016 1:38:25 AM", modified = "4/20/2024 6:26:16 PM",
    trigger = cheatProtection() && levelNumber() == Level7 && primaryWeapon() < Laser &&
              trigger_when(specificObject(LastBeacon,Health,BeforeRed,Red)) && timer(LastBeacon,LastBeaconTimer,0x300,GE)
)

achievement(
    title = "Light-Speed Battle VIII - Death MK II", points = 10,
    description = "Turn Death MK II's core red __(time frame) without using any Laser weapons",
    id = 38871, badge = "39836", published = "8/10/2016 1:38:38 AM", modified = "4/20/2024 6:26:28 PM",
    trigger = cheatProtection() && levelNumber() == Level8 && primaryWeapon() < Laser &&
              trigger_when(specificObject(Death,Health,BeforeRed,Red)) && timer(Death,BossRushTimer,0x250,GE)
)

achievement(
    title = "Light-Speed Battle IX - Crystal Core", points = 10,
    description = "Get Crystal Core down to one health in _ seconds or less without using any Laser weapons",
    id = 38872, badge = "39837", published = "8/10/2016 1:38:42 AM", modified = "4/20/2024 6:26:38 PM",
    trigger = cheatProtection() && levelNumber() == Level8 && primaryWeapon() < Laser &&
              trigger_when(specificObject(CrystalCore,Health,BeforeRed,Red)) && timer(CrystalCore,BossRushTimer,0x400,GE)
)

achievement(
    title = "Light-Speed Battle X - Big Core MK II", points = 10,
    description = "Turn Big Core MK II's bottom core red __(time frame) without using any Laser weapons",
    id = 38873, badge = "39838", published = "8/10/2016 1:38:45 AM", modified = "4/20/2024 6:26:46 PM",
    trigger = cheatProtection() && levelNumber() == Level8 && primaryWeapon() < Laser &&
              trigger_when(specificObject(UpperBigCoreMkII,Health,BeforeRed,Red)) && timer(UpperBigCoreMkII,BossRushTimer,0x250,GE)
)

achievement(
    title = "Light-Speed Battle XI - Covered Core", points = 10,
    description = "Turn Covered Core's core red __(time frame) without using any Laser weapons",
    id = 38874, badge = "39839", published = "8/10/2016 1:38:49 AM", modified = "4/20/2024 6:26:53 PM",
    trigger = cheatProtection() && levelNumber() == Level8 && primaryWeapon() < Laser &&
              trigger_when(specificObject(CoveredCore,Health,BeforeRed,Red)) && timer(CoveredCore,BossRushTimer,0x250,GE)
)

achievement(
    title = "Light-Speed Battle XII - Dellinger Core", points = 10,
    description = "Turn Dellinger Core's core red __(time frame) without using any Laser weapons",
    id = 38875, badge = "39842", published = "8/10/2016 1:38:52 AM", modified = "4/20/2024 6:27:01 PM",
    trigger = cheatProtection() && levelNumber() == Level8 && primaryWeapon() < Laser &&
              trigger_when(specificObject(DellingerCore,Health,BeforeRed,Red)) && timer(DellingerCore,BossRushTimer,0x250,GE)        
)

achievement(
    title = "Light-Speed Battle XIII - Disrupt", points = 10,
    description = "Turn Disrupt's cores red (time frame) without using any Laser weapons",
    id = 38877, badge = "39850", published = "8/10/2016 1:39:00 AM", modified = "4/20/2024 6:27:08 PM",
    trigger = cheatProtection() && levelNumber() == Level9 && primaryWeapon() < Laser && 
              trigger_when(once(specificObject(FirstDisrupt, Health, BeforeRed, Red))) &&
              trigger_when(once(specificObject(SecondDisrupt, Health, BeforeRed, Red))) &&
              trigger_when(once(specificObject(ThirdDisrupt, Health, BeforeRed, Red))) &&
              timer(FirstDisruptTimer, BossRushTimer, 0x250, GE)
)

achievement(
    title = "Light-Speed Battle XIV - Shadow Gear MK II", points = 10,
    description = "Get the Shadow Gear MK IIs down to one health in _ seconds or less without using any Laser weapons",
    id = 38879, badge = "39853", published = "8/10/2016 1:39:06 AM", modified = "4/20/2024 6:27:16 PM",
    trigger = cheatProtection() && levelNumber() == Level9 && primaryWeapon() < Laser && 
              trigger_when(once(specificObject(FirstShadowGearMkII, Health, BeforeRed, Red))) &&
              trigger_when(once(specificObject(SecondShadowGearMkII, Health, BeforeRed, Red))) //&&
              //timer(, , , GE)
)

achievement(
    title = "Light-Speed Battle XV - Bacterian", points = 10,
    description = "Get Bacterian down to one health in _ seconds or less without using any Laser weapons",
    id = 38881, badge = "39856", published = "8/10/2016 1:39:14 AM", modified = "4/20/2024 6:27:26 PM",
    trigger = cheatProtection() && levelNumber() == Level10 && primaryWeapon() < Laser &&
              trigger_when(specificObject(Bacterion,Health,BeforeRed,Red)) && timer(Bacterion,BacterionTimer,0x200,GE)
)

// Ticket 93270: Not sure if I did successfully kill the third sand dragon or not. I did kill at least two sand
//               dragons, but I think what happened is that I died while a third sand dragon was on screen and
//               de-loading it during the death screen caused this to trigger immediately. It definitely seemed unusual
//               for it to pop right after dying, at least.
achievement(
    title = "Galactic Hunter I - Sand Dragon", points = 4,
    description = "Destroy 3 Sand Dragons in Stage 1",
    trigger = cheatProtectionReset() && never(levelNumber() != Level1) && 
              measured(tally(3,specificObject(SandDragon,ID,SandDragonAlive,SandDragonExplosion) && specificObject(SandDragon,Health,1,0)))
)

achievement(
    title = "Galactic Hunter II - Hatch", points = 5,
    description = "Destroy 24 Hatches in the first 4 stages",
    id = 38883, badge = "39763", published = "8/10/2016 1:46:20 AM", modified = "4/17/2024 3:30:10 PM",
    trigger = cheatProtectionReset() && 
              unless((levelNumber() > Level4 && levelNumber() < BonusLevel2) || levelNumber() > BonusLevel4) &&
              measured(tally(24, check_objects(
                  [Hatch1, Hatch2, Hatch3],
                  [LargeExplosion, LargeExplosion, LargeExplosion],
                  [0x10, 0x10, 0x10]
    )))
)

//    trigger = cheatProtectionReset() && unless((levelNumber() > Level4 && levelNumber() < BonusLevel2) || levelNumber() > BonusLevel4) && 
//              measured(objectMulti([Hatch1,Hatch2,Hatch3],LargeExplosion,24))


achievement(
    title = "Galactic Hunter III - Iron Maiden", points = 5,
    description = "Destroy 24 Iron Maidens in Stage 3",
    id = 38851, badge = "39795", published = "8/10/2016 1:37:20 AM", modified = "4/17/2024 3:30:24 PM",
    trigger = cheatProtectionReset() && never(levelNumber() != Level3) && 
              measured(tally(24, check_objects(
                  [IronMaiden], [LargeExplosion], [0x10]
    )))
)

achievement(
    title = "Galactic Hunter IV - Moai", points = 10,
    description = "Destroy 50 Moai in Stage 4",
    id = 38857, badge = "39803", published = "8/10/2016 1:37:49 AM", modified = "4/17/2024 3:30:52 PM",
    trigger = cheatProtectionReset() && never(levelNumber() != Level4) && 
              check_moais()
)

achievement(
    title = "Galactic Hunter V - Baos", points = 5,
    description = "Destroy 6 Baos in Stage 6",
    id = 38864, badge = "39812", published = "8/10/2016 1:38:14 AM", modified = "4/17/2024 3:31:06 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 6) &&
              repeated(6, eventId() == 37 && prev(eventId()) != 37) &&
              never(_1WordFrameOrDistanceIndicatorOfCurrentStagePresumed() > 1104) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Galactic Hunter VI - Red Grazia", points = 5,
    description = "Destroy 50 Red Grazias in Stage 7",
    id = 38866, badge = "39814", published = "8/10/2016 1:38:21 AM", modified = "4/17/2024 3:31:17 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 4) &&
              repeated(50, eventId() == 22 && prev(eventId()) != 22) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Galactic Hunter VII - Zub", points = 10,
    description = "Destroy 45 Zubs in Stage 8",
    id = 38870, badge = "39822", published = "8/10/2016 1:38:35 AM", modified = "4/17/2024 3:31:30 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 7) &&
              repeated(45, eventId() == 21 && prev(eventId()) != 21) && never(region() != 96) &&
              disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Galactic Hunter VIII - Hatch", points = 10,
    description = "Destroy 6 Hatches in Stage 9",
    id = 38886, badge = "39849", published = "8/10/2016 5:14:24 PM", modified = "4/17/2024 3:31:43 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 8) &&
              repeated(6, eventId() == 23 && prev(eventId()) != 23) &&
              never(_1WordFrameOrDistanceIndicatorOfCurrentStagePresumedWord() > 1279) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Galactic Hunter IX - Garmaid", points = 10,
    description = "Destroy 7 Garmaids and their remains in Stage 9",
    id = 38878, badge = "39851", published = "8/10/2016 1:39:03 AM", modified = "4/17/2024 3:32:04 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 8) &&
              trigger_when(repeated(7, eventId() == 23 && prev(eventId()) != 23)) &&
              never(_1WordFrameOrDistanceIndicatorOfCurrentStagePresumedWord() < 1791) && disable_when(credits() > 4) &&
              levelNumber() == 8 && gameScreens() >= 3 &&
              ((never(gameScreens() < 3)) ||
               (always_true()) ||
               (measured(repeated(7, eventId() == 23 && prev(eventId()) != 23))))
)

achievement(
    title = "Galactic Hunter X - Goal", points = 10,
    description = "Destroy 10 Goals in Stage 10",
    id = 38880, badge = "39854", published = "8/10/2016 1:39:10 AM", modified = "4/17/2024 3:32:16 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 9) &&
              repeated(10, eventId() == 37 && prev(eventId()) != 37) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Lucky Zone I - Mean Greens", points = 10,
    description = "Collect 3 1-Ups in the first bonus stage",
    id = 38849, badge = "39791", published = "8/10/2016 1:37:13 AM", modified = "4/17/2024 3:32:35 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 11) &&
              repeated(3, eventId() == 126 && prev(eventId()) != 126) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

// Ticket 115891: Does not trigger, after collecting them all, achievement did not pop.
achievement(
    title = "Lucky Zone I - Mellow Yellows", points = 10,
    description = "Collect 35 score items in the first bonus stage",
    id = 38850, badge = "39776", published = "8/10/2016 1:37:17 AM", modified = "4/17/2024 3:32:48 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 11) &&
              repeated(35, eventId() == 98 && prev(eventId()) != byte(0x000062)) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Lucky Zone II - Mean Greens", points = 10,
    description = "Collect 3 1-Ups in the second bonus stage",
    id = 38855, badge = "39800", published = "8/10/2016 1:37:42 AM", modified = "4/17/2024 3:33:04 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 12) &&
              repeated(3, eventId() == 126 && prev(eventId()) != 126) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Lucky Zone II - Mellow Yellows", points = 10,
    description = "Collect 30 score items in the second bonus stage",
    id = 38856, badge = "39801", published = "8/10/2016 1:37:46 AM", modified = "4/17/2024 3:33:17 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 12) &&
              repeated(30, eventId() == 98 && prev(eventId()) != 98) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Lucky Zone III - Mean Greens", points = 10,
    description = "Collect 3 1-Ups in the third bonus stage",
    id = 38859, badge = "39805", published = "8/10/2016 1:37:56 AM", modified = "4/17/2024 3:33:29 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 13) &&
              repeated(3, eventId() == 126 && prev(eventId()) != 126) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Lucky Zone III - Mellow Yellows", points = 10,
    description = "Collect 40 score items in the third bonus stage",
    id = 38860, badge = "39806", published = "8/10/2016 1:37:59 AM", modified = "4/17/2024 3:33:42 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 13) &&
              repeated(40, eventId() == 98 && prev(eventId()) != 98) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Lucky Zone IV - Mean Greens", points = 10,
    description = "Collect 3 1-Ups in the fourth bonus stage",
    id = 38862, badge = "39810", published = "8/10/2016 1:38:07 AM", modified = "4/17/2024 4:47:32 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 10) &&
              repeated(3, eventId() == 126 && prev(eventId()) != 126) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Lucky Zone IV - Mellow Yellows", points = 10,
    description = "Collect 30 score items in the fourth bonus stage",
    id = 38863, badge = "39809", published = "8/10/2016 1:38:10 AM", modified = "4/17/2024 4:47:53 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 10) &&
              repeated(30, eventId() == 98 && prev(eventId()) != 98) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Lucky Zone V - Mean Greens", points = 10,
    description = "Collect 2 1-Ups in the fifth bonus stage",
    id = 38868, badge = "39816", published = "8/10/2016 1:38:28 AM", modified = "4/17/2024 4:48:04 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 14) &&
              repeated(2, eventId() == 126 && prev(eventId()) != 126) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Lucky Zone V - Mellow Yellows", points = 10,
    description = "Collect 35 score items in the fifth bonus stage",
    id = 38869, badge = "39817", published = "8/10/2016 1:38:32 AM", modified = "4/17/2024 4:48:17 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(levelNumber() != 14) &&
              repeated(35, eventId() == 98 && prev(eventId()) != 98) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Konami's Half-off Special", points = 25,
    description = "Have 15 lives",
    id = 38889, badge = "39872", published = "8/11/2016 9:35:33 AM", modified = "4/17/2024 4:48:39 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(gameScreens() != 4) && never(difficultyPlayer1() == 0) && never(player1Lives() < 15) &&
              player1Lives() >= 15 && never(player1Lives() == 255) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Lucrative Pilot", points = 25,
    description = "Score 500,000 points before the end of the first loop",
    id = 38884, badge = "39867", published = "8/10/2016 2:21:25 AM", modified = "4/17/2024 4:48:52 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(byte(0x001F46) < 80) && byte(0x001F46) >= 80 &&
              never(gamestate_2() == 15) && never(loopNumber() != 0) && never(levelNumber() == 0) &&
              disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Capsule Crusher", points = 10,
    description = "Collect 250 power-ups in a single playthrough",
    id = 38853, badge = "39857", published = "8/10/2016 1:37:31 AM", modified = "4/17/2024 4:49:05 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && repeated(250, eventId() == 99) && never(gameScreens() == 1) &&
              never(gamestate_2() == 0) && unless(gamestate_2() == 11) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Unlucky Zone", points = 10,
    description = "Beat the game without entering any bonus stages",
    id = 38843, badge = "39865", published = "8/10/2016 1:36:51 AM", modified = "4/17/2024 4:49:22 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && once(levelNumber() == 0) && once(levelNumber() == 1) &&
              once(levelNumber() == 2) && once(levelNumber() == 3) && once(levelNumber() == 4) &&
              once(levelNumber() == 5) && once(levelNumber() == 6) && once(levelNumber() == 7) &&
              once(levelNumber() == 8) && once(levelNumber() == 9) && once(gamestate_2() == 14) &&
              never(levelNumber() > 9) && never(gamestate_2() == 15) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Fuel Conservation", points = 25,
    description = "Beat the first 4 stages without raising your speed",
    id = 38844, badge = "39871", published = "8/10/2016 1:36:54 AM", modified = "4/17/2024 4:50:16 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(speedModifier() != 0) && never(gameScreens() == 15) &&
              once(levelNumber() == 0) && once(levelNumber() == 1) && once(levelNumber() == 2) &&
              once(levelNumber() == 3) && once(levelNumber() == 5) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Bacterian's Back!", points = 50,
    description = "Beat the second loop",
    id = 38835, badge = "39864", published = "8/10/2016 1:36:13 AM", modified = "4/17/2024 4:50:54 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(gamestate_2() != 15) && never(region() != 60) &&
              loopNumber() == 2 && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "Leaving Lasers Behind", points = 25,
    description = "Beat the game without using any Laser weapons",
    id = 38842, badge = "39870", published = "8/10/2016 1:36:46 AM", modified = "4/17/2024 4:51:05 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && once(levelNumber() == 0) && once(levelNumber() == 1) &&
              once(levelNumber() == 2) && once(levelNumber() == 3) && once(levelNumber() == 4) &&
              once(levelNumber() == 5) && once(levelNumber() == 6) && once(levelNumber() == 7) &&
              once(levelNumber() == 8) && once(levelNumber() == 9) && once(gamestate_2() == 14) &&
              never(primaryWeapon() > 5) && never(gamestate_2() == 15) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "A Long and Lonely Trip", points = 50,
    description = "Beat the game without using any Options",
    id = 38841, badge = "39869", published = "8/10/2016 1:36:42 AM", modified = "4/17/2024 4:51:19 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && once(levelNumber() == 0) && once(levelNumber() == 1) &&
              once(levelNumber() == 2) && once(levelNumber() == 3) && once(levelNumber() == 4) &&
              once(levelNumber() == 5) && once(levelNumber() == 6) && once(levelNumber() == 7) &&
              once(levelNumber() == 8) && once(levelNumber() == 9) && once(gamestate_2() == 14) && never(object2() != 0) &&
              never(gamestate_2() == 15) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "From Legend to Myth", points = 25,
    description = "Beat the game on Hard difficulty or higher",
    id = 38836, badge = "39863", published = "8/10/2016 1:36:25 AM", modified = "4/17/2024 4:51:35 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() < 2) && never(levelNumber() != 9) && eventId() == 131 && never(region() != 60) &&
              disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "A Victory to Defy Grammar", points = 50,
    description = "Beat the game on Arcade difficulty",
    id = 38837, badge = "39861", published = "8/10/2016 1:36:29 AM", modified = "4/17/2024 4:51:48 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() != 3) && never(levelNumber() != 9) && eventId() == 131 && never(region() != 60) &&
              disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

achievement(
    title = "The Ace of Space", points = 25,
    description = "Beat the game without using any continues",
    id = 38838, badge = "39862", published = "8/10/2016 1:36:32 AM", modified = "4/17/2024 4:51:56 PM",
    trigger = disable_when(pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) && never(extraLivesCheat() == 255) &&
              never(difficultyPlayer1() == 0) && never(gamestate_2() == 10) && once(levelNumber() == 0) &&
              once(levelNumber() == 1) && once(levelNumber() == 2) && once(levelNumber() == 3) &&
              once(levelNumber() == 4) && once(levelNumber() == 5) && once(levelNumber() == 6) &&
              once(levelNumber() == 7) && once(levelNumber() == 8) && once(levelNumber() == 9) &&
              once(gamestate_2() == 14) && never(once(gamestate_2() == 15)) && disable_when(credits() > 4) &&
              (always_false() || (never(gameScreens() < 3)))
)

leaderboard(
    id = 1761, title = "Hi-Score - Easy",
    description = "Get the most points before Game Over",
    start  = extraLivesCheatWord() != 255 && difficultyPlayer1() == 0 && _32BitBcdPlayerScore() == 0 &&
             word(0x001F46) == 0 && player1LivesWord() == 2 && gameScreens() != 2,
    cancel = ((pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) ||
              (gameScreens() == 0)),
    submit = gamestate_2() == 9,
    value  = _32BitBcdPlayerScoreLow4() * 1 + _32BitBcdPlayerScoreHigh4() * 10 + low4(0x001F45) * 100 + high4(0x001F45)
                 * 1000 + low4(0x001F46) * 10000 + high4(0x001F46) * 100000 + low4(0x001F47) * 1000000 + high4(0x001F47) *
                 10000000
             ,
    format = "VALUE"
)

leaderboard(
    id = 2592, title = "Hi-Score - Normal",
    description = "Get the most points before Game Over",
    start  = extraLivesCheatWord() != 255 && difficultyPlayer1() == 1 && _32BitBcdPlayerScore() == 0 &&
             word(0x001F46) == 0 && player1LivesWord() == 2 && gameScreens() != 2,
    cancel = ((pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) ||
              (gameScreens() == 0)),
    submit = gamestate_2() == 9,
    value  = _32BitBcdPlayerScoreLow4() * 1 + _32BitBcdPlayerScoreHigh4() * 10 + low4(0x001F45) * 100 + high4(0x001F45)
                 * 1000 + low4(0x001F46) * 10000 + high4(0x001F46) * 100000 + low4(0x001F47) * 1000000 + high4(0x001F47) *
                 10000000
             ,
    format = "VALUE"
)

leaderboard(
    id = 2593, title = "Hi-Score - Hard",
    description = "Get the most points before Game Over",
    start  = extraLivesCheatWord() != 255 && difficultyPlayer1() == 2 && _32BitBcdPlayerScore() == 0 &&
             word(0x001F46) == 0 && player1LivesWord() == 2 && gameScreens() != 2,
    cancel = ((pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) ||
              (gameScreens() == 0)),
    submit = gamestate_2() == 9,
    value  = _32BitBcdPlayerScoreLow4() * 1 + _32BitBcdPlayerScoreHigh4() * 10 + low4(0x001F45) * 100 + high4(0x001F45)
                 * 1000 + low4(0x001F46) * 10000 + high4(0x001F46) * 100000 + low4(0x001F47) * 1000000 + high4(0x001F47) *
                 10000000
             ,
    format = "VALUE"
)

leaderboard(
    id = 2594, title = "Hi-Score - Arcade",
    description = "Get the most points before Game Over",
    start  = extraLivesCheatWord() != 255 && difficultyPlayer1() == 3 && _32BitBcdPlayerScore() == 0 &&
             word(0x001F46) == 0 && player1LivesWord() == 2 && gameScreens() != 2,
    cancel = ((pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) ||
              (gameScreens() == 0)),
    submit = gamestate_2() == 9,
    value  = _32BitBcdPlayerScoreLow4() * 1 + _32BitBcdPlayerScoreHigh4() * 10 + low4(0x001F45) * 100 + high4(0x001F45)
                 * 1000 + low4(0x001F46) * 10000 + high4(0x001F46) * 100000 + low4(0x001F47) * 1000000 + high4(0x001F47) *
                 10000000
             ,
    format = "VALUE"
)

leaderboard(
    id = 3713, title = "Mar 2018 - Leaderboard of the Month 2",
    description = "Hi-Score - Arcade",
    start  = always_false() && extraLivesCheatWord() != 255 && difficultyPlayer1() == 3 && _32BitBcdPlayerScore() == 0 &&
             word(0x001F46) == 0 && player1LivesWord() == 2 && gameScreens() != 2,
    cancel = ((pauseCodeInput2_12OneButtonBeforePowerUpCheat() == 18) ||
              (gameScreens() == 0)),
    submit = gamestate_2() == 9,
    value  = _32BitBcdPlayerScoreLow4() * 1 + _32BitBcdPlayerScoreHigh4() * 10 + low4(0x001F45) * 100 + high4(0x001F45)
                 * 1000 + low4(0x001F46) * 10000 + high4(0x001F46) * 100000 + low4(0x001F47) * 1000000 + high4(0x001F47) *
                 10000000
             ,
    format = "SCORE"
)

rich_presence_display("Stage {0} (Loop {1}) [{2} Mode], Weapon: {3}, Shield Power: {4}, Lives: {5}, Score: {6}",
    rich_presence_lookup("Level", levelNumberLow4(), LevelLookup),
    rich_presence_value("Loop", 1 + loopNumberLow4()),
    rich_presence_lookup("Mode", difficultyPlayer1Low4(), ModeLookup),
    rich_presence_lookup("Weapon", primaryWeaponLow4(), WeaponLookup),
    rich_presence_value("Shieldpower", shieldStrengthLow4()),
    rich_presence_value("Lives", player1Lives()),
    rich_presence_value("Score", high4(0x001F47) * 10000000 + low4(0x001F47) * 1000000 + high4(0x001F46) * 100000 +
                            low4(0x001F46) * 10000 + high4(0x001F45) * 1000 + low4(0x001F45) * 100
                        )
)
