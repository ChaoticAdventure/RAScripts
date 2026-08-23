// Phoenix Wright: Ace Attorney
// #ID = 36065

// Pointer mask for custom memory map
RA_MASK = 0x1FFFFFFF

// Pointer Function
addr = (v) => v // Dummy accessor for ptr for if the pointed-to address is desired
function ptr(base, offsets, accessor=dword_be) {
    val = base
    val = val & RA_MASK
    
    for i in range(0, length(offsets) - 1) {
        addr = val + offsets[i]
        if (i == length(offsets) - 1) {
            val = accessor(addr)
        }
        else {
            val = dword_be(addr)
            val = val & RA_MASK
        }
    }
    return val
}


// $110ca508: [16-bit BE] Gamestate
Gamestate = word_be(0x110ca508)

// $110ca569: [8-bit] Current Episode/Part
//      0x00= Episode 1-1
//      0x01= Episode 2-1
//      0x02= Episode 2-2
//      0x03= Episode 2-3
//      0x04= Episode 2-4
//      0x05= Episode 3-1
//      0x06= Episode 3-2
//      0x07= Episode 3-3
//      0x08= Episode 3-4
//      0x09= Episode 3-5
//      0x0a= Episode 3-6
//      0x0b= Episode 4-1
//      0x0c= Episode 4-2
//      0x0d= Episode 4-3
//      0x0e= Episode 4-4
//      0x0f= Episode 4-5
//      0x10= Episode 4-6
//      0x11= Episode 5-1
//      0x12= Episode 5-2
//      0x13= Episode 5-3
//      0x14= Episode 5-4
//      0x15= Episode 5-5
//      0x16= Episode 5-6
//      0x17= Episode 5-7
//      0x18= Episode 5-8
//      0x19= Episode 5-9
//      0x1a= Episode 5-10
Part = byte(0x110ca569)

// $110ca524: [8-bit] Talking
Talking = byte(0x110ca524)

// $110ca9a8: [32-bit BE] Text ID
Text = dword_be(0x110ca9a8)


EpisodeLookup = {
    0: "1 - 1",
    1: "2 - 1",
    2: "2 - 2",
    3: "2 - 3",
    4: "2 - 4",
    5: "3 - 1",
    6: "3 - 2",
    7: "3 - 3",
    8: "3 - 4",
    9: "3 - 5",
    10: "3 - 6",
    11: "4 - 1",
    12: "4 - 2",
    13: "4 - 3",
    14: "4 - 4",
    15: "4 - 5",
    16: "4 - 6",
    17: "5 - 1",
    18: "5 - 2",
    19: "5 - 3",
    20: "5 - 4",
    21: "5 - 5",
    22: "5 - 6",
    23: "5 - 7",
    24: "5 - 8",
    25: "5 - 9",
    26: "5 - 10",
}
// Offsets
gamestateOffset = 0x28
gamestateOffsetESDE = 0x29
talkingOffset = 0x44
talkingOffsetESDE = 0x48
partOffset = 0x89
partOffsetESDE = 0x8d
textOffset = 0x4c8

// Bases
baseUS = 0x6f8648
baseFR = 0x6f91a8
baseEU = 0x6f9228
baseITESDE = 0x6f9ea8

// Regions
ESDE = 0x44
US = 0x45
FR = 0x46
IT = 0x49
EU = 0x50

function region() => byte(0x3183)
ESDEArray = [0x44, 0x53]
function isESDE() => any_of(ESDEArray, r => __ornext(region() == r))
function isUS() => region() == 0x45
function isFR() => region() == 0x46
function isIT() => region() == 0x49
function isEU() => region() == 0x50

function gamestate(region) {
    if (region == ESDE) { return ptr(dword_be(baseITESDE), [gamestateOffsetESDE], word_be) }
    if (region == IT) { return ptr(dword_be(baseITESDE), [gamestateOffset], word_be) }
    if (region == US) { return ptr(dword_be(baseUS), [gamestateOffset], word_be) }
    if (region == FR) { return ptr(dword_be(baseFR), [gamestateOffset], word_be) }
    if (region == EU) { return ptr(dword_be(baseEU), [gamestateOffset], word_be) }
}

function talking(region) {
    if (region == ESDE) { return ptr(dword_be(baseITESDE), [talkingOffsetESDE], byte) }
    if (region == IT) { return ptr(dword_be(baseITESDE), [talkingOffset], byte) }
    if (region == US) { return ptr(dword_be(baseUS), [talkingOffset], byte) }
    if (region == FR) { return ptr(dword_be(baseFR), [talkingOffset], byte) }
    if (region == EU) { return ptr(dword_be(baseEU), [talkingOffset], byte) }
}

