// Phoenix Wright: Ace Attorney - Trials and Tribulations
// #ID = 36067

// Pointer mask for custom memory map
RA_MASK = 0x1FFFFFFF

// Pointer function blatantly stolen from Souzooka
addr = (v) => v // Dummy accessor for ptr for if the pointed-to address is desired
function ptr(base, offsets, accessor=dword_be)
{
    val = base
    val = val & RA_MASK
    
    for i in range(0, length(offsets) - 1)
    {
        addr = val + offsets[i]
        if (i == length(offsets) - 1)
        {
            val = accessor(addr)
        }
        else
        {
            val = dword_be(addr)
            val = val & RA_MASK
        }
    }
    
    return val
}

function gamestate() => ptr(dword_be(0x22b140), [0x178, 0x1c, 0x8, 0x49], word_be)
function talking() => ptr(dword_be(0x22b140), [0x178, 0x1c, 0x8, 0x68], byte)
function currentEpisodePart() => ptr(dword_be(0x22b140), [0x178, 0x1c, 0x8, 0xc9], byte)
function textId() => ptr(dword_be(0x22b140), [0x178, 0x1c, 0x8, 0x5e8], dword_be)

EpisodeLookup = {
    0: "1 - Cross-Examining Phoenix Wright",
    1: "1 - Cross-Examining Dahlia Hawthorne",
    2: "2 - Collecting evidence about Mask DeMasque",
    3: "2 - Cross-Examining Luke Atmey and Ron DeLite",
    4: "2 - Collecting evidence about the true culprit",
    5: "2 - Cross-Examining Ron DeLite",
    6: "2 - Cross-Examining Luke Atmey",
    7: "3 - Collecting evidence about Tres Bien",
    8: "3 - Cross-Examining Victor Kudo",
    9: "3 - Collecting evidence about Viola and Tigre",
    10: "3 - Cross-Examining Jean Armstrong",
    11: "3 - Cross-Examining Furio Tigre",
    12: "4 - Cross-Examining Melissa Foster",
    13: "4 - Cross-Examining Melissa Foster and Terry Fawles",
    14: "5 - Collecting evidence before a crime even takes place",
    15: "5 - Collecting evidence as Miles Edgeworth",
    16: "5 - Cross-Examining Bikini as Miles Edgeworth",
    17: "5 - Cross-Examining Larry Butz as Miles Edgeworth",
    18: "5 - Collecting evidence about the scene of the crime",
    19: "5 - Collecting evidence about the circumstances of the crime",
    20: "5 - Cross-Examining Sister Iris",
    21: "5 - Cross-Examining the deceased",
    22: "5 - Cross-Examining Maya Fey",
}

achievement(
    title = "Violence Is Sometimes the Answer", points = 2, type="missable",
    description = "[Episode 1] Bring Mia to violence while pressing during Phoenix's second testimony. Never underestimate the muscle of a mystic.",
    id = 630778, badge = "717943", published = "8/15/2026 2:04:26 PM", modified = "8/15/2026 2:04:26 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 0 && prev(textId()) == 5439652 && textId() == 5439646
)

achievement(
    title = "In the Nick of Time", points = 10, type="progression",
    description = "[Episode 1] Fully complete Phoenix Wright's testimony and postpone the trial for as long as you can. Not everything is as it seems here.",
    id = 630779, badge = "717944", published = "8/15/2026 2:04:27 PM", modified = "8/15/2026 2:04:27 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 0 && currentEpisodePart() == 1
)

achievement(
    title = "A Man of Many Monikers", points = 2, type="missable",
    description = "[Episode 1] Learn about the judge's fantastic nicknames while pressing during Dahlia's third testimony. Wonder if he's open to a few extra labels after the trial...",
    id = 630780, badge = "717945", published = "8/15/2026 2:04:27 PM", modified = "8/15/2026 2:04:27 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 1 && prev(textId()) == 6422716 && textId() == 6422707
)

achievement(
    title = "Unmasking the Truth", points = 10, type="progression",
    description = "[Episode 1] Discover the true culprit and complete Episode 1. There's more to this than meets the eye...",
    id = 630781, badge = "717946", published = "8/15/2026 2:04:27 PM", modified = "8/15/2026 2:04:27 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 1 && currentEpisodePart() == 2
)

