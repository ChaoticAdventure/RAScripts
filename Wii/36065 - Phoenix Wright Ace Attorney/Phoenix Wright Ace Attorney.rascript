// Phoenix Wright: Ace Attorney
// #ID = 36065

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

// Gamestate Functions
function inCE() => Gamestate == 0x601
function inTrial() => Gamestate == 0x301
function inSave() => Gamestate == 0xa00
function inExamine() => Gamestate == 0x406
function inInvestigation() => Gamestate == 0x401
function afterPresent() => Gamestate == 0x700

// Episode Functions
function in1_1() => Part == 0
function in2_1() => Part == 1
function in2_2() => Part == 2
function in2_3() => Part == 3
function in2_4() => Part == 4
function in3_1() => Part == 5
function in3_2() => Part == 6
function in3_3() => Part == 7
function in3_4() => Part == 8
function in3_5() => Part == 9
function in3_6() => Part == 10
function in4_1() => Part == 11
function in4_2() => Part == 12
function in4_3() => Part == 13
function in4_4() => Part == 14
function in4_5() => Part == 15
function in4_6() => Part == 16
function in5_1() => Part == 17
function in5_2() => Part == 18
function in5_3() => Part == 19
function in5_4() => Part == 20
function in5_5() => Part == 21
function in5_6() => Part == 22
function in5_7() => Part == 23
function in5_8() => Part == 24
function in5_9() => Part == 25
function in5_10() => Part == 26

// Talking Functions
function isTalking() => Talking == 1
function notTalking() => Talking == 0

// General Functions
function endPart(P) { return inSave() && prev(Part) == P && Part == P + 1}
function trialPress(P, T1, T2) { return Part == P && inCE() && prev(Text) ==  T1 && Text == T2}
function trialTalk(P, T1, T2) { return Part == P && inTrial() && prev(Text) ==  T1 && Text == T2 }
function examine(P, T1, T2) { return Part == P && inExamine() && prev(Text) ==  T1 && Text == T2 }
function investigationTalk(P, T1, T2) { return Part == P && inInvestigation() && prev(Text) == T1 && Text == T2 }
function present(P, T) { return Part == P && Text == T && prev(inInvestigation()) && afterPresent() }
function pair(T1, T2) { return prev(Text) == T1 && Text == T2 }

function specialExamine(P, T1) { return Part == P && inExamine() && prev(isTalking()) && notTalking() }

// --------------------------- 1-1 ---------------------------
achievement(
    title = "1-1 Fun 1", points = 2, type="missable",
    description = "[Episode 1] Tell the judge that you're the defendant and that Mia was the victim in the case.",
    trigger = Part == 0 && inTrial() && measured(
        tally(2,
            once(pair(0x740084,0x740083)),
            once(pair(0x740088,0x740087)),
            always_false()
        )
    )
)

achievement(
    title = "1-1 Fun 2", points = 2, type="missable",
    description = "[Episode 1] Present something to Larry at the end of the case that reassures him of his girlfriend's love.",
    trigger = trialTalk(0,0x7400ef,0x7400f0)
)

achievement(
    title ="1-1 End", points = 10, type="progression",
    description = "[Episode 1] Complete Episode 1, proving Larry's innocence. Hopefully every case will be that easy!",
    trigger = endPart(0)
)

// --------------------------- 2-1 ---------------------------
achievement(
    title = "2-1 Fun 1", points = 2, type="missable",
    description = "[Episode 2] Get Detective Gumshoe to sing a song by misremembering his name. He's quite the snazzy fellow!",
    trigger = investigationTalk(1, 0x970097, 0x970099)
)

achievement(
    title = "2-1 Fun 2", points = 2, type="missable",
    description = "[Episode 2] Help Maya listen to her sister's voice in the Detention Center.",
    trigger = present(1, 0x9700ea)
)

achievement(
    title ="2-1 End", points = 10, type="progression",
    description = "Desc",
    trigger = endPart(1)
)

// --------------------------- 2-2 ---------------------------
achievement(
    title = "2-2 Fun 1", points = 2, type="missable",
    description = "Desc",
    trigger = trialPress(2, 0x00, 0x00)
)

achievement(
    title = "2-2 Fun 2", points = 2, type="missable",
    description = "Desc",
    trigger = trialPress(2, 0x00, 0x00)
)


achievement(
    title ="2-2 End", points = 10, type="progression",
    description = "Desc",
    trigger = endPart(2)
)

// --------------------------- 2-3 ---------------------------
achievement(
    title = "2-3 Fun 1", points = 2, type="missable",
    description = "Desc",
    trigger = trialPress(3, 0x00, 0x00)
)

achievement(
    title = "2-3 Fun 2", points = 2, type="missable",
    description = "Desc",
    trigger = trialPress(3, 0x00, 0x00)
)

achievement(
    title ="2-3 End", points = 10, type="progression",
    description = "Desc",
    trigger = endPart(3)
)

// --------------------------- 2-4 ---------------------------
achievement(
    title = "2-4 Fun 1", points = 2, type="missable",
    description = "Desc",
    trigger = trialPress(4, 0x00, 0x00)
)

achievement(
    title = "2-4 Fun 2", points = 2, type="missable",
    description = "Desc",
    trigger = trialPress(4, 0x00, 0x00)
)

achievement(
    title ="2-4 End", points = 10, type="progression",
    description = "Desc",
    trigger = endPart(4)
)









rich_presence_conditional_display(word_be(0x110CA508) > 511, "Episode {0}",
    rich_presence_lookup("Episode", byte(0x110CA569), EpisodeLookup)
)

rich_presence_display("Getting ready to solve a case!")