function part(region) {
    if (region == ESDE) { return ptr(dword_be(baseITESDE), [partOffsetESDE], byte) }
    if (region == IT) { return ptr(dword_be(baseITESDE), [partOffset], byte) }
    if (region == US) { return ptr(dword_be(baseUS), [partOffset], byte) }
    if (region == FR) { return ptr(dword_be(baseFR), [partOffset], byte) }
    if (region == EU) { return ptr(dword_be(baseEU), [partOffset], byte) }
}
function textID(region) {
    if (region == ESDE) { return ptr(dword_be(baseITESDE), [textOffset], dword_be) }
    if (region == IT) { return ptr(dword_be(baseITESDE), [textOffset], dword_be) }
    if (region == US) { return ptr(dword_be(baseUS), [textOffset], dword_be) }
    if (region == FR) { return ptr(dword_be(baseFR), [textOffset], dword_be) }
    if (region == EU) { return ptr(dword_be(baseEU), [textOffset], dword_be) }
}

// Gamestate IDs
CrossExamination = 0x601
Trial = 0x301
Save = 0xa00
Examine = 0x406
Investigation = 0x401
Present = 0x401
PostPresent = 0x700

// General Functions
function endPart(P) { 
    return (gamestate(ESDE) == Save && prev(part(ESDE) == P) && part(ESDE) == P + 1) ||
    (gamestate(IT) == Save && prev(part(IT) == P) && part(IT) == P + 1) ||
    (gamestate(US) == Save && prev(part(US) == P) && part(US) == P + 1) ||
    (gamestate(FR) == Save && prev(part(FR) == P) && part(FR) == P + 1) ||
    (gamestate(EU) == Save && prev(part(EU) == P) && part(EU) == P + 1)
    }
function dialoguePair(P, G, T1, T2) {
    return (part(ESDE) == P && gamestate(ESDE) == G && prev(textID(ESDE)) == T1 && textID(ESDE) == T2) ||
    (part(IT) == P && gamestate(IT) == G && prev(textID(IT)) == T1 && textID(IT) == T2) ||
    (part(US) == P && gamestate(US) == G && prev(textID(US)) == T1 && textID(US) == T2) ||
    (part(FR) == P && gamestate(FR) == G && prev(textID(FR)) == T1 && textID(FR) == T2) ||
    (part(EU) == P && gamestate(EU) == G && prev(textID(EU)) == T1 && textID(EU) == T2)
    }
function dialoguePiece(P, G, T) {
    return (part(ESDE) == P && gamestate(ESDE) == G && textID(ESDE) == T && prev(talking(ESDE) == 1) && talking(ESDE) == 0) ||
    (part(IT) == P && gamestate(IT) == G && textID(IT) == T && prev(talking(IT) == 1) && talking(IT) == 0) ||
    (part(US) == P && gamestate(US) == G && textID(US) == T && prev(talking(US) == 1) && talking(US) == 0) ||
    (part(FR) == P && gamestate(FR) == G && textID(FR) == T && prev(talking(FR) == 1) && talking(FR) == 0) ||
    (part(EU) == P && gamestate(EU) == G && textID(EU) == T && prev(talking(EU) == 1) && talking(EU) == 0)
    }
function present(P, T) {
    return (part(ESDE) == P && textID(ESDE) == T && prev(gamestate(ESDE) == Present) && gamestate(ESDE) == PostPresent) ||
    (part(IT) == P && textID(IT) == T && prev(gamestate(IT) == Present) && gamestate(IT) == PostPresent) ||
    (part(US) == P && textID(US) == T && prev(gamestate(US) == Present) && gamestate(US) == PostPresent) ||
    (part(FR) == P && textID(FR) == T && prev(gamestate(FR) == Present) && gamestate(FR) == PostPresent) ||
    (part(EU) == P && textID(EU) == T && prev(gamestate(EU) == Present) && gamestate(EU) == PostPresent)
    }

function addHits(P, TextIDs) {
    aESDE = never(isESDE() && part(ESDE) != P) && never(isESDE() && gamestate(ESDE) < 0x1ff)
    aIT = never(isIT() && part(IT) != P) && never(isIT() && gamestate(IT) < 0x1ff)
    aUS = never(isUS() && part(US) != P) && never(isUS() && gamestate(US) < 0x1ff)
    aFR = never(isFR() && part(FR) != P) && never(isFR() && gamestate(FR) < 0x1ff)
    aEU = never(isEU() && part(EU) != P) && never(isEU() && gamestate(EU) < 0x1ff)
    valConditionsESDE = []
    valConditionsIT = []
    valConditionsUS = []
    valConditionsFR = []
    valConditionsEU = []
    // Loop through the array using index positions. Step by 2 up to the total length of the array.
    for i in range(0, length(TextIDs) - 1, 2) {
        condition = once(prev(textID(ESDE)) == TextIDs[i] && textID(ESDE) == TextIDs[i + 1])
        array_push(valConditionsESDE, condition)
    }
    for i in range(0, length(TextIDs) - 1, 2) {
        condition = once(prev(textID(IT)) == TextIDs[i] && textID(IT) == TextIDs[i + 1])
        array_push(valConditionsIT, condition)
    }
    for i in range(0, length(TextIDs) - 1, 2) {
        condition = once(prev(textID(US)) == TextIDs[i] && textID(US) == TextIDs[i + 1])
        array_push(valConditionsUS, condition)
    }
    for i in range(0, length(TextIDs) - 1, 2) {
        condition = once(prev(textID(FR)) == TextIDs[i] && textID(FR) == TextIDs[i + 1])
        array_push(valConditionsFR, condition)
    }
    for i in range(0, length(TextIDs) - 1, 2) {
        condition = once(prev(textID(EU)) == TextIDs[i] && textID(EU) == TextIDs[i + 1])
        array_push(valConditionsEU, condition)
    }
    // Calculate total expected pairs and return.
    totalPairs = length(TextIDs) / 2
    return (aESDE && tally(totalPairs, valConditionsESDE)) ||
    (aIT && tally(totalPairs, valConditionsIT)) ||
    (aUS && tally(totalPairs, valConditionsUS)) ||
    (aFR && tally(totalPairs, valConditionsFR)) ||
    (aEU && tally(totalPairs, valConditionsEU))
}