achievement(
    title = "Musings of a Mystic and a Mouthpiece", points = 2, type="missable",
    description = "[Episode 2] Rehash an old conversation while examining your surroundings in the Basement Warehouse.",
    id = 630782, badge = "717947", published = "8/15/2026 2:04:27 PM", modified = "8/15/2026 2:04:27 PM",
    trigger = gamestate() == 1030 && currentEpisodePart() == 2 && prev(textId()) == 16449854 && textId() == 16449912
)

achievement(
    title = "Incompetent Investigators", points = 2, type="missable",
    description = "[Episode 2] Discover things that make you question the police force's competency while examining your surroundings in DeMasque's Hideout.",
    id = 630783, badge = "717948", published = "8/15/2026 2:04:28 PM", modified = "8/15/2026 2:04:28 PM",
    trigger = gamestate() == 1030 &&
              ((currentEpisodePart() == 2 && prev(textId()) == 7667911 && textId() == 7667954) ||
               (currentEpisodePart() == 4 && prev(textId()) == 6553801 && textId() == 6553827))
)

achievement(
    title = "Psychic Picklock", points = 5, type="progression",
    description = "[Episode 2] Break Luke Atmey's Psyche-Lock by proving that he didn't see what he says he saw. Ace Detective? More like Ace Liar...",
    id = 630784, badge = "717949", published = "8/15/2026 2:04:28 PM", modified = "8/15/2026 2:04:28 PM",
    trigger = currentEpisodePart() == 2 && textId() == 16449897 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "Sleazebutz", points = 2, type="missable",
    description = "[Episode 2] Have an extremely odd conversation with Larry about Pearl in DeMasque's Hideout. ...Why are you friends with this guy again?",
    id = 630785, badge = "717950", published = "8/15/2026 2:04:28 PM", modified = "8/15/2026 2:04:28 PM",
    trigger = currentEpisodePart() == 2 && textId() == 7667938 && prev(gamestate()) == 1025 && gamestate() == 1792
)

achievement(
    title = "Time to Tango", points = 10, type="progression",
    description = "[Episode 2] Complete Day 1 of investigation. Hopefully this will be enough to win the case!",
    id = 630786, badge = "717951", published = "8/15/2026 2:04:29 PM", modified = "8/15/2026 2:04:29 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 2 && currentEpisodePart() == 3
)

achievement(
    title = "War of the Witless", points = 2, type="missable",
    description = "[Episode 2] Call out Luke Atmey for being a moron and get called out right back while pressing his second testimony. What kind of name is that anyways?",
    id = 630787, badge = "717952", published = "8/15/2026 2:04:29 PM", modified = "8/15/2026 2:04:29 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 3 && prev(textId()) == 5046431 && textId() == 5046426
)

achievement(
    title = "Huh? What? Oh, Uhh... Right...", points = 2, type="missable",
    description = "[Episode 2] Express your confusion and make the judge confused as well while pressing Luke Atmey's third testimony. Is anyone else a little lost?",
    id = 630788, badge = "717953", published = "8/15/2026 2:04:29 PM", modified = "8/15/2026 2:04:29 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 3 && prev(textId()) == 5046449 && textId() == 5046436
)

achievement(
    title = "A DeLiteful Day Ruined by a Sudden, Serious Situation", points = 10, type="progression",
    description = "[Episode 2] Prove that Ron DeLite is not Masque DeMasque, completing Day 1 of court. But now he's the prime suspect for a far more serious crime...",
    id = 630789, badge = "717954", published = "8/15/2026 2:04:29 PM", modified = "8/15/2026 2:04:29 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 3 && currentEpisodePart() == 4
)

achievement(
    title = "The Life of a Creative", points = 2, type="missable",
    description = "[Episode 2] Speculate about the amount of socialization a painter got while examining your surroundings in the CEO's Office. Wonder who gets more, attorneys or painters?",
    id = 630790, badge = "717955", published = "8/15/2026 2:04:30 PM", modified = "8/15/2026 2:04:30 PM",
    trigger = gamestate() == 1030 && currentEpisodePart() == 4 && prev(textId()) == 12452084 && textId() == 12452156
)

achievement(
    title = "Turnabout Trauma", points = 2, type="missable",
    description = "[Episode 2] Not-so-fondly remember a past witness while examining your surroundings in the Security Room. Yeesh! Let's move on to literally anything else.",
    id = 630791, badge = "717956", published = "8/15/2026 2:04:30 PM", modified = "8/15/2026 2:04:30 PM",
    trigger = gamestate() == 1030 && currentEpisodePart() == 4 && prev(textId()) == 12452114 && textId() == 12452157
)

achievement(
    title = "Lying Larry, Bumbling Butz", points = 5, type="progression",
    description = "[Episode 2] Break Larry Butz's Psyche-Locks by proving that he wasn't in his office the entire night. How professional...",
    id = 630792, badge = "717957", published = "8/15/2026 2:04:30 PM", modified = "8/15/2026 2:04:30 PM",
    trigger = currentEpisodePart() == 4 && textId() == 12452155 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "Breaking Locks and Mental Blocks", points = 5, type="progression",
    description = "[Episode 2] Break Adrian Andrews's Psyche-Locks by proving that she broke something \"precious\". Oh boy, not again...",
    id = 630793, badge = "717958", published = "8/15/2026 2:04:30 PM", modified = "8/15/2026 2:04:30 PM",
    trigger = currentEpisodePart() == 4 && textId() == 16777594 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "The Murk of Mystery", points = 10, type="progression",
    description = "[Episode 2] Complete Day 2 of investigation, with more evidence at hand. Surely it will be useful, as soon as you figure out what your argument is...",
    id = 630794, badge = "717959", published = "8/15/2026 2:04:31 PM", modified = "8/15/2026 2:04:31 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 4 && currentEpisodePart() == 5
)

achievement(
    title = "The Path of Truth and the Duty of the Defence", points = 10, type="progression",
    description = "[Episode 2] Finish Ron DeLite's testimony and bring in someone who you think might be the real culprit! Now all that's left is to make them confess...",
    id = 630795, badge = "717960", published = "8/15/2026 2:04:31 PM", modified = "8/15/2026 2:04:31 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 5 && currentEpisodePart() == 6
)

achievement(
    title = "Doppio Delight", points = 2, type="missable",
    description = "[Episode 2] Watch Godot's stellar impression of Desirée DeLite while pressing during Luke Atmey's third testimony. Was that Godot or Mrs. DeLite? It's hard to tell!",
    id = 630796, badge = "717961", published = "8/15/2026 2:04:31 PM", modified = "8/15/2026 2:04:31 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 6 && prev(textId()) == 4784312 && textId() == 4784304
)

achievement(
    title = "Kintsugi", points = 2, type="missable",
    description = "[Episode 2] Show Ron DeLite something that will make him feel better at the end of the trial. It'll be alright, Mr. DeLite.",
    id = 630797, badge = "717962", published = "8/15/2026 2:04:31 PM", modified = "8/15/2026 2:04:31 PM",
    trigger = gamestate() == 769 && currentEpisodePart() == 6 && prev(textId()) == 4784276 && textId() == 4784277
)

achievement(
    title = "Trite on the Money!", points = 10, type="progression",
    description = "[Episode 2] Discover the true culprit and complete Episode 2, with a bit of help from an unlikely source!",
    id = 630798, badge = "717963", published = "8/15/2026 2:04:32 PM", modified = "8/15/2026 2:04:32 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 6 && currentEpisodePart() == 7
)

achievement(
    title = "Winners Bite Medals, Weirdos Bite Badges", points = 2, type="missable",
    description = "[Episode 3] See Maggey Byrde bite your badge. I hope she didn't leave any teeth marks on it...",
    id = 630799, badge = "717964", published = "8/15/2026 2:04:32 PM", modified = "8/15/2026 2:04:32 PM",
    trigger = currentEpisodePart() == 7 && textId() == 5177501 && prev(gamestate()) == 1025 && gamestate() == 1792
)

achievement(
    title = "A Man of Few Skills", points = 2, type="missable",
    description = "[Episode 3] Read one of Jean Armstrong's poems while investigating your surroundings in Trés Bien's Kitchen. He shouldn't quit his day job... Or maybe he should, he's bad at that too...",
    id = 630800, badge = "717965", published = "8/15/2026 2:04:32 PM", modified = "8/15/2026 2:04:32 PM",
    trigger = gamestate() == 1030 &&
              ((currentEpisodePart() == 7 && textId() == 14090531 && prev(talking()) == 1 && talking() == 0) ||
               (currentEpisodePart() == 9 && prev(textId()) == 12517664 && textId() == 12517692))
)