// --------------------------- 1-1 ---------------------------
CH1_1_F1_Delta1 = 0x740084 // 1-1 Phoenix is the defendant
CH1_1_F1_Mem1 = 0x740083 // 1-1 First Question
CH1_1_F1_Delta2 = 0x740088 // 1-1 Mia is the victim
CH1_1_F1_Mem2 = 0x740087 // 1-1 Second Question
CH1_1_F2_Delta = 0x7400ef // 1-1 Statue presented
CH1_1_F2_Mem = 0x7400f0 // 1-1 End


achievement(
    title = "1-1 Fun 1", points = 2, type="missable",
    description = "Desc",
    trigger = addHits(0, [CH1_1_F1_Delta1, CH1_1_F1_Mem1, CH1_1_F1_Delta2, CH1_1_F1_Mem2])
)

achievement(
    title = "1-1 Fun 2", points = 2, type="missable",
    description = "Desc",
    trigger = dialoguePair(0, Trial, CH1_1_F2_Delta, CH1_1_F2_Mem)
)

achievement(
    title ="1-1 End", points = 10, type="progression",
    description = "Desc",
    trigger = endPart(0)
)

// --------------------------- 2-1 ---------------------------
CH2_1_F1_Delta = 0x970097 // 2-1 Suedeshoes
CH2_1_F1_Mem = 0x970099 // 2-1 Post-Suedeshoes
CH2_1_F2_Mem = 0x9700ea // 2-1 Cell Phone

achievement(
    title = "2-1 Fun 1", points = 2, type="missable",
    description = "Desc",
    trigger = dialoguePair(1, Investigation, CH2_1_F1_Delta, CH2_1_F1_Mem)
)

achievement (
    title = "2-1 Fun 2", points = 2, type="missable",
    description = "Desc",
    trigger = present(1, CH2_1_F2_Mem)
)

achievement(
    title ="2-1 End", points = 10, type="progression",
    description = "Desc",
    trigger = endPart(1)
)

// --------------------------- 2-2 ---------------------------
CH2_2_F1_Delta = 0x9e008c // 2-2 Suspicious People
CH2_2_F1_Mem = 0x9e0086 // 2-2 Gumshoe CE 1 S 4
CH2_2_F2_Delta = 0x9e00cb // 2-2 Personal Attacks
CH2_2_F2_Mem = 0x9e00c6 // 2-2 April CE 1 S 2

achievement(
    title = "2-2 Fun 1", points = 2, type="missable",
    description = "Desc",
    trigger = dialoguePair(2, Trial, CH2_2_F1_Delta, CH2_2_F1_Mem)
)

achievement (
    title = "2-2 Fun 2", points = 2, type="missable",
    description = "Desc",
    trigger = dialoguePair(2, Trial, CH2_2_F2_Delta, CH2_2_F2_Mem)
)

achievement(
    title ="2-2 End", points = 10, type="progression",
    description = "Desc",
    trigger = endPart(2)
)

// --------------------------- 2-3 ---------------------------
CH2_3_F1_Delta = 0
CH2_3_F1_Mem = 0
CH2_3_F2_Delta = 0
CH2_3_F2_Mem = 0

achievement(
    title = "2-3 Fun 1", points = 2, type="missable",
    description = "Desc",
    trigger = dialoguePair(3, Investigation, CH2_3_F1_Delta, CH2_3_F1_Mem)
)

achievement (
    title = "2-3 Fun 2", points = 2, type="missable",
    description = "Desc",
    trigger = dialoguePair(3, Investigation, CH2_3_F2_Delta, CH2_3_F2_Mem)
)

achievement(
    title ="2-3 End", points = 10, type="progression",
    description = "Desc",
    trigger = endPart(3)
)






rich_presence_conditional_display(word_be(0x110CA508) > 511, "Episode {0}",
    rich_presence_lookup("Episode", byte(0x110CA569), EpisodeLookup)
)

rich_presence_display("Getting ready to solve a case!")