achievement(
    title = "Prying the Truth from a Pervert", points = 5, type="progression",
    description = "[Episode 3] Break the Old Man's Psyche-Locks by determining the reason he goes to Trés Bien. It certainly isn't for the quality of the food...",
    id = 630801, badge = "717966", published = "8/15/2026 2:04:33 PM", modified = "8/15/2026 2:04:33 PM",
    trigger = currentEpisodePart() == 7 && textId() == 14090573 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "If You Can't Handle the Heat...", points = 5, type="progression",
    description = "[Episode 3] Break Jean Armstrong's Psyche-Locks by proving that he stole something valuable. Très bien! A job well done!",
    id = 630802, badge = "717967", published = "8/15/2026 2:04:33 PM", modified = "8/15/2026 2:04:33 PM",
    trigger = currentEpisodePart() == 7 && textId() == 14090529 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "Underdog at Law", points = 10, type="progression",
    description = "[Episode 3] Complete Day 1 of investigation. You'll try your best to get Maggey off innocent, but it feels like you don't have the full picture yet...",
    id = 630803, badge = "717968", published = "8/15/2026 2:04:33 PM", modified = "8/15/2026 2:04:33 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 7 && currentEpisodePart() == 8
)

achievement(
    title = "Kudos, I Suppose...", points = 2, type="missable",
    description = "[Episode 3] Have Phoenix award Victor Kudo with a surprisingly meaningful title while pressing Victor's first testimony. Heh, take that, old man!",
    id = 630804, badge = "717969", published = "8/15/2026 2:04:34 PM", modified = "8/15/2026 2:04:34 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 8 && prev(textId()) == 5767360 && textId() == 5767344
)

achievement(
    title = "The One Time I Wish My Badge Was Bigger", points = 5, type="missable",
    description = "[Episode 3] Without leaving the episode, get pelted by seeds four separate times while pressing Victor Kudo's second testimony. Ouch! There are no birds in this courtroom! H-Hey!",
    id = 630805, badge = "717970", published = "8/15/2026 2:04:34 PM", modified = "8/15/2026 2:04:34 PM",
    trigger = never(gamestate() < 511) && gamestate() == 1537 && currentEpisodePart() == 8 &&
              measured(tally(4, once(prev(textId()) == 5767378 && textId() == 5767373),
                  once(prev(textId()) == 5767379 && textId() == 5767374),
                  once(prev(textId()) == 5767380 && textId() == 5767375),
                  once(prev(textId()) == 5767381 && textId() == 5767376))
              )
)

achievement(
    title = "An Empty Bag of Seeds", points = 10, type="progression",
    description = "[Episode 3] Finish Victor Kudo's testimony by proving that his memory is looser than those bird seeds, and postpone the trial by a day. The less said about this guy the better.",
    id = 630806, badge = "717971", published = "8/15/2026 2:04:34 PM", modified = "8/15/2026 2:04:34 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 8 && currentEpisodePart() == 9
)

achievement(
    title = "One Man's Half Makes Another's Half Whole", points = 5, type="progression",
    description = "[Episode 3] Break Dick Gumshoe's Psyche-Lock by proving what he was listening to on the radio. Any prize money is a step closer to better food, Detective.",
    id = 630807, badge = "717972", published = "8/15/2026 2:04:34 PM", modified = "8/15/2026 2:04:34 PM",
    trigger = currentEpisodePart() == 9 && textId() == 12517638 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "Diffident Detective", points = 2, type="missable",
    description = "[Episode 3] Watch Gumshoe deny his feelings about Maggey Byrde, and let Maya insult him while you're at it!",
    id = 630808, badge = "717973", published = "8/15/2026 2:04:35 PM", modified = "8/15/2026 2:04:35 PM",
    trigger = currentEpisodePart() == 9 && textId() == 12517644 && prev(gamestate()) == 1025 && gamestate() == 1792
)

achievement(
    title = "Cracking the Code", points = 5, type="progression",
    description = "[Episode 3] Break Lisa Basil's Psyche-Locks by proving she knows what Glen had problems with. This sort of feels like interacting with a computer...",
    id = 630809, badge = "717974", published = "8/15/2026 2:04:35 PM", modified = "8/15/2026 2:04:35 PM",
    trigger = currentEpisodePart() == 9 && textId() == 6095063 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "Phoenix Wright and the Mini Mystic", points = 5, type="missable",
    description = "[Episode 3] Without leaving the episode, let Viola offer you donuts, pretzels, tomatoes, and eggs while trying to break her Psyche-Locks, and avoid being poisoned by refusing to eat any of them. Thanks, but no thanks!",
    id = 630810, badge = "717975", published = "8/15/2026 2:04:35 PM", modified = "8/15/2026 2:04:35 PM",
    trigger = never(gamestate() < 511) && currentEpisodePart() == 9 && gamestate() == 1035 &&
              tally(4, once(prev(textId()) == 16122211 && textId() == 16122210),
                  once(prev(textId()) == 16122214 && textId() == 16122213),
                  once(prev(textId()) == 16122217 && textId() == 16122216),
                  once(prev(textId()) == 16122220 && textId() == 16122219)
              )
)

achievement(
    title = "A Tragic Tale", points = 5, type="progression",
    description = "[Episode 3] Break Viola Cadaverini's Psyche-Locks by proving that you know exactly what happened to her and who did it, even if it was an accident.",
    id = 630811, badge = "717976", published = "8/15/2026 2:04:35 PM", modified = "8/15/2026 2:04:35 PM",
    trigger = currentEpisodePart() == 9 && textId() == 16122224 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "Carving Out the Culinary Conundrum", points = 10, type="progression",
    description = "[Episode 3] Complete Day 2 of investigation. You're starting to put together the full picture. But exactly what happened in that restaurant?",
    id = 630812, badge = "717977", published = "8/15/2026 2:04:36 PM", modified = "8/15/2026 2:04:36 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 9 && currentEpisodePart() == 10
)

achievement(
    title = "A Visor Only a Mother Could Love", points = 2, type="missable",
    description = "[Episode 3] See Godot make an astute and slightly insulting observation about the \"normality\" of Phoenix, Maya, and himself while pressing Jean Armstrong's first testimony. Take a look in the mirror, pal.",
    id = 630813, badge = "717978", published = "8/15/2026 2:04:36 PM", modified = "8/15/2026 2:04:36 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 10 && prev(textId()) == 6422669 && textId() == 6422662
)

achievement(
    title = "Layers of Lies and Tempering the Truth", points = 10, type="progression",
    description = "[Episode 3] Complete Jean Armstrong's testimony and take a recess. Now all that's left is to get a confession out of the true culprit!",
    id = 630814, badge = "717979", published = "8/15/2026 2:04:36 PM", modified = "8/15/2026 2:04:36 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 10 && currentEpisodePart() == 11
)

achievement(
    title = "Sampling the Substantiation", points = 2, type="missable",
    description = "[Episode 3] Get the judge to bring up a past case where someone may or may not have eaten evidence by pressing Furio Tigre's second testimony. Evidence can't taste good... Unless it's apple based...",
    id = 630815, badge = "717980", published = "8/15/2026 2:04:36 PM", modified = "8/15/2026 2:04:36 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 11 && prev(textId()) == 6357151 && textId() == 6357146
)

achievement(
    title = "Ace Klutz", points = 2, type="missable",
    description = "[Episode 3] Learn exactly how reliable Maya thinks Phoenix is while pressing Furio Tigre's fourth testimony. Oh, come on! Objection!",
    id = 630816, badge = "717981", published = "8/15/2026 2:04:37 PM", modified = "8/15/2026 2:04:37 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 11 && prev(textId()) == 6357191 && textId() == 6357177
)

achievement(
    title = "Gentle Giant", points = 2, type="missable",
    description = "[Episode 3] Show Maggey Byrde something to cheer her up at the end of the trial. A heartwarming conclusion is the best type of ending.",
    id = 630817, badge = "717982", published = "8/15/2026 2:04:37 PM", modified = "8/15/2026 2:04:37 PM",
    trigger = gamestate() == 769 && currentEpisodePart() == 11 && prev(textId()) == 6357133 && textId() == 6357134
)

achievement(
    title = "Youse Did Good", points = 10, type="progression",
    description = "[Episode 3] Complete Episode 3 by proving that the culprit was in a lot more trouble than anyone anticipated. Maggey was innocent all along!",
    id = 630818, badge = "717983", published = "8/15/2026 2:04:37 PM", modified = "8/15/2026 2:04:37 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 11 && currentEpisodePart() == 12
)

achievement(
    title = "An Upstanding Citizen", points = 2, type="missable",
    description = "[Episode 4] Talk in detail about what kind of person the witness is while pressing Gumshoe's second testimony. She doesn't seem abnormal, right?",
    id = 630819, badge = "717984", published = "8/15/2026 2:04:37 PM", modified = "8/15/2026 2:04:37 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 12 && prev(textId()) == 4653214 && textId() == 4653209
)

achievement(
    title = "Chili and Chocolate", points = 2, type="missable",
    description = "[Episode 4] Have Diego Armando tell you to try putting salt in your coffee during Melissa Foster's second testimony. Hey, you never know...",
    id = 630820, badge = "717985", published = "8/15/2026 2:04:38 PM", modified = "8/15/2026 2:04:38 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 12 && prev(textId()) == 4653196 && textId() == 4653187
)

achievement(
    title = "Deceptive Demeanor", points = 10, type="progression",
    description = "[Episode 4] Make the judge call a recess by proving that something is fishy with the witness. Surely you know who this witness is, right?",
    id = 630821, badge = "717986", published = "8/15/2026 2:04:38 PM", modified = "8/15/2026 2:04:38 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 12 && currentEpisodePart() == 13
)

achievement(
    title = "Are You Sure About That?", points = 2, type="missable",
    description = "[Episode 4] Listen to the judge call Terry Fawles a clever fellow during Melissa Foster's fourth testimony. That's probably the nicest thing he's heard about himself in some time...",
    id = 630822, badge = "717987", published = "8/15/2026 2:04:38 PM", modified = "8/15/2026 2:04:38 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 13 && prev(textId()) == 3932340 && textId() == 3932334
)

achievement(
    title = "The Trials and Tribulations of Tragedy", points = 10, type="progression",
    description = "[Episode 4] Complete Episode 4 on a somber note. Hard to believe that this was Mia's first ever case...",
    id = 630823, badge = "717988", published = "8/15/2026 2:04:38 PM", modified = "8/15/2026 2:04:38 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 13 && currentEpisodePart() == 14
)

achievement(
    title = "Pronunciation Is Snow Big Deal!", points = 2, type="missable",
    description = "[Episode 5] Listen to Maya mangle the pronunciation of \"snowmobile\" a few too many times while examining your surroundings by the Main Gate.",
    id = 630824, badge = "717989", published = "8/15/2026 2:04:38 PM", modified = "8/15/2026 2:04:38 PM",
    trigger = gamestate() == 1030 && currentEpisodePart() == 14 && prev(textId()) == 4259972 && textId() == 4260031
)

achievement(
    title = "Mark of a Hero", points = 10, type="progression",
    description = "[Episode 5] Complete Day 1 of investigation. Of course, no trip could ever be normal...",
    id = 630825, badge = "717990", published = "8/15/2026 2:04:39 PM", modified = "8/15/2026 2:04:39 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 14 && currentEpisodePart() == 15
)

achievement(
    title = "Don't Let Your Dreams Be Dreams", points = 2, type="missable",
    description = "[Episode 5] Remind Larry of Edgeworth's childhood dream... and remind Edgeworth why he hates childhood friends.",
    id = 630826, badge = "717991", published = "8/15/2026 2:04:39 PM", modified = "8/15/2026 2:04:39 PM",
    trigger = currentEpisodePart() == 15 && prev(gamestate()) == 1025 && gamestate() == 1792 && textId() == 5898417
)

achievement(
    title = "Unlocking and Unearthing the Undisclosed", points = 5, type="progression",
    description = "[Episode 5] Break Iris's Psyche-Locks by showing what scared her into leaving the Temple. This is going to be a long, long investigation...",
    id = 630827, badge = "717992", published = "8/15/2026 2:04:39 PM", modified = "8/15/2026 2:04:39 PM",
    trigger = currentEpisodePart() == 15 && textId() == 5898408 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "Stop and Stare", points = 2, type="missable",
    description = "[Episode 5] Get glared at and glare right back while examining your surroundings in the Detention Center. It helps if you squint occasionally, you know.",
    id = 630828, badge = "717993", published = "8/15/2026 2:04:39 PM", modified = "8/15/2026 2:04:39 PM",
    trigger = gamestate() == 1030 && currentEpisodePart() == 15 && (textId() == 5898371 || textId() == 5898372) &&
              prev(talking()) == 1 && talking() == 0
)

achievement(
    title = "The Precision of a Prosecutor", points = 2, type="missable",
    description = "[Episode 5] Remind Larry of arts and crafts he did as a kid with Edgeworth and receive a compliment on Edgeworth's crafting skills as an adult while investigating your surroundings near Heavenly Hall.",
    id = 630829, badge = "717994", published = "8/15/2026 2:04:39 PM", modified = "8/15/2026 2:04:39 PM",
    trigger = gamestate() == 1030 && currentEpisodePart() == 15 && textId() == 5898427 && prev(talking()) == 1 &&
              talking() == 0
)

achievement(
    title = "Desperate Deaxunim Dares to Dream", points = 5, type="progression",
    description = "[Episode 5] Break Larry's Psyche-Locks by proving what he was doing at the time of the fire. It's beginning to smell around here...",
    id = 630830, badge = "717995", published = "8/15/2026 2:04:40 PM", modified = "8/15/2026 2:04:40 PM",
    trigger = currentEpisodePart() == 15 && textId() == 5898453 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "Look at Me Now, Father...", points = 10, type="progression",
    description = "[Episode 5] Complete Day 2 of investigation. Hopefully that's enough evidence for a man who's never defended anyone before!",
    id = 630831, badge = "717996", published = "8/15/2026 2:04:40 PM", modified = "8/15/2026 2:04:40 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 15 && currentEpisodePart() == 16
)

achievement(
    title = "Foolish Fools Fooling Around", points = 2, type="missable",
    description = "[Episode 5] Make Franziska von Karma threaten to whip anyone who laughs while pressing Bikini's second testimony. Hold it in and save yourself a visit to the emergency room!",
    id = 630832, badge = "717997", published = "8/15/2026 2:04:40 PM", modified = "8/15/2026 2:04:40 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 16 && prev(textId()) == 6357155 && textId() == 6357145
)

achievement(
    title = "Stacking Up the Truth", points = 10, type="progression",
    description = "[Episode 5] Complete Bikini's testimony and take a recess. Next up will be cross-examining a man that somehow manages to cause problems, even when he's trying his best.",
    id = 630833, badge = "717998", published = "8/15/2026 2:04:40 PM", modified = "8/15/2026 2:04:40 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 16 && currentEpisodePart() == 17
)

achievement(
    title = "Cracking a Creative Into Kilter", points = 2, type="missable",
    description = "[Episode 5] Listen to Franziska von Karma berate Larry over sketching in a notebook while pressing Larry's third testimony. She is right about this. Sorry, Larry!",
    id = 630834, badge = "717999", published = "8/15/2026 2:04:41 PM", modified = "8/15/2026 2:04:41 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 17 && prev(textId()) == 5308595 && textId() == 5308586
)

achievement(
    title = "The Art of the Testimony", points = 10, type="progression",
    description = "[Episode 5] Complete Larry's testimony, ending Day 1 of court. Time to hand the reigns back over to the expert!",
    id = 630835, badge = "718000", published = "8/15/2026 2:04:41 PM", modified = "8/15/2026 2:04:41 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 17 && currentEpisodePart() == 18
)

achievement(
    title = "Smacking the Sleepiness Out of Scruffy", points = 2, type="missable",
    description = "[Episode 5] See Franziska von Karma scold Gumshoe over being sleepy while investigating your surroundings in the Garden. He definitely doesn't get paid enough for this.",
    id = 630836, badge = "718001", published = "8/15/2026 2:04:41 PM", modified = "8/15/2026 2:04:41 PM",
    trigger = gamestate() == 1030 && currentEpisodePart() == 18 && textId() == 9044202 && prev(talking()) == 1 &&
              talking() == 0
)

achievement(
    title = "Defogging Mystifying Circumstances", points = 5, type="progression",
    description = "[Episode 5] Break Bikini's Psyche-Locks by proving who Elise Deauxnim really was. Of all the things... Just how deep does this go?",
    id = 630837, badge = "718002", published = "8/15/2026 2:04:42 PM", modified = "8/15/2026 2:04:42 PM",
    trigger = currentEpisodePart() == 18 && textId() == 4980921 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "Catastrophic Circumstances", points = 10, type="progression",
    description = "[Episode 5] Complete a bit of investigation before an earthquake hits, throwing everything into chaos. I-Is everyone okay?!",
    id = 630838, badge = "718003", published = "8/15/2026 2:04:42 PM", modified = "8/15/2026 2:04:42 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 18 && currentEpisodePart() == 19
)

achievement(
    title = "Authorities and Ladders", points = 3, type="missable",
    description = "[Episode 5] Fully complete the ladder versus stepladder debacle while investigating your surroundings with a metal detector in the Courtyard. Somehow, all roads lead to this debate.",
    id = 630839, badge = "718004", published = "8/15/2026 2:04:42 PM", modified = "8/15/2026 2:04:42 PM",
    trigger = gamestate() == 1036 && currentEpisodePart() == 19 && textId() == 15073605 && prev(talking()) == 1 &&
              talking() == 0
)

achievement(
    title = "A Tale of Two", points = 10, type="progression",
    description = "[Episode 5] Break Iris's Psyche-Locks by proving that somehow, she was actually able to be in two places at once. With each new detail, the plot only gets thicker.",
    id = 630840, badge = "718005", published = "8/15/2026 2:04:42 PM", modified = "8/15/2026 2:04:42 PM",
    trigger = currentEpisodePart() == 19 && textId() == 4522141 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "Deceiving a Darling Daughter", points = 10, type="progression",
    description = "[Episode 5] Break Pearl Fey's Psyche-Locks by putting together what she did, and why, on the night of the murder. That poor, poor girl...",
    id = 630841, badge = "718006", published = "8/15/2026 2:04:42 PM", modified = "8/15/2026 2:04:42 PM",
    trigger = currentEpisodePart() == 19 && textId() == 15073544 && prev(gamestate()) == 1035 && gamestate() == 1025
)

achievement(
    title = "Bearing the Brunt of Our Burdens", points = 10, type="progression",
    description = "[Episode 5] Complete Day 2 of investigation. It doesn't seem like enough evidence, but you might be able to pull off a miracle!",
    id = 630842, badge = "718007", published = "8/15/2026 2:04:43 PM", modified = "8/15/2026 2:04:43 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 19 && currentEpisodePart() == 20
)

achievement(
    title = "The Enemy of My Enemy", points = 2, type="missable",
    description = "[Episode 5] Convince Godot to point out a contradiction in Iris's words while pressing her third testimony. Thanks for the assist!",
    id = 630843, badge = "718008", published = "8/15/2026 2:04:43 PM", modified = "8/15/2026 2:04:43 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 20 && once(textId() == 4325562) &&
              prev(textId()) == 4325561 && textId() == 4325549 && never(textId() < 4325549)
)

achievement(
    title = "Wright Anything Agency", points = 2, type="missable",
    description = "[Episode 5] Tell the court that Larry's sketch shows exactly what happened while presenting evidence on Iris's fourth testimony. Pretty neat trick, huh?",
    id = 630844, badge = "718009", published = "8/15/2026 2:04:43 PM", modified = "8/15/2026 2:04:43 PM",
    trigger = gamestate() == 769 && currentEpisodePart() == 20 && prev(textId()) == 4325519 && textId() == 4325518
)

achievement(
    title = "Like a Phoenix Rising from the Ashes", points = 10, type="progression",
    description = "[Episode 5] Complete Iris's testimony. The next witness will really test your patience!",
    id = 630845, badge = "718010", published = "8/15/2026 2:04:43 PM", modified = "8/15/2026 2:04:43 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 20 && currentEpisodePart() == 21
)

achievement(
    title = "Gruelling Grudges", points = 10, type="progression",
    description = "[Episode 5] Complete... her... testimony. Time to end this once and for all.",
    id = 630846, badge = "718011", published = "8/15/2026 2:04:44 PM", modified = "8/15/2026 2:04:44 PM",
    trigger = gamestate() == 770 && prev(currentEpisodePart()) == 21 && currentEpisodePart() == 22
)

achievement(
    title = "Black Coffee, Red Visor and a Heart of Gold", points = 3, type="missable",
    description = "[Episode 5] Make the judge take his own words as fact, and appreciate one last nonsensical coffee analogy from Godot, while pressing Maya Fey's third testimony.",
    id = 630847, badge = "718012", published = "8/15/2026 2:04:44 PM", modified = "8/15/2026 2:04:44 PM",
    trigger = gamestate() == 1537 && currentEpisodePart() == 22 && prev(textId()) == 5570758 && textId() == 5570760
)

achievement(
    title = "Blood and Bonds That Bind", points = 2, type="missable",
    description = "[Episode 5] Tell Franziska who Maya is being strong for at the end of the trial. She's come so far, hasn't she?",
    id = 630848, badge = "718013", published = "8/15/2026 2:04:44 PM", modified = "8/15/2026 2:04:44 PM",
    trigger = gamestate() == 769 && currentEpisodePart() == 22 && prev(textId()) == 5570694 && textId() == 5570695
)

achievement(
    title = "The Only Time a Lawyer Can Cry...", points = 25, type="win_condition",
    description = "[Episode 5] Complete Episode 5. After navigating the set of trials, tribulations and tragedies, it's finally over.",
    id = 630849, badge = "718014", published = "8/15/2026 2:04:44 PM", modified = "8/15/2026 2:04:44 PM",
    trigger = gamestate() == 769 && currentEpisodePart() == 22 && prev(textId()) == 5570696 && textId() == 5570697
)

rich_presence_conditional_display(gamestate() > 511, "Episode {0}",
    rich_presence_lookup("Episode", currentEpisodePart(), EpisodeLookup)
)

rich_presence_display("Getting ready to solve a case!")
