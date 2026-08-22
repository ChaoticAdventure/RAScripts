// Lost in Blue 2
// #ID = 15916

// $17bcb0: [8-bit] Gamestate
//          0x00= Logo
//          0x01= Title Screen
//          0x03= Normal Gameplay
//          0x04= Cutscene
function gamestate() => byte(0x17bcb0)
function inGame() => gamestate() > 1

// $17BCB6: [8-bit] Scene
//          0x00= Overworld
//          0x01= Tsunami
//          0x02= Starting Fire
//          0x04= Looking at Ground
//          0x05= Make Item
//          0x06= Inventory
//          0x07= Picturebook
//          0x09= Talking to Partner
//          0x0c= Today's Results
//          0x11= Fighting Animals
function scene() => byte(0x17BCB6)

// $17BCC5: [8-bit] Save Location 00 or 01 ??

// $17BCC7: [8-bit] Cutscene ID
//          00= Normal Gameplay
//          0x01-0x0a= Jack Death
//          0x0b= Jack Intro
//          0x0c= Amy Intro
//          0x0d= Amy Ending
//          0x0e= Island Intro
//          0x0f= Raft Ending
//          0x10= Bad Raft Ending
//          0x11= Lifeboat Ending
//          0x12= Bad Lifeboat Ending
//          0x13= Pillar Ending
//          0x14= Airplane Scene
//          0x15= Jack Death
function cutsceneId() => byte(0x17BCC7)

// $17BCF0: [8-bit] Location
//          0x00= Intro
//          0x01= Cave Shelter
//          0x02= First Beach
//          0x03= Right of Mountain River
//          0x05= Left of Mountain River
//          0x06= West Cave
//          0x07= Western Beach
//          0x09= Jungle
//          0x0a= Swamp
//          0x0b= Lake
//          0x0c= Ruins 1
//          0x0d= Ruins 2
//          0x0e= Ruins 3
//          0x0f= Ruins 4
//          0x10= Ruins Secret Route 1
//          0x11= Ruins
//          0x12= Ruins
//          0x13= Northeastern Plains
//          0x16= Ruins Secret Route 5 Torch Hall
//          0x17= Ruins Secret Route 2 Dying Man
//          0x18= Ruins Secret Route 3
//          0x19= Ruins Secret Route 4
//          0x1a= Ruins Secret Route 6
//          0x1b= Ruins Secret Route 7 Torch Hall
//          0x1c= Northwestern Plains
//          0x1e= Beach Ruins
//          0x1d= Treehouse Field
//          0x1f= Beach Ruins 2
//          0x20= Beach Ruins
//          0x21= Beach Ruins Large Room
function location() => byte(0x17BCF0)

// $17BCF2: [8-bit] Current Minute

// $17BCF3: [8-bit] Current Hour

// $17BCF4: [8-bit] Current Day
function currentDay() => byte(0x17BCF4)
function currentDayWord() => word(0x17BCF4)

// $17BCF6: [8-bit] Weather
//          0x00= Clear
//          0x01= Cloudy
//          0x02= Rainy
//          0x03= Typhoon

// $17BED0: [32-bit] Serious Survival
//          0x00000000= Survive Together
//          0xFFFFFFFF= Serious Survival
function seriousSurvival() => dword(0x17BED0)

// $17BEDC: [8-bit] Player Item 1 ID
//          0x00= Bed[0]
//          0x01= Shelf[0]
//          0x02= Smoker Shelf[0]
//          0x03= Table Set[0]
//          0x04= House[0]
//          0x05= Raft[0]
//          0x06= Raft 2[0]
//          0x07= Abalone
//          0x08= Short-neck
//          0x09= Clam
//          0x0a= Scallop
//          0x0b= Oyster
//          0x0c= Freshwater Clam
//          0x0d= Seaweed
//          0x0e= Red Sea Urchin
//          0x0f= Mackerel
//          0x10= Striped Breakperch
//          0x11= Sillaginoid
//          0x12= Balloon Fish
//          0x13= Moray
//          0x14= Sardine
//          0x15= Sting Fish
//          0x16= File Fish
//          0x17= Flatfish
//          0x18= Sea Bream
//          0x19= Parrot Fish
//          0x1a= Black Nibbler
//          0x1b= Yellowfin Goby
//          0x1c= Sea Bass
//          0x1d= Sweetfish
//          0x1e= Catfish
//          0x1f= Black Bass
//          0x20= Arowanan
//          0x21= Carp
//          0x22= Eel
//          0x23= Crucian
//          0x24= Char
//          0x25= Salmon
//          0x26= Masu Salmon
//          0x27= Japanese Huchen
//          0x28= Rainbow Trout
//          0x29= Turtle
//          0x2a= Hermit Crab
//          0x2b= River Crab
//          0x2c= Sand Crab
//          0x2d= Coconut Crab
//          0x2e= Tortoise
//          0x2f= Lizard
//          0x30= Pit Viper
//          0x31= Tarantula
//          0x32= Boar[0]
//          0x33= Duck[0]
//          0x34= Deer[0]
//          0x35= Raccoon[0]
//          0x36= Chicken[0]
//          0x37= Rabbit[0]
//          0x38= Field Mouse[0]
//          0x39= Pigeon[0]
//          0x3a= Goat[0]
//          0x3c= Lynx[0]
//          0x3d= Squirrel[0]
//          0x3e= Wolf[0]
//          0x3f= Tiger[0]
//          0x40= Alligator[0]
//          0x41= Gorilla[0]
//          0x42= Great White Shark[0]
//          0x43= Boar Meat
//          0x44= Duck Meat
//          0x45= Deer Meat
//          0x46= Raccoon Meat
//          0x47= Chicken Meat
//          0x48= Rabbit Meat
//          0x49= Field Mouse Meat
//          0x4a= Pigeon Meat
//          0x4b= Goat Meat
//          0x4c= Lynx Meat
//          0x4d= Squirrel Meat
//          0x4e= Wolf Meat
//          0x4f= Alligator meat.
//          0x50= Black Mushroom
//          0x51= Blue Mushroom
//          0x52= Brown Mushroom
//          0x53= Orange Mushroom
//          0x54= Purple Mushroom
//          0x55= Red Mushroom
//          0x56= White Mushroom
//          0x57= Yellow Mushroom
//          0x58= Chives
//          0x59= Bamboo Shoot
//          0x5a= Carrot
//          0x5b= Dandelion
//          0x5c= Burdock
//          0x5d= Onion
//          0x5e= Potato
//          0x5f= Radish
//          0x60= Taro
//          0x61= Fern
//          0x62= Coconut
//          0x63= Papaya
//          0x64= Raspberry
//          0x65= Bread Fruit
//          0x66= Banana
//          0x67= Pineapple
//          0x68= Mugwort
//          0x69= Lotus Root
//          0x6a= Guava
//          0x6b= Passion Fruit
//          0x6c= Tree Vine
//          0x6d= Tree Bark
//          0x6e= Leaf
//          0x6f= Log
//          0x70= Stick
//          0x71= Twigs
//          0x72= Large Bone
//          0x73= Fur
//          0x74= Stone
//          0x75= Green Bamboo
//          0x76= Feather
//          0x77= Lard
//          0x78= Sharpened Stone
//          0x79= Sharpened Bone
//          0x7a= Basket
//          0x7b= Iron Rod
//          0x7c= Smoked Meat (Small)
//          0x7d= Smoked Meat (Medium)
//          0x7e= Smoked Meat (Large)
//          0x7f= Smoked Fish (Small)
//          0x80= Smoked Fish (Medium)
//          0x81= Smoked Fish (Large)
//          0x82= Egg
//          0x83= Lunchbox
//          0x84= White Round Shell
//          0x85= Brown Round Shell
//          0x86= Black Round Shell
//          0x87= White Pointy Shell
//          0x88= Brown Pointy Shell
//          0x89= Black Pointy Shell
//          0x8a= White Odd Shell
//          0x8b= Brown Odd Shell
//          0x8c= Black Odd Shell
//          0x8d= Red Stone
//          0x8e= Orange Stone
//          0x8f= Yellow Stone
//          0x90= Green Stone
//          0x91= Light Blue Stone
//          0x92= Dark Blue Stone
//          0x93= Purple Stone
//          0x94= Shell Necklace
//          0x95= Sun Necklace
//          0x96= Sunset Necklace
//          0x97= Moon Necklace
//          0x98= Young Leaf Necklace
//          0x99= Blue Sky Necklace
//          0x9a= Deep Sea Necklace
//          0x9b= Night Sky Necklace
//          0x9c= Map A
//          0x9d= Map B
//          0x9e= Map C
//          0x9f= Map D
//          0xa0= Radio
//          0xa1= Bottle
//          0xa2= Bottled water
//          0xa3= Bottled milk
//          0xa4= Oil Drum
//          0xa5= Flat Rock
//          0xa6= Indented Rock
//          0xa7= Fire Starter
//          0xa8= Fire Starter w/ Bow
//          0xa9= Bamboo Fishing Rod A
//          0xaa= Bamboo Fishing Rod B
//          0xab= Wooden Fishing Rod A
//          0xac= Wooden Fishing Rod B
//          0xad= Wooden Bow
//          0xae= Bamboo Bow
//          0xaf= Bamboo Arrows A[0]
//          0xb0= Bamboo Arrows B[0]
//          0xb1= Bamboo Arrows C[0]
//          0xb2= Bamboo Arrows D[0]
//          0xb3= Wooden Arrows A[0]
//          0xb4= Wooden Arrows B[0]
//          0xb5= Wooden Arrows C[0]
//          0xb6= Wooden Arrows D[0]
//          0xb7= Iron Arrows A[0]
//          0xb8= Iron Arrows B[0]
//          0xb9= Bamboo Spear A
//          0xba= Bamboo Spear B
//          0xbb= Bamboo Spear C
//          0xbc= Wooden Spear A
//          0xbd= Wooden Spear B
//          0xbe= Wooden Spear C
//          0xbf= Iron Spear
//          0xc0= Wooden Torch
//          0xc1= Bamboo Torch
//          0xc2= Round Lure A
//          0xc3= Round Lure B
//          0xc4= Round Lure C
//          0xc5= Thin Lure A
//          0xc6= Thin Lure B
//          0xc7= Thin Lure C
//          0xc8= Long Lure A
//          0xc9= Long Lure B
//          0xca= Long Lure C
//          0xcb= Special Lure
//          0xcc= Small Trap
//          0xcd= Large Trap
//          0xce= Fish Trap
//          0xcf= Present
function playerItem1Id() => byte(0x17BEDC)

// $17BEE2: [8-bit] Player Item 2 ID
function playerItem2Id() => byte(0x17BEE2)

// $17BEE8: [8-bit] Player Item 3 ID
function playerItem3Id() => byte(0x17BEE8)

// $17BEEE: [8-bit] Player Item 4 ID
function playerItem4Id() => byte(0x17BEEE)

// $17BEF4: [8-bit] Player Item 5 ID
function playerItem5Id() => byte(0x17BEF4)

// $17BEFA: [8-bit] Player Item 6 ID
function playerItem6Id() => byte(0x17BEFA)

// $17BF00: [8-bit] Player Item 7 ID
function playerItem7Id() => byte(0x17BF00)

// $17BF06: [8-bit] Player Item 8 ID
function playerItem8Id() => byte(0x17BF06)

// $17BF0C: [8-bit] Player Item 9 ID
function playerItem9Id() => byte(0x17BF0C)

// $17BF12: [8-bit] Player Item 10 ID
function playerItem10Id() => byte(0x17BF12)

// $17BF18: [8-bit] Player Item 11 ID
function playerItem11Id() => byte(0x17BF18)

// $17BF1E: [8-bit] Player Item 12 ID
function playerItem12Id() => byte(0x17BF1E)

// $17BF24: [8-bit] Player Item 13 ID
function playerItem13Id() => byte(0x17BF24)

// $17BF2A: [8-bit] Player Item 14 ID
function playerItem14Id() => byte(0x17BF2A)

// $17BF30: [8-bit] Player Item 15 ID
function playerItem15Id() => byte(0x17BF30)

// $17BF36: [8-bit] Player Item 16 ID
function playerItem16Id() => byte(0x17BF36)

// $17BF3C: [8-bit] Player Item 17 ID
function playerItem17Id() => byte(0x17BF3C)

// $17BF42: [8-bit] Player Item 18 ID
function playerItem18Id() => byte(0x17BF42)

// $17BF48: [8-bit] Player Item 19 ID
function playerItem19Id() => byte(0x17BF48)

// $17BF4E: [8-bit] Player Item 20 ID
function playerItem20Id() => byte(0x17BF4E)

// $17C1ED: [8-bit] Jack Energy Length
function jackEnergyLength() => byte(0x17C1ED)

// $17C1FB: [8-bit] Amy Energy Length
function amyEnergyLength() => byte(0x17C1FB)

// $17C20C: [8-bit] Partner Happiness
function partnerHappiness() => byte(0x17C20C)

// $17C27C: [8-bit] Domesticated Goat
//          0x00= No
//          0x03= Yes
function domesticatedGoat() => byte(0x17C27C)

// $17C27D: [8-bit] Domesticated Chicken
//          0x00= No
//          0x03= Yes
function domesticatedChicken() => byte(0x17C27D)

// $18844C: [8-bit] Picturebook
//          Bit0= Bed
//          Bit1= Shelf
//          Bit2= Smoker Shelf
//          Bit3= Table Set
//          Bit4= House
//          Bit5= Raft
//          Bit6= Raft 2
//          Bit7= Abalone
function picturebook() => byte(0x18844C)
function picturebookBed() => bit0(0x18844C)
function picturebookShelf() => bit1(0x18844C)
function picturebookSmokerShelf() => bit2(0x18844C)
function picturebookTableSet() => bit3(0x18844C)
function picturebookHouse() => bit4(0x18844C)
function picturebookRaft() => bit5(0x18844C)
function picturebookRaft2() => bit6(0x18844C)
function picturebookAbalone() => bit7(0x18844C)

// $18844D: [8-bit] Picturebook
//          Bit0= Short-neck
//          Bit1= Clam
//          Bit2= Scallop
//          Bit3= Oyster
//          Bit4= Freshwater Clam
//          Bit5= Seaweed
//          Bit6= Red Sea Urchin
//          Bit7= Mackerel
function picturebook_2Shortneck() => bit0(0x18844D)
function picturebook_2Clam() => bit1(0x18844D)
function picturebook_2Scallop() => bit2(0x18844D)
function picturebook_2Oyster() => bit3(0x18844D)
function picturebook_2FreshwaterClam() => bit4(0x18844D)
function picturebook_2Seaweed() => bit5(0x18844D)
function picturebook_2RedSeaUrchin() => bit6(0x18844D)
function picturebook_2Mackerel() => bit7(0x18844D)

// $188450: [8-bit] Picturebook
//          Bit0= Striped Breakperch
//          Bit1= Sillaginoid
//          Bit2= Balloon Fish
//          Bit3= Moray
//          Bit4= Sardine
//          Bit5= Sting Fish
//          Bit6= File Fish
//          Bit7= Flatfish
function picturebook_3StripedBreakperch() => bit0(0x188450)
function picturebook_3Sillaginoid() => bit1(0x188450)
function picturebook_3BalloonFish() => bit2(0x188450)
function picturebook_3Moray() => bit3(0x188450)
function picturebook_3Sardine() => bit4(0x188450)
function picturebook_3StingFish() => bit5(0x188450)
function picturebook_3FileFish() => bit6(0x188450)
function picturebook_3Flatfish() => bit7(0x188450)

// $188451: [8-bit] Picturebook
//          Bit0= Sea Bream
//          Bit1= Parrot Fish
//          Bit2= Black Nibbler
//          Bit3= Yellowfin Goby
//          Bit4= Sea Bass
//          Bit5= Sweetfish
//          Bit6= Catfish
//          Bit7= Black Bass
function picturebook_4SeaBream() => bit0(0x188451)
function picturebook_4ParrotFish() => bit1(0x188451)
function picturebook_4BlackNibbler() => bit2(0x188451)
function picturebook_4YellowfinGoby() => bit3(0x188451)
function picturebook_4SeaBass() => bit4(0x188451)
function picturebook_4Sweetfish() => bit5(0x188451)
function picturebook_4Catfish() => bit6(0x188451)
function picturebook_4BlackBass() => bit7(0x188451)

// $188454: [8-bit] Picturebook
//          Bit0= Arowana
//          Bit1= Carp
//          Bit2= Eel
//          Bit3= Crucian
//          Bit4= Char
//          Bit5= Salmon
//          Bit6= Masu Salmon
//          Bit7= Japanese Huchen
function picturebook_5Arowana() => bit0(0x188454)
function picturebook_5Carp() => bit1(0x188454)
function picturebook_5Eel() => bit2(0x188454)
function picturebook_5Crucian() => bit3(0x188454)
function picturebook_5Char() => bit4(0x188454)
function picturebook_5Salmon() => bit5(0x188454)
function picturebook_5MasuSalmon() => bit6(0x188454)
function picturebook_5JapaneseHuchen() => bit7(0x188454)

// $188455: [8-bit] Picturebook
//          Bit0= Rainbow Trout
//          Bit2= Hermit Crab
//          Bit4= Sand Crab
//          Bit5= Coconut Crab
//          Bit6= Tortoise
//          Bit7= Lizard
function picturebook_6RainbowTrout() => bit0(0x188455)
function picturebook_6HermitCrab() => bit2(0x188455)
function picturebook_6SandCrab() => bit4(0x188455)
function picturebook_6CoconutCrab() => bit5(0x188455)
function picturebook_6Tortoise() => bit6(0x188455)
function picturebook_6Lizard() => bit7(0x188455)

// $188458: [8-bit] Picturebook
//          Bit0= Pit Viper
//          Bit1= Tarantula
//          Bit2= Boar
//          Bit3= Duck
//          Bit4= Deer
//          Bit5= Raccoon
//          Bit6= Chicken
//          Bit7= Rabbit
function picturebook_7PitViper() => bit0(0x188458)
function picturebook_7Tarantula() => bit1(0x188458)
function picturebook_7Boar() => bit2(0x188458)
function picturebook_7Duck() => bit3(0x188458)
function picturebook_7Deer() => bit4(0x188458)
function picturebook_7Raccoon() => bit5(0x188458)
function picturebook_7Chicken() => bit6(0x188458)
function picturebook_7Rabbit() => bit7(0x188458)

// $188459: [8-bit] Picturebook
//          Bit0= Field Mouse
//          Bit1= Pigeon
//          Bit2= Goat
//          Bit4= Lynx
//          Bit5= Squirrel
//          Bit6= Wolf
//          Bit7= Tiger
function picturebook_8FieldMouse() => bit0(0x188459)
function picturebook_8Pigeon() => bit1(0x188459)
function picturebook_8Goat() => bit2(0x188459)
function picturebook_8Lynx() => bit4(0x188459)
function picturebook_8Squirrel() => bit5(0x188459)
function picturebook_8Wolf() => bit6(0x188459)
function picturebook_8Tiger() => bit7(0x188459)

// $18845C: [8-bit] Picturebook
//          Bit0= Alligator
//          Bit1= Gorilla
//          Bit2= Great White Shark
function picturebook_9Alligator() => bit0(0x18845C)
function picturebook_9Gorilla() => bit1(0x18845C)
function picturebook_9GreatWhiteShark() => bit2(0x18845C)

// $188460: [8-bit] Picturebook
//          Bit0= Black Mushroom
//          Bit1= Blue Mushroom
//          Bit2= Brown Mushroom
//          BitBit3= Orange Mushroom
//          Bit4= Purple Mushroom
//          Bit5= Red Mushroom
//          Bit6= White Mushroom
//          Bit7= Yellow Mushroom
function picturebook_10BlackMushroom() => bit0(0x188460)
function picturebook_10BlueMushroom() => bit1(0x188460)
function picturebook_10BrownMushroom() => bit2(0x188460)
function picturebook_10Bit3() => bit3(0x188460)
function picturebook_10PurpleMushroom() => bit4(0x188460)
function picturebook_10RedMushroom() => bit5(0x188460)
function picturebook_10WhiteMushroom() => bit6(0x188460)
function picturebook_10YellowMushroom() => bit7(0x188460)

// $188461: [8-bit] Picturebook
//          Bit0= Chives
//          Bit1= Bamboo Shoot
//          Bit2= Carrot
//          Bit3= Dandelion
//          Bit4= Burdock
//          Bit5= Onion
//          Bit6= Potato
//          Bit7= Radish
function picturebook_11Chives() => bit0(0x188461)
function picturebook_11BambooShoot() => bit1(0x188461)
function picturebook_11Carrot() => bit2(0x188461)
function picturebook_11Dandelion() => bit3(0x188461)
function picturebook_11Burdock() => bit4(0x188461)
function picturebook_11Onion() => bit5(0x188461)
function picturebook_11Potato() => bit6(0x188461)
function picturebook_11Radish() => bit7(0x188461)

// $188464: [8-bit] Picturebook
//          Bit0= Taro
//          Bit1= Fern
//          Bit2= Coconut
//          Bit3= Papaya
//          Bit4= Raspberry
//          Bit5= Bread Fruit
//          Bit6= Banana
//          Bit7= Pineapple
function picturebook_12Taro() => bit0(0x188464)
function picturebook_12Fern() => bit1(0x188464)
function picturebook_12Coconut() => bit2(0x188464)
function picturebook_12Papaya() => bit3(0x188464)
function picturebook_12Raspberry() => bit4(0x188464)
function picturebook_12BreadFruit() => bit5(0x188464)
function picturebook_12Banana() => bit6(0x188464)
function picturebook_12Pineapple() => bit7(0x188464)

// $188465: [8-bit] Picturebook
//          Bit0= Mugwort
//          Bit1= Lotus Root
//          Bit2= Guava
//          Bit3= Passion Fruit
//          Bit4= Tree Vine
//          Bit5= Tree Bark
//          Bit6= Leaf
//          Bit7= Log
function picturebook_13Mugwort() => bit0(0x188465)
function picturebook_13LotusRoot() => bit1(0x188465)
function picturebook_13Guava() => bit2(0x188465)
function picturebook_13PassionFruit() => bit3(0x188465)
function picturebook_13TreeVine() => bit4(0x188465)
function picturebook_13TreeBark() => bit5(0x188465)
function picturebook_13Leaf() => bit6(0x188465)
function picturebook_13Log() => bit7(0x188465)

// $188468: [8-bit] Picturebook
//          Bit0= Stick
//          Bit1= Twigs
//          Bit2= Large Bone
//          Bit3= Fur
//          Bit4= Stone
//          Bit5= Green Bamboo
//          Bit6= Feather
//          Bit7= Lard
function picturebook_14Stick() => bit0(0x188468)
function picturebook_14Twigs() => bit1(0x188468)
function picturebook_14LargeBone() => bit2(0x188468)
function picturebook_14Fur() => bit3(0x188468)
function picturebook_14Stone() => bit4(0x188468)
function picturebook_14GreenBamboo() => bit5(0x188468)
function picturebook_14Feather() => bit6(0x188468)
function picturebook_14Lard() => bit7(0x188468)

// $188469: [8-bit] Picturebook
//          Bit0= Sharpened Stone
//          Bit1= Sharpened Bone
//          Bit2= Basket
//          Bit3= Iron Rod
//          Bit4= Smoked Meat (Small)
//          Bit5= Smoked Meat (Medium)
//          Bit6= Smoked Meat (Large)
//          Bit7= Smoked Fish (Small)
function picturebook_15SharpenedStone() => bit0(0x188469)
function picturebook_15SharpenedBone() => bit1(0x188469)
function picturebook_15Basket() => bit2(0x188469)
function picturebook_15IronRod() => bit3(0x188469)
function picturebook_15SmokedMeatSmall() => bit4(0x188469)
function picturebook_15SmokedMeatMedium() => bit5(0x188469)
function picturebook_15SmokedMeatLarge() => bit6(0x188469)
function picturebook_15SmokedFishSmall() => bit7(0x188469)

// $18846C: [8-bit] Picturebook
//          Bit0= Smoked Fish (Medium)
//          Bit1= Smoked FIsh (Large)
//          Bit2= Egg
//          Bit3= Lunchbox
//          Bit4= White Round Shell
//          Bit5= Brown Round Shell
//          Bit6= Black Round Shell
//          Bit7= White Pointy Shell
function picturebook_16SmokedFishMedium() => bit0(0x18846C)
function picturebook_16SmokedFishLarge() => bit1(0x18846C)
function picturebook_16Egg() => bit2(0x18846C)
function picturebook_16Lunchbox() => bit3(0x18846C)
function picturebook_16WhiteRoundShell() => bit4(0x18846C)
function picturebook_16BrownRoundShell() => bit5(0x18846C)
function picturebook_16BlackRoundShell() => bit6(0x18846C)
function picturebook_16WhitePointyShell() => bit7(0x18846C)

// $18846D: [8-bit] Picturebook
//          Bit0= Brown Pointy Shell
//          Bit1= Black Pointy Shell
//          Bit2= White Odd Shell
//          Bit3= Brown Odd Shell
//          Bit4= Black Odd Shell
//          Bit5= Red Stone
//          Bit6= Orange Stone
//          Bit7= Yellow Stone
function picturebook_17BrownPointyShell() => bit0(0x18846D)
function picturebook_17BlackPointyShell() => bit1(0x18846D)
function picturebook_17WhiteOddShell() => bit2(0x18846D)
function picturebook_17BrownOddShell() => bit3(0x18846D)
function picturebook_17BlackOddShell() => bit4(0x18846D)
function picturebook_17RedStone() => bit5(0x18846D)
function picturebook_17OrangeStone() => bit6(0x18846D)
function picturebook_17YellowStone() => bit7(0x18846D)

// $188470: [8-bit] Picturebook
//          Bit0= Green Stone
//          Bit1= Light Blue Stone
//          Bit2= Dark Blue Stone
//          Bit3= Purple Stone
//          Bit4= Shell Necklace
//          Bit5= Sun Necklace
//          Bit6= Sunset Necklace
//          Bit7= Moon Necklace
function picturebook_18GreenStone() => bit0(0x188470)
function picturebook_18LightBlueStone() => bit1(0x188470)
function picturebook_18DarkBlueStone() => bit2(0x188470)
function picturebook_18PurpleStone() => bit3(0x188470)
function picturebook_18ShellNecklace() => bit4(0x188470)
function picturebook_18SunNecklace() => bit5(0x188470)
function picturebook_18SunsetNecklace() => bit6(0x188470)
function picturebook_18MoonNecklace() => bit7(0x188470)

// $188471: [8-bit] Picturebook
//          Bit0= Young Leaf Necklace
//          Bit1= Blue Sky Necklace
//          Bit2= Deep Sea Necklace
//          Bit3= Night Sky Necklace
//          Bit4= Map A
//          Bit5= Map B
//          Bit6= Map C
//          Bit7= Map D
function picturebook_19YoungLeafNecklace() => bit0(0x188471)
function picturebook_19BlueSkyNecklace() => bit1(0x188471)
function picturebook_19DeepSeaNecklace() => bit2(0x188471)
function picturebook_19NightSkyNecklace() => bit3(0x188471)
function picturebook_19MapA() => bit4(0x188471)
function picturebook_19MapB() => bit5(0x188471)
function picturebook_19MapC() => bit6(0x188471)
function picturebook_19MapD() => bit7(0x188471)

// $188474: [8-bit] Picturebook
//          Bit0= Radio
//          Bit1= Bottle
//          Bit2= Bottled water
//          Bit3= Bottled milk
//          Bit4= Oil Drum
//          Bit5= Flat Rock
//          Bit6= Indented Rock
//          Bit7= Fire Starter
function picturebook_20() => byte(0x188474)
function picturebook_20Radio() => bit0(0x188474)
function picturebook_20Bottle() => bit1(0x188474)
function picturebook_20BottledWater() => bit2(0x188474)
function picturebook_20BottledMilk() => bit3(0x188474)
function picturebook_20OilDrum() => bit4(0x188474)
function picturebook_20FlatRock() => bit5(0x188474)
function picturebook_20IndentedRock() => bit6(0x188474)
function picturebook_20FireStarter() => bit7(0x188474)

// $188475: [8-bit] Picturebook
//          Bit0= Fire Starter w/ Bow
//          Bit1= Bamboo Fishing Rod A
//          Bit2= Bamboo Fishing Rod B
//          Bit3= Wooden Fishing Rod A
//          Bit4= Wooden Fishing Rod B
//          Bit5= Wooden Bow
//          Bit6= Bamboo Bow
//          Bit7= Bamboo Arrows A
function picturebook_21() => byte(0x188475)
function picturebook_21FireStarterWBow() => bit0(0x188475)
function picturebook_21BambooFishingRodA() => bit1(0x188475)
function picturebook_21BambooFishingRodB() => bit2(0x188475)
function picturebook_21WoodenFishingRodA() => bit3(0x188475)
function picturebook_21WoodenFishingRodB() => bit4(0x188475)
function picturebook_21WoodenBow() => bit5(0x188475)
function picturebook_21BambooBow() => bit6(0x188475)
function picturebook_21BambooArrowsA() => bit7(0x188475)

// $188478: [8-bit] Picturebook
//          Bit0= Bamboo Arrows B
//          Bit1= Bamboo Arrows C
//          Bit2= Bamboo Arrows D
//          Bit3= Wooden Arrows A
//          Bit4= Wooden Arrows B
//          Bit5= Wooden Arrows C
//          Bit6= Wooden Arrows D
//          Bit7= Iron Arrows A
function picturebook_22BambooArrowsB() => bit0(0x188478)
function picturebook_22BambooArrowsC() => bit1(0x188478)
function picturebook_22BambooArrowsD() => bit2(0x188478)
function picturebook_22WoodenArrowsA() => bit3(0x188478)
function picturebook_22WoodenArrowsB() => bit4(0x188478)
function picturebook_22WoodenArrowsC() => bit5(0x188478)
function picturebook_22WoodenArrowsD() => bit6(0x188478)
function picturebook_22IronArrowsA() => bit7(0x188478)

// $188479: [8-bit] Picturebook
//          Bit0= Iron Arrows B
//          Bit1= Bamboo Spear A
//          Bit2= Bamboo Spear B
//          Bit3= Bamboo Spear C
//          Bit4= Wooden Spear A
//          Bit5= Wooden Spear B
//          Bit6= Wooden Spear C
//          Bit7= Iron Spear
function picturebook_23() => byte(0x188479)
function picturebook_23IronArrowsB() => bit0(0x188479)
function picturebook_23BambooSpearA() => bit1(0x188479)
function picturebook_23BambooSpearB() => bit2(0x188479)
function picturebook_23BambooSpearC() => bit3(0x188479)
function picturebook_23WoodenSpearA() => bit4(0x188479)
function picturebook_23WoodenSpearB() => bit5(0x188479)
function picturebook_23WoodenSpearC() => bit6(0x188479)
function picturebook_23IronSpear() => bit7(0x188479)

// $18847C: [8-bit] Picturebook
//          Bit0= Wooden Torch
//          Bit1= Bamboo Torch
//          Bit2= Round Lure A
//          Bit3= Round Lure B
//          Bit4= Round Lure C
//          Bit5= Thin Lure A
//          Bit6= Thin Lure B
//          Bit7= Thin Lure C
function picturebook_24WoodenTorch() => bit0(0x18847C)
function picturebook_24BambooTorch() => bit1(0x18847C)
function picturebook_24RoundLureA() => bit2(0x18847C)
function picturebook_24RoundLureB() => bit3(0x18847C)
function picturebook_24RoundLureC() => bit4(0x18847C)
function picturebook_24ThinLureA() => bit5(0x18847C)
function picturebook_24ThinLureB() => bit6(0x18847C)
function picturebook_24ThinLureC() => bit7(0x18847C)

// $18847D: [8-bit] Picturebook
//          Bit0= Long Lure A
//          Bit1= Long Lure B
//          Bit2= Long Lure C
//          Bit3= Special Lure
//          Bit4= Small Trap
//          Bit5= Large Trap
//          Bit6= Fish Trap
function picturebook_25() => byte(0x18847D)
function picturebook_25LongLureA() => bit0(0x18847D)
function picturebook_25LongLureB() => bit1(0x18847D)
function picturebook_25LongLureC() => bit2(0x18847D)
function picturebook_25SpecialLure() => bit3(0x18847D)
function picturebook_25SmallTrap() => bit4(0x18847D)
function picturebook_25LargeTrap() => bit5(0x18847D)
function picturebook_25FishTrap() => bit6(0x18847D)

// $1884A1: [8-bit] Picturebook
//          Bit7= Egg Salad
function picturebookEggSalad() => bit7(0x1884A1)

// $1884A4: [8-bit] Picturebook
//          Bit0= Radish Salad
//          Bit1= Burdock Root Salad
//          Bit2= Seaweed Salad
//          Bit3= Mushroom Salad
//          Bit4= Mackerel Sashimi
//          Bit5= Sea Bass Sashimi
//          Bit6= Sashimi Platter
//          Bit7= Fruit Platter
function picturebook_26RadishSalad() => bit0(0x1884A4)
function picturebook_26BurdockRootSalad() => bit1(0x1884A4)
function picturebook_26SeaweedSalad() => bit2(0x1884A4)
function picturebook_26MushroomSalad() => bit3(0x1884A4)
function picturebook_26MackerelSashimi() => bit4(0x1884A4)
function picturebook_26SeaBassSashimi() => bit5(0x1884A4)
function picturebook_26SashimiPlatter() => bit6(0x1884A4)
function picturebook_26FruitPlatter() => bit7(0x1884A4)

// $1884A5: [8-bit] Picturebook
//          Bit0= Baked Potato
//          Bit1= Grilled Eel
//          Bit2= Grilled Sweetfish
//          Bit3= Grilled Clam
//          Bit4= Grilled Chicken
//          Bit5= Grilled Salmon
//          Bit6= Grilled Sea Bream
//          Bit7= Grilled Masu Salmon
function picturebook_27BakedPotato() => bit0(0x1884A5)
function picturebook_27GrilledEel() => bit1(0x1884A5)
function picturebook_27GrilledSweetfish() => bit2(0x1884A5)
function picturebook_27GrilledClam() => bit3(0x1884A5)
function picturebook_27GrilledChicken() => bit4(0x1884A5)
function picturebook_27GrilledSalmon() => bit5(0x1884A5)
function picturebook_27GrilledSeaBream() => bit6(0x1884A5)
function picturebook_27GrilledMasuSalmon() => bit7(0x1884A5)

// $1884A8: [8-bit] Picturebook
//          Bit0= Butter Grilled Trout
//          Bit1= Grilled Sea Bass
//          Bit2= Masu Salmon Skewer
//          Bit3= Sauteed Nibbler
//          Bit4= Sauteed Wolf
//          Bit5= Tropical Fried Pork
//          Bit6= Pan-fried Flatfish
//          Bit7= Crab Omelette
function picturebook_28ButterGrilledTrout() => bit0(0x1884A8)
function picturebook_28GrilledSeaBass() => bit1(0x1884A8)
function picturebook_28MasuSalmonSkewer() => bit2(0x1884A8)
function picturebook_28SauteedNibbler() => bit3(0x1884A8)
function picturebook_28SauteedWolf() => bit4(0x1884A8)
function picturebook_28TropicalFriedPork() => bit5(0x1884A8)
function picturebook_28PanfriedFlatfish() => bit6(0x1884A8)
function picturebook_28CrabOmelette() => bit7(0x1884A8)

// $1884A9: [8-bit] Picturebook
//          Bit0= Mushroom Omelette
//          Bit1= Italian Omelette
//          Bit2= Butter Fried Clam
//          Bit3= Mushroom Saute
//          Bit4= Burdock Root
//          Bit5= Eggs Sunny-side Up
//          Bit6= Rainbow Trout Saute
//          Bit7= Pan-fried Sea Bass
function picturebook_29MushroomOmelette() => bit0(0x1884A9)
function picturebook_29ItalianOmelette() => bit1(0x1884A9)
function picturebook_29ButterFriedClam() => bit2(0x1884A9)
function picturebook_29MushroomSaute() => bit3(0x1884A9)
function picturebook_29BurdockRoot() => bit4(0x1884A9)
function picturebook_29EggsSunnysideUp() => bit5(0x1884A9)
function picturebook_29RainbowTroutSaute() => bit6(0x1884A9)
function picturebook_29PanfriedSeaBass() => bit7(0x1884A9)

// $1884AC: [8-bit] Picturebook
//          Bit0= Boiled Pork Salad
//          Bit1= Clam Chowder
//          Bit2= Meat & Potato Stew
//          Bit3= Pot-au-feu
//          Bit4= Sardine Soup
//          Bit5= Onion Soup
//          Bit6= Pigeon Soup
//          Bit7= Duck Hot Pot
function picturebook_30BoiledPorkSalad() => bit0(0x1884AC)
function picturebook_30ClamChowder() => bit1(0x1884AC)
function picturebook_30MeatPotatoStew() => bit2(0x1884AC)
function picturebook_30Potaufeu() => bit3(0x1884AC)
function picturebook_30SardineSoup() => bit4(0x1884AC)
function picturebook_30OnionSoup() => bit5(0x1884AC)
function picturebook_30PigeonSoup() => bit6(0x1884AC)
function picturebook_30DuckHotPot() => bit7(0x1884AC)

// $1884AD: [8-bit] Picturebook
//          Bit0= Boiled Egg
//          Bit1= Salmon Hot Pot
//          Bit2= Raccoon Hot Pot
//          Bit3= Pork Miso Soup
//          Bit4= Deer Hot Pot
//          Bit5= Boiled Bamboo Shoot
//          Bit6= Wolf Hot Pot
//          Bit7= Cream Stew
function picturebook_31BoiledEgg() => bit0(0x1884AD)
function picturebook_31SalmonHotPot() => bit1(0x1884AD)
function picturebook_31RaccoonHotPot() => bit2(0x1884AD)
function picturebook_31PorkMisoSoup() => bit3(0x1884AD)
function picturebook_31DeerHotPot() => bit4(0x1884AD)
function picturebook_31BoiledBambooShoot() => bit5(0x1884AD)
function picturebook_31WolfHotPot() => bit6(0x1884AD)
function picturebook_31CreamStew() => bit7(0x1884AD)

// $1884B0: [8-bit] Picturebook
//          Bit0= Fried Sillaginoid
//          Bit1= Onion Rings
//          Bit2= French Fries
//          Bit3= Fried Oyster
//          Bit4= Fried Mackerel
//          Bit5= Deep Fried Chicken
//          Bit6= Mixed Tempura
//          Bit7= Goby Tempura
function picturebook_32FriedSillaginoid() => bit0(0x1884B0)
function picturebook_32OnionRings() => bit1(0x1884B0)
function picturebook_32FrenchFries() => bit2(0x1884B0)
function picturebook_32FriedOyster() => bit3(0x1884B0)
function picturebook_32FriedMackerel() => bit4(0x1884B0)
function picturebook_32DeepFriedChicken() => bit5(0x1884B0)
function picturebook_32MixedTempura() => bit6(0x1884B0)
function picturebook_32GobyTempura() => bit7(0x1884B0)

// $1884B1: [8-bit] Picturebook
//          Bit0= Lotus Root Chips
//          Bit1= Potato Salad
//          Bit2= Steamed Crab
//          Bit3= Steamed Taro
//          Bit4= Egg Hotchpotch
//          Bit5= Custard Pudding
//          Bit6= Steamed Sea Urchin
function picturebook_33LotusRootChips() => bit0(0x1884B1)
function picturebook_33PotatoSalad() => bit1(0x1884B1)
function picturebook_33SteamedCrab() => bit2(0x1884B1)
function picturebook_33SteamedTaro() => bit3(0x1884B1)
function picturebook_33EggHotchpotch() => bit4(0x1884B1)
function picturebook_33CustardPudding() => bit5(0x1884B1)
function picturebook_33SteamedSeaUrchin() => bit6(0x1884B1)

// Ticket 88278: The achievement didn't trigger. While playing the achievements behave strangely. I have all 8
//               mushrooms and the achievement remains locked. The achievement values kinda 'refresh' each time a
//               message appear over the head of the character (The tracker reappear each time). Also, the achievements
//               have different values on the map and each menu (Bag, crafting, picture book, etc).
//               
//               All this only happens on 'melonDS DS' core on RetroArch. On RALibRetro the problem doesn't happen with
//               the same core, nor on RetroArch with the 'melonDS' normal core.
//               
//               I will submit a manual unlock since there is another cheevo with this problem and I don't want to open
//               more tickets. Also I will change to melonDS core to avoid more problems with the tracking.
achievement(
    title = "Delicious Shrooms", points = 5,
    description = "Collect every type of mushroom.",
    id = 241881, badge = "362196", published = "8/21/2022 6:29:55 AM", modified = "6/3/2023 11:38:03 PM",
    trigger = inGame() && measured((picturebook_10BlackMushroom() + picturebook_10BlueMushroom() + picturebook_10BrownMushroom() +
                  picturebook_10Bit3() + picturebook_10PurpleMushroom() + picturebook_10RedMushroom() +
                  picturebook_10WhiteMushroom() + picturebook_10YellowMushroom()) == 8
              ) &&
              (prev(picturebook_10BlackMushroom()) + prev(picturebook_10BlueMushroom()) +
              prev(picturebook_10BrownMushroom()) + prev(picturebook_10Bit3()) + prev(picturebook_10PurpleMushroom()) +
              prev(picturebook_10RedMushroom()) + prev(picturebook_10WhiteMushroom()) +
              prev(picturebook_10YellowMushroom())) == 7
)

achievement(
    title = "Under the Sea", points = 10,
    description = "Collect every type of sea creature and a seaweed.",
    id = 241882, badge = "362197", published = "8/21/2022 6:29:56 AM", modified = "6/3/2023 11:38:31 PM",
    trigger = inGame() && measured((picturebookAbalone() + picturebook_2Shortneck() + picturebook_2Clam() + picturebook_2Scallop() +
                  picturebook_2Oyster() + picturebook_2FreshwaterClam() + picturebook_2Seaweed() +
                  picturebook_2RedSeaUrchin()) == 8
              ) &&
              (prev(picturebookAbalone()) + prev(picturebook_2Shortneck()) + prev(picturebook_2Clam()) +
              prev(picturebook_2Scallop()) + prev(picturebook_2Oyster()) + prev(picturebook_2FreshwaterClam()) +
              prev(picturebook_2Seaweed()) + prev(picturebook_2RedSeaUrchin())) == 7
)

achievement(
    title = "Juicy!", points = 5,
    description = "Collect every type of fruit.",
    id = 241883, badge = "362198", published = "8/21/2022 6:29:56 AM", modified = "6/3/2023 11:39:24 PM",
    trigger = inGame() && measured((picturebook_12Coconut() + picturebook_12Papaya() + picturebook_12Raspberry() +
                  picturebook_12BreadFruit() + picturebook_12Banana() + picturebook_12Pineapple() + picturebook_13Guava() +
                  picturebook_13PassionFruit()) == 8
              ) &&
              (prev(picturebook_12Coconut()) + prev(picturebook_12Papaya()) + prev(picturebook_12Raspberry()) +
              prev(picturebook_12BreadFruit()) + prev(picturebook_12Banana()) + prev(picturebook_12Pineapple()) +
              prev(picturebook_13Guava()) + prev(picturebook_13PassionFruit())) == 7
)

achievement(
    title = "They're Good for You", points = 5,
    description = "Collect every type of vegetable.",
    id = 241884, badge = "362199", published = "8/21/2022 6:29:56 AM", modified = "6/3/2023 11:39:52 PM",
    trigger = inGame() && measured((picturebook_11Chives() + picturebook_11BambooShoot() + picturebook_11Carrot() +
                  picturebook_11Dandelion() + picturebook_11Burdock() + picturebook_11Onion() + picturebook_11Potato() +
                  picturebook_11Radish() + picturebook_12Taro() + picturebook_12Fern() + picturebook_13Mugwort() +
                  picturebook_13LotusRoot()) == 12
              ) &&
              (prev(picturebook_11Chives()) + prev(picturebook_11BambooShoot()) + prev(picturebook_11Carrot()) +
              prev(picturebook_11Dandelion()) + prev(picturebook_11Burdock()) + prev(picturebook_11Onion()) +
              prev(picturebook_11Potato()) + prev(picturebook_11Onion()) + prev(picturebook_12Taro()) +
              prev(picturebook_12Fern()) + prev(picturebook_13Mugwort()) + prev(picturebook_13LotusRoot())) == 11
)

achievement(
    title = "Enough to Have a Rave", points = 5,
    description = "Collect every type of crab.",
    id = 241885, badge = "362200", published = "8/21/2022 6:29:57 AM", modified = "6/3/2023 11:40:20 PM",
    trigger = inGame() && measured((picturebook_6HermitCrab() + picturebook_6SandCrab() + picturebook_6CoconutCrab()) == 3) &&
              (prev(picturebook_6HermitCrab()) + prev(picturebook_6SandCrab()) + prev(picturebook_6CoconutCrab())) == 2
)

achievement(
    title = "Reptilian Buds", points = 5,
    description = "Collect both types of reptile.",
    id = 241886, badge = "362201", published = "8/21/2022 6:29:57 AM", modified = "6/3/2023 11:40:48 PM",
    trigger = inGame() && measured((picturebook_6Tortoise() + picturebook_6Lizard()) == 2) &&
              (prev(picturebook_6Tortoise()) + prev(picturebook_6Lizard())) == 1
)

achievement(
    title = "Just a Snack", points = 5,
    description = "Collect every type of bird meat and an egg.",
    id = 241887, badge = "362202", published = "8/21/2022 6:29:57 AM", modified = "6/3/2023 11:41:06 PM",
    trigger = inGame() && measured((picturebook_7Duck() + picturebook_7Chicken() + picturebook_8Pigeon() + picturebook_16Egg()) == 4) &&
              (prev(picturebook_7Duck()) + prev(picturebook_7Chicken()) + prev(picturebook_8Pigeon()) +
              prev(picturebook_16Egg())) == 3
)

achievement(
    title = "A Full Meal", points = 10,
    description = "Collect every type of mammal meat.",
    id = 241888, badge = "362203", published = "8/21/2022 6:29:58 AM", modified = "6/3/2023 11:41:49 PM",
    trigger = inGame() && measured((picturebook_7Boar() + picturebook_7Deer() + picturebook_7Raccoon() + picturebook_7Rabbit() +
                  picturebook_8FieldMouse() + picturebook_8Goat() + picturebook_8Lynx() + picturebook_8Squirrel() +
                  picturebook_8Wolf()) == 9
              ) &&
              (prev(picturebook_7Boar()) + prev(picturebook_7Deer()) + prev(picturebook_7Raccoon()) +
              prev(picturebook_7Rabbit()) + prev(picturebook_8FieldMouse()) + prev(picturebook_8Goat()) +
              prev(picturebook_8Lynx()) + prev(picturebook_8Squirrel()) + prev(picturebook_8Wolf())) == 8
)

achievement(
    title = "Freshwater Fisherman", points = 10,
    description = "Collect every type of freshwater fish.",
    id = 241889, badge = "362204", published = "8/21/2022 6:29:58 AM", modified = "8/21/2022 6:29:58 AM",
    trigger = inGame() && measured((picturebook_4Sweetfish() + picturebook_4Catfish() + picturebook_4BlackBass() +
                  picturebook_5Arowana() + picturebook_5Carp() + picturebook_5Eel() + picturebook_5Crucian() +
                  picturebook_5Char() + picturebook_5Salmon() + picturebook_5MasuSalmon() + picturebook_5JapaneseHuchen() +
                  picturebook_6RainbowTrout()) == 12
              ) &&
              (prev(picturebook_4Sweetfish()) + prev(picturebook_4Catfish()) + prev(picturebook_4BlackBass()) +
              prev(picturebook_5Arowana()) + prev(picturebook_5Carp()) + prev(picturebook_5Eel()) +
              prev(picturebook_5Crucian()) + prev(picturebook_5Char()) + prev(picturebook_5Salmon()) +
              prev(picturebook_5MasuSalmon()) + prev(picturebook_5JapaneseHuchen()) + prev(picturebook_6RainbowTrout())) == 11
              
)

achievement(
    title = "Sea Fisherman", points = 10,
    description = "Collect every type of saltwater fish.",
    id = 241890, badge = "362205", published = "8/21/2022 6:29:58 AM", modified = "8/21/2022 6:29:58 AM",
    trigger = inGame() && measured((picturebook_2Mackerel() + picturebook_3StripedBreakperch() + picturebook_3Sillaginoid() +
                  picturebook_3BalloonFish() + picturebook_3Moray() + picturebook_3Sardine() + picturebook_3StingFish() +
                  picturebook_3FileFish() + picturebook_3Flatfish() + picturebook_4SeaBream() + picturebook_4ParrotFish() +
                  picturebook_4BlackNibbler() + picturebook_4YellowfinGoby() + picturebook_4SeaBass()) == 14
              ) &&
              (prev(picturebook_2Mackerel()) + prev(picturebook_3StripedBreakperch()) + prev(picturebook_3Sillaginoid())
              + prev(picturebook_3BalloonFish()) + prev(picturebook_3Moray()) + prev(picturebook_3Sardine()) +
              prev(picturebook_3StingFish()) + prev(picturebook_3FileFish()) + prev(picturebook_3Flatfish()) +
              prev(picturebook_4SeaBream()) + prev(picturebook_4ParrotFish()) + prev(picturebook_4BlackNibbler()) +
              prev(picturebook_4YellowfinGoby()) + prev(picturebook_4SeaBass())) == 13
)

// Ticket 88092: I go drink water because my stats was so bad, and than get it after drink.
//               https://drive.google.com/file/d/1sS3wUpZ-ncfkeZsV_JgVdh-3BqV5x_h5/view?usp=sharing - savestate
achievement(
    title = "A Super Mushroom!", points = 5,
    description = "Find and eat an energetic mushroom.",
    id = 241875, badge = "362206", published = "8/21/2022 6:29:32 AM", modified = "8/21/2022 7:32:49 PM",
    trigger = inGame() && ((prev(jackEnergyLength()) == 0 && jackEnergyLength() == 14) || (prev(amyEnergyLength()) == 0 && amyEnergyLength() == 14))
)

achievement(
    title = "Catch These Hands!", points = 5,
    description = "Defend yourself with no weapons in your inventory.",
    id = 241876, badge = "362207", published = "8/21/2022 6:29:33 AM", modified = "8/21/2022 7:37:41 PM",
    trigger = inGame() && scene() > prev(scene()) && scene() == 17 &&
              (playerItem1Id() != 173 && playerItem2Id() != 173 && playerItem3Id() != 173 && playerItem4Id() != 173 &&
                  playerItem5Id() != 173 && playerItem6Id() != 173 && playerItem7Id() != 173 && playerItem8Id() != 173 &&
                  playerItem9Id() != 173 && playerItem10Id() != 173 && playerItem11Id() != 173 && playerItem12Id() != 173 &&
                  playerItem13Id() != 173 && playerItem14Id() != 173 && playerItem15Id() != 173 &&
                  playerItem16Id() != 173 && playerItem17Id() != 173 && playerItem18Id() != 173 &&
                  playerItem19Id() != 173 && playerItem20Id() != 173
              ) &&
              (playerItem1Id() != 174 && playerItem2Id() != 174 && playerItem3Id() != 174 && playerItem4Id() != 174 &&
                  playerItem5Id() != 174 && playerItem6Id() != 174 && playerItem7Id() != 174 && playerItem8Id() != 174 &&
                  playerItem9Id() != 174 && playerItem10Id() != 174 && playerItem11Id() != 174 && playerItem12Id() != 174 &&
                  playerItem13Id() != 174 && playerItem14Id() != 174 && playerItem15Id() != 174 &&
                  playerItem16Id() != 174 && playerItem17Id() != 174 && playerItem18Id() != 174 &&
                  playerItem19Id() != 174 && playerItem20Id() != 174
              ) &&
              (playerItem1Id() != 185 && playerItem2Id() != 185 && playerItem3Id() != 185 && playerItem4Id() != 185 &&
                  playerItem5Id() != 185 && playerItem6Id() != 185 && playerItem7Id() != 185 && playerItem8Id() != 185 &&
                  playerItem9Id() != 185 && playerItem10Id() != 185 && playerItem11Id() != 185 && playerItem12Id() != 185 &&
                  playerItem13Id() != 185 && playerItem14Id() != 185 && playerItem15Id() != 185 &&
                  playerItem16Id() != 185 && playerItem17Id() != 185 && playerItem18Id() != 185 &&
                  playerItem19Id() != 185 && playerItem20Id() != 185
              ) &&
              (playerItem1Id() != 186 && playerItem2Id() != 186 && playerItem3Id() != 186 && playerItem4Id() != 186 &&
                  playerItem5Id() != 186 && playerItem6Id() != 186 && playerItem7Id() != 186 && playerItem8Id() != 186 &&
                  playerItem9Id() != 186 && playerItem10Id() != 186 && playerItem11Id() != 186 && playerItem12Id() != 186 &&
                  playerItem13Id() != 186 && playerItem14Id() != 186 && playerItem15Id() != 186 &&
                  playerItem16Id() != 186 && playerItem17Id() != 186 && playerItem18Id() != 186 &&
                  playerItem19Id() != 186 && playerItem20Id() != 186
              ) &&
              (playerItem1Id() != 187 && playerItem2Id() != 187 && playerItem3Id() != 187 && playerItem4Id() != 187 &&
                  playerItem5Id() != 187 && playerItem6Id() != 187 && playerItem7Id() != 187 && playerItem8Id() != 187 &&
                  playerItem9Id() != 187 && playerItem10Id() != 187 && playerItem11Id() != 187 && playerItem12Id() != 187 &&
                  playerItem13Id() != 187 && playerItem14Id() != 187 && playerItem15Id() != 187 &&
                  playerItem16Id() != 187 && playerItem17Id() != 187 && playerItem18Id() != 187 &&
                  playerItem19Id() != 187 && playerItem20Id() != 187
              ) &&
              (playerItem1Id() != 188 && playerItem2Id() != 188 && playerItem3Id() != 188 && playerItem4Id() != 188 &&
                  playerItem5Id() != 188 && playerItem6Id() != 188 && playerItem7Id() != 188 && playerItem8Id() != 188 &&
                  playerItem9Id() != 188 && playerItem10Id() != 188 && playerItem11Id() != 188 && playerItem12Id() != 188 &&
                  playerItem13Id() != 188 && playerItem14Id() != 188 && playerItem15Id() != 188 &&
                  playerItem16Id() != 188 && playerItem17Id() != 188 && playerItem18Id() != 188 &&
                  playerItem19Id() != 188 && playerItem20Id() != 188
              ) &&
              (playerItem1Id() != 189 && playerItem2Id() != 189 && playerItem3Id() != 189 && playerItem4Id() != 189 &&
                  playerItem5Id() != 189 && playerItem6Id() != 189 && playerItem7Id() != 189 && playerItem8Id() != 189 &&
                  playerItem9Id() != 189 && playerItem10Id() != 189 && playerItem11Id() != 189 && playerItem12Id() != 189 &&
                  playerItem13Id() != 189 && playerItem14Id() != 189 && playerItem15Id() != 189 &&
                  playerItem16Id() != 189 && playerItem17Id() != 189 && playerItem18Id() != 189 &&
                  playerItem19Id() != 189 && playerItem20Id() != 189
              ) &&
              (playerItem1Id() != 190 && playerItem2Id() != 190 && playerItem3Id() != 190 && playerItem4Id() != 190 &&
                  playerItem5Id() != 190 && playerItem6Id() != 190 && playerItem7Id() != 190 && playerItem8Id() != 190 &&
                  playerItem9Id() != 190 && playerItem10Id() != 190 && playerItem11Id() != 190 && playerItem12Id() != 190 &&
                  playerItem13Id() != 190 && playerItem14Id() != 190 && playerItem15Id() != 190 &&
                  playerItem16Id() != 190 && playerItem17Id() != 190 && playerItem18Id() != 190 &&
                  playerItem19Id() != 190 && playerItem20Id() != 190
              ) &&
              (playerItem1Id() != 191 && playerItem2Id() != 191 && playerItem3Id() != 191 && playerItem4Id() != 191 &&
                  playerItem5Id() != 191 && playerItem6Id() != 191 && playerItem7Id() != 191 && playerItem8Id() != 191 &&
                  playerItem9Id() != 191 && playerItem10Id() != 191 && playerItem11Id() != 191 && playerItem12Id() != 191 &&
                  playerItem13Id() != 191 && playerItem14Id() != 191 && playerItem15Id() != 191 &&
                  playerItem16Id() != 191 && playerItem17Id() != 191 && playerItem18Id() != 191 &&
                  playerItem19Id() != 191 && playerItem20Id() != 191
              )
)

achievement(
    title = "Well-Rested", points = 5,
    description = "Craft the best beds.",
    id = 241891, badge = "362208", published = "8/21/2022 6:29:59 AM", modified = "8/21/2022 6:29:59 AM",
    trigger = inGame() && picturebookBed() > prev(picturebookBed())
)

achievement(
    title = "The Best Dining in the Wild", points = 5,
    description = "Build the best table set.",
    id = 241892, badge = "362209", published = "8/21/2022 6:29:59 AM", modified = "8/21/2022 6:29:59 AM",
    trigger = inGame() && picturebookTableSet() > prev(picturebookTableSet())
)

achievement(
    title = "A Home for Everything", points = 5,
    description = "Build the tallest shelving.",
    id = 241893, badge = "362210", published = "8/21/2022 6:29:59 AM", modified = "6/3/2023 11:47:25 PM",
    trigger = inGame() && picturebookShelf() > prev(picturebookShelf())
)

achievement(
    title = "Preservation Is Important", points = 5,
    description = "Make the jerky shelf.",
    id = 241894, badge = "362211", published = "8/21/2022 6:29:59 AM", modified = "6/3/2023 11:47:53 PM",
    trigger = inGame() && picturebookSmokerShelf() > prev(picturebookSmokerShelf())
)

achievement(
    title = "Jerky Doesn't Expire, Baby!", points = 5,
    description = "Ask your partner to make you every type of jerky.",
    id = 241895, badge = "362212", published = "8/21/2022 6:30:00 AM", modified = "8/21/2022 6:30:00 AM",
    trigger = inGame() && measured((picturebook_15SmokedMeatSmall() + picturebook_15SmokedMeatMedium() +
                  picturebook_15SmokedMeatLarge() + picturebook_15SmokedFishSmall() + picturebook_16SmokedFishMedium() +
                  picturebook_16SmokedFishLarge()) == 6
              ) &&
              (prev(picturebook_15SmokedMeatSmall()) + prev(picturebook_15SmokedMeatMedium()) +
              prev(picturebook_15SmokedMeatLarge()) + prev(picturebook_15SmokedFishSmall()) +
              prev(picturebook_16SmokedFishMedium()) + prev(picturebook_16SmokedFishLarge())) == 5
)

achievement(
    title = "Sweet Treehouse", points = 25,
    description = "Build a second shelter.",
    id = 241896, badge = "362213", published = "8/21/2022 6:30:00 AM", modified = "8/21/2022 6:30:00 AM",
    trigger = inGame() && picturebookHouse() > prev(picturebookHouse())
)

achievement(
    title = "Backyard Chicken", points = 5,
    description = "Use a small trap to catch a chicken.",
    id = 241897, badge = "362214", published = "8/21/2022 6:30:00 AM", modified = "6/3/2023 11:48:55 PM",
    trigger = inGame() && domesticatedChicken() == 3 && prev(domesticatedChicken()) == 0
)

achievement(
    title = "Goat Herder", points = 10,
    description = "Use a large trap to catch a goat.",
    id = 241898, badge = "362215", published = "8/21/2022 6:30:01 AM", modified = "6/3/2023 11:49:19 PM",
    trigger = inGame() && domesticatedGoat() == 3 && prev(domesticatedGoat()) == 0
)

achievement(
    title = "Pro Fisher", points = 5,
    description = "Craft the best fishing rod.",
    id = 241899, badge = "362216", published = "8/21/2022 6:30:01 AM", modified = "6/3/2023 11:49:33 PM",
    trigger = inGame() && picturebook_21BambooFishingRodA() > prev(picturebook_21BambooFishingRodA())
)

achievement(
    title = "Pro Archer", points = 5,
    description = "Craft the best bow.",
    id = 241900, badge = "362217", published = "8/21/2022 6:30:01 AM", modified = "6/3/2023 11:49:56 PM",
    trigger = inGame() && picturebook_21BambooBow() > prev(picturebook_21BambooBow())
)

achievement(
    title = "Pro Fletcher", points = 5,
    description = "Craft the best arrow.",
    id = 241901, badge = "362218", published = "8/21/2022 6:30:02 AM", modified = "6/3/2023 11:50:14 PM",
    trigger = inGame() && picturebook_23IronArrowsB() > prev(picturebook_23IronArrowsB())
)

achievement(
    title = "Pro Hunter", points = 5,
    description = "Craft the best spear.",
    id = 241902, badge = "362219", published = "8/21/2022 6:30:02 AM", modified = "6/3/2023 11:50:33 PM",
    trigger = inGame() && picturebook_23IronSpear() > prev(picturebook_23IronSpear())
)

achievement(
    title = "Making Fishing Easy", points = 10,
    description = "Craft every round, thin, and long lure.",
    id = 241903, badge = "362220", published = "8/21/2022 6:30:03 AM", modified = "6/3/2023 11:50:58 PM",
    trigger = inGame() && measured((picturebook_24RoundLureA() + picturebook_24RoundLureB() + picturebook_24RoundLureC() +
                  picturebook_24ThinLureA() + picturebook_24ThinLureB() + picturebook_24ThinLureC() +
                  picturebook_25LongLureA() + picturebook_25LongLureB() + picturebook_25LongLureC()) == 9
              ) &&
              (prev(picturebook_24RoundLureA()) + prev(picturebook_24RoundLureB()) + prev(picturebook_24RoundLureC()) +
              prev(picturebook_24ThinLureA()) + prev(picturebook_24ThinLureB()) + prev(picturebook_24ThinLureC()) +
              prev(picturebook_25LongLureA()) + prev(picturebook_25LongLureB()) + prev(picturebook_25LongLureC())) == 8
)

achievement(
    title = "Special Fishing", points = 10,
    description = "Craft the special lure.",
    id = 241904, badge = "362221", published = "8/21/2022 6:30:03 AM", modified = "6/3/2023 11:51:33 PM",
    trigger = inGame() && picturebook_25SpecialLure() > prev(picturebook_25SpecialLure())
)

achievement(
    title = "Best Friends", points = 5,
    description = "Reach maximum happiness with your partner.",
    id = 241905, badge = "362229", published = "8/21/2022 6:30:03 AM", modified = "6/3/2023 11:52:34 PM",
    trigger = inGame() && partnerHappiness() == 100 && partnerHappiness() > prev(partnerHappiness())
)

achievement(
    title = "Stir-Fry, Perhaps?", points = 5,
    description = "Find and dig up the flat rock.",
    id = 241906, badge = "362230", published = "8/21/2022 6:30:04 AM", modified = "6/3/2023 11:53:02 PM",
    trigger = inGame() && picturebook_20FlatRock() > prev(picturebook_20FlatRock())
)

achievement(
    title = "Soup Time", points = 5,
    description = "Find and dig up the indented rock.",
    id = 241907, badge = "362231", published = "8/21/2022 6:30:04 AM", modified = "6/3/2023 11:53:22 PM",
    trigger = inGame() && picturebook_20IndentedRock() == 1 && picturebook_20() > prev(picturebook_20())
)

achievement(
    title = "Slicing and Dicing", points = 10,
    description = "Prepare every cut recipe.",
    id = 241908, badge = "362232", published = "8/21/2022 6:30:04 AM", modified = "6/3/2023 11:53:46 PM",
    trigger = inGame() && measured((picturebookEggSalad() + picturebook_26RadishSalad() + picturebook_26BurdockRootSalad() +
                  picturebook_26SeaweedSalad() + picturebook_26MushroomSalad() + picturebook_26MackerelSashimi() +
                  picturebook_26SeaBassSashimi() + picturebook_26SashimiPlatter() + picturebook_26FruitPlatter()) == 9
              ) &&
              (prev(picturebookEggSalad()) + picturebook_26RadishSalad() + picturebook_26BurdockRootSalad() +
              picturebook_26SeaweedSalad() + picturebook_26MushroomSalad() + picturebook_26MackerelSashimi() +
              picturebook_26SeaBassSashimi() + picturebook_26SashimiPlatter() + prev(picturebook_26FruitPlatter())) == 8
)

achievement(
    title = "Backyard Grill-Off", points = 10,
    description = "Cook every grilled recipe.",
    id = 241909, badge = "362233", published = "8/21/2022 6:30:05 AM", modified = "6/3/2023 11:54:03 PM",
    trigger = inGame() && measured((picturebook_27BakedPotato() + picturebook_27GrilledEel() + picturebook_27GrilledSweetfish() +
                  picturebook_27GrilledClam() + picturebook_27GrilledChicken() + picturebook_27GrilledSalmon() +
                  picturebook_27GrilledSeaBream() + picturebook_27GrilledMasuSalmon() + picturebook_28ButterGrilledTrout() +
                  picturebook_28GrilledSeaBass() + picturebook_28MasuSalmonSkewer() + picturebook_28SauteedNibbler() +
                  picturebook_28SauteedWolf()) == 13
              ) &&
              (prev(picturebook_27BakedPotato()) + prev(picturebook_27GrilledEel()) +
              prev(picturebook_27GrilledSweetfish()) + prev(picturebook_27GrilledClam()) +
              prev(picturebook_27GrilledChicken()) + prev(picturebook_27GrilledSalmon()) +
              prev(picturebook_27GrilledSeaBream()) + prev(picturebook_27GrilledMasuSalmon()) +
              prev(picturebook_28ButterGrilledTrout()) + prev(picturebook_28GrilledSeaBass()) +
              prev(picturebook_28MasuSalmonSkewer()) + prev(picturebook_28SauteedNibbler()) +
              prev(picturebook_28SauteedWolf())) == 12
)

achievement(
    title = "All Verbed Up", points = 10,
    description = "Cook every stir-fried recipe.",
    id = 241910, badge = "362234", published = "8/21/2022 6:30:05 AM", modified = "6/3/2023 11:54:29 PM",
    trigger = inGame() && measured((picturebook_28TropicalFriedPork() + picturebook_28PanfriedFlatfish() +
                  picturebook_28CrabOmelette() + picturebook_29MushroomOmelette() + picturebook_29ItalianOmelette() +
                  picturebook_29ButterFriedClam() + picturebook_29MushroomSaute() + picturebook_29BurdockRoot() +
                  picturebook_29EggsSunnysideUp() + picturebook_29RainbowTroutSaute() + picturebook_29PanfriedSeaBass()) == 11
              ) &&
              (prev(picturebook_28TropicalFriedPork()) + prev(picturebook_28PanfriedFlatfish()) +
              prev(picturebook_28CrabOmelette()) + prev(picturebook_29MushroomOmelette()) +
              prev(picturebook_29ItalianOmelette()) + prev(picturebook_29ButterFriedClam()) +
              prev(picturebook_29MushroomSaute()) + prev(picturebook_29BurdockRoot()) +
              prev(picturebook_29EggsSunnysideUp()) + prev(picturebook_29RainbowTroutSaute()) +
              prev(picturebook_29PanfriedSeaBass())) == 10
)

achievement(
    title = "Fire Burn and Cookpot Bubble", points = 10,
    description = "Cook every boiled recipe.",
    id = 241911, badge = "362235", published = "8/21/2022 6:30:05 AM", modified = "6/3/2023 11:54:56 PM",
    trigger = inGame() && measured((picturebook_30BoiledPorkSalad() + picturebook_30ClamChowder() + picturebook_30MeatPotatoStew() +
                  picturebook_30Potaufeu() + picturebook_30SardineSoup() + picturebook_30OnionSoup() +
                  picturebook_30PigeonSoup() + picturebook_30DuckHotPot() + picturebook_31BoiledEgg() +
                  picturebook_31SalmonHotPot() + picturebook_31RaccoonHotPot() + picturebook_31PorkMisoSoup() +
                  picturebook_31DeerHotPot() + picturebook_31BoiledBambooShoot() + picturebook_31WolfHotPot() +
                  picturebook_31CreamStew()) == 16
              ) &&
              (prev(picturebook_30BoiledPorkSalad()) + prev(picturebook_30ClamChowder()) +
              prev(picturebook_30MeatPotatoStew()) + prev(picturebook_30Potaufeu()) + prev(picturebook_30SardineSoup())
              + prev(picturebook_30OnionSoup()) + prev(picturebook_30PigeonSoup()) + prev(picturebook_30DuckHotPot()) +
              prev(picturebook_31BoiledEgg()) + prev(picturebook_31SalmonHotPot()) + prev(picturebook_31RaccoonHotPot())
              + prev(picturebook_31PorkMisoSoup()) + prev(picturebook_31DeerHotPot()) +
              prev(picturebook_31BoiledBambooShoot()) + prev(picturebook_31WolfHotPot()) +
              prev(picturebook_31CreamStew())) == 15
)

achievement(
    title = "Fried to the Core", points = 10,
    description = "Cook every deep-fried recipe.",
    id = 241912, badge = "362236", published = "8/21/2022 6:30:06 AM", modified = "6/3/2023 11:55:14 PM",
    trigger = inGame() && measured((picturebook_32FriedSillaginoid() + picturebook_32OnionRings() + picturebook_32FrenchFries() +
                  picturebook_32FriedOyster() + picturebook_32FriedMackerel() + picturebook_32DeepFriedChicken() +
                  picturebook_32MixedTempura() + picturebook_32GobyTempura() + picturebook_33LotusRootChips()) == 9
              ) &&
              (prev(picturebook_32FriedSillaginoid()) + prev(picturebook_32OnionRings()) +
              prev(picturebook_32FrenchFries()) + prev(picturebook_32FriedOyster()) +
              prev(picturebook_32FriedMackerel()) + prev(picturebook_32DeepFriedChicken()) +
              prev(picturebook_32MixedTempura()) + prev(picturebook_32GobyTempura()) +
              prev(picturebook_33LotusRootChips())) == 8
)

achievement(
    title = "Getting Steamy", points = 5,
    description = "Cook every steamed recipe.",
    id = 241913, badge = "362237", published = "8/21/2022 6:30:06 AM", modified = "6/3/2023 11:55:35 PM",
    trigger = inGame() && measured((picturebook_33PotatoSalad() + picturebook_33SteamedCrab() + picturebook_33SteamedTaro() +
                  picturebook_33EggHotchpotch() + picturebook_33CustardPudding() + picturebook_33SteamedSeaUrchin()) == 6
              ) &&
              (prev(picturebook_33PotatoSalad()) + prev(picturebook_33SteamedCrab()) + prev(picturebook_33SteamedTaro())
              + prev(picturebook_33EggHotchpotch()) + prev(picturebook_33CustardPudding()) +
              prev(picturebook_33SteamedSeaUrchin())) == 5
)

achievement(
    title = "Maze Jungle", points = 2, type="progression",
    description = "Find the jungle.",
    id = 241914, badge = "362238", published = "8/21/2022 6:30:06 AM", modified = "8/21/2022 6:30:06 AM",
    trigger = inGame() && location() == 9 && location() > prev(location())
)

achievement(
    title = "The Grassland", points = 2,
    description = "Find the grasslands.",
    id = 241915, badge = "362239", published = "8/21/2022 6:30:06 AM", modified = "8/21/2022 6:30:06 AM",
    trigger = inGame() && location() == 29 && location() > prev(location())
)

achievement(
    title = "Into the Bog", points = 2, type="progression",
    description = "Find the swamp.",
    id = 241916, badge = "362240", published = "8/21/2022 6:30:07 AM", modified = "8/21/2022 6:30:07 AM",
    trigger = inGame() && location() == 10 && location() > prev(location())
)

achievement(
    title = "River Rafting ", points = 5, type="progression",
    description = "Find the lake.",
    id = 241917, badge = "362241", published = "8/21/2022 6:30:07 AM", modified = "8/21/2022 6:30:07 AM",
    trigger = inGame() && location() == 11 && location() > prev(location())
)

achievement(
    title = "Rubbled Ruins", points = 4, type="progression",
    description = "Find the ruins.",
    id = 241918, badge = "362242", published = "8/21/2022 6:30:07 AM", modified = "8/21/2022 6:30:07 AM",
    trigger = inGame() && location() == 12 && location() > prev(location())
)

achievement(
    title = "The Final Beach", points = 10,
    description = "Find the last beach on the island.",
    id = 241919, badge = "362243", published = "8/21/2022 6:30:08 AM", modified = "8/21/2022 6:30:08 AM",
    trigger = inGame() && location() == 19 && location() > prev(location())
)

achievement(
    title = "The Peak", points = 10, type="progression",
    description = "Find the highest point on the island.",
    id = 241920, badge = "362244", published = "8/21/2022 6:30:08 AM", modified = "8/21/2022 6:30:08 AM",
    trigger = inGame() && location() == 28 && location() > prev(location())
)

achievement(
    title = "When Did This Open?", points = 25,
    description = "Find the secret underground lake.",
    id = 241921, badge = "362245", published = "8/21/2022 6:30:08 AM", modified = "8/21/2022 6:30:08 AM",
    trigger = inGame() && location() == 33 && location() > prev(location())
)

achievement(
    title = "Cartography", points = 10,
    description = "Dive and find every map.",
    id = 241877, badge = "362246", published = "8/21/2022 6:29:48 AM", modified = "6/3/2023 11:58:17 PM",
    trigger = measured((picturebook_19MapA() + picturebook_19MapB() + picturebook_19MapC() + picturebook_19MapD()) == 4) &&
              (prev(picturebook_19MapA()) + prev(picturebook_19MapB()) + prev(picturebook_19MapC()) +
              prev(picturebook_19MapD())) == 3
)

achievement(
    title = "As Bright as the Sun", points = 5,
    description = "Dive and find the red stone.",
    id = 241922, badge = "362247", published = "8/21/2022 6:30:09 AM", modified = "12/31/2025 5:29:07 PM",
    trigger = inGame() && picturebook_17RedStone() > prev(picturebook_17RedStone())
)

achievement(
    title = "As Dim as the Sunset", points = 5,
    description = "Dive and find the orange stone.",
    id = 241923, badge = "362248", published = "8/21/2022 6:30:10 AM", modified = "12/31/2025 5:29:07 PM",
    trigger = inGame() && picturebook_17OrangeStone() > prev(picturebook_17OrangeStone())
)

achievement(
    title = "As Calm as the Moon", points = 5,
    description = "Dive and find the yellow stone.",
    id = 241924, badge = "362249", published = "8/21/2022 6:30:10 AM", modified = "12/31/2025 5:29:08 PM",
    trigger = inGame() && picturebook_17YellowStone() > prev(picturebook_17YellowStone())
)

achievement(
    title = "As Green as a Leaf", points = 5,
    description = "Dive and find the green stone.",
    id = 241925, badge = "362250", published = "8/21/2022 6:30:10 AM", modified = "12/31/2025 5:29:08 PM",
    trigger = inGame() && picturebook_17BrownPointyShell() > prev(picturebook_17BrownPointyShell())
)

achievement(
    title = "As Blue as the Sky", points = 5,
    description = "Dive and find the light blue stone.",
    id = 241926, badge = "362251", published = "8/21/2022 6:30:11 AM", modified = "12/31/2025 5:29:08 PM",
    trigger = inGame() && picturebook_17BlackPointyShell() > prev(picturebook_17BlackPointyShell())
)

// Ticket 102216: A while ago, I obtained the dark blue stone and it shows up in my picturebook (see screenshots:
//               https://imgur.com/a/tpdl6pN ) however I do not have the achievement. I did not notice the achievement
//               was missing until recently so my memory isn't the best, but I was diving and found the dark blue stone
//               on the seafloor of (i believe) beach 3. I did get the achievement for the red stone (obtained from the
//               gorilla in the forest) and haven't encountered any other stones in my playthrough.
achievement(
    title = "As Deep as the Sea", points = 5,
    description = "Dive and find the dark blue stone.",
    id = 241927, badge = "362252", published = "8/21/2022 6:30:11 AM", modified = "12/31/2025 5:29:08 PM",
    trigger = inGame() && picturebook_17WhiteOddShell() > prev(picturebook_17WhiteOddShell()) &&
              picturebook_17BrownPointyShell() == prev(picturebook_17BrownPointyShell())
)

achievement(
    title = "As Dark as the Night", points = 5,
    description = "Dive and find the purple stone.",
    id = 241928, badge = "362253", published = "8/21/2022 6:30:11 AM", modified = "12/31/2025 5:29:09 PM",
    trigger = inGame() && picturebook_17BrownOddShell() > prev(picturebook_17BrownOddShell()) &&
              picturebook_17BrownPointyShell() == prev(picturebook_17BrownPointyShell())
)

achievement(
    title = "How Beautiful!", points = 25,
    description = "Using seashells and stones, make every type of necklace.",
    id = 241929, badge = "362254", published = "8/21/2022 6:30:12 AM", modified = "8/21/2022 6:30:12 AM",
    trigger = inGame() && measured((picturebook_18ShellNecklace() + picturebook_18SunNecklace() + picturebook_18SunsetNecklace() +
                  picturebook_18MoonNecklace() + picturebook_19YoungLeafNecklace() + picturebook_19BlueSkyNecklace() +
                  picturebook_19DeepSeaNecklace() + picturebook_19NightSkyNecklace()) == 8
              ) &&
              (prev(picturebook_18ShellNecklace()) + prev(picturebook_18SunNecklace()) +
              prev(picturebook_18SunsetNecklace()) + prev(picturebook_18MoonNecklace()) +
              prev(picturebook_19YoungLeafNecklace()) + prev(picturebook_19BlueSkyNecklace()) +
              prev(picturebook_19DeepSeaNecklace()) + prev(picturebook_19NightSkyNecklace())) == 7
)

achievement(
    title = "Pack Up and Ship Out", points = 10, type="win_condition",
    description = "Successfully escape with the life boat.",
    id = 241930, badge = "362255", published = "8/21/2022 6:30:12 AM", modified = "6/4/2023 12:00:54 AM",
    trigger = inGame() && cutsceneId() > prev(cutsceneId()) && cutsceneId() == 17
)

achievement(
    title = "Build Your Own Escape", points = 25, type="win_condition",
    description = "Successfully escape by building a raft and shipping off.",
    id = 241931, badge = "362256", published = "8/21/2022 6:30:12 AM", modified = "8/21/2022 6:30:12 AM",
    trigger = inGame() && cutsceneId() > prev(cutsceneId()) && cutsceneId() == 15
)

achievement(
    title = "Smoke Signal Rescue", points = 25, type="win_condition",
    description = "Successfully escape by signalling the helicopter.",
    id = 241932, badge = "362257", published = "8/21/2022 6:30:13 AM", modified = "8/21/2022 6:30:13 AM",
    trigger = inGame() && cutsceneId() > prev(cutsceneId()) && cutsceneId() == 13 && location() == 2
)

achievement(
    title = "Five Distress Signals", points = 25, type="win_condition",
    description = "Successfully escape by lighting the pillars. ",
    id = 241933, badge = "362258", published = "8/21/2022 6:30:13 AM", modified = "8/21/2022 6:30:13 AM",
    trigger = inGame() && cutsceneId() > prev(cutsceneId()) && cutsceneId() == 19
)

achievement(
    title = "It's Just a Week...", points = 10,
    description = "In Serious Survival, live for at least one week.",
    id = 241878, badge = "362259", published = "8/21/2022 6:29:54 AM", modified = "10/29/2024 4:10:09 PM",
    trigger = inGame() && currentDay() == 7 && prev(currentDay()) == 6 && seriousSurvival() == 4294967295
)

achievement(
    title = "A Month Is Serious Business", points = 25,
    description = "In Serious Survival, live for at least one month.",
    id = 241879, badge = "362260", published = "8/21/2022 6:29:55 AM", modified = "10/29/2024 4:10:10 PM",
    trigger = inGame() && currentDay() == 30 && prev(currentDay()) == 29 && seriousSurvival() == 4294967295
)

achievement(
    title = "Alone for Three Months!", points = 50,
    description = "In Serious Survival, live for at least three months.",
    id = 241880, badge = "362261", published = "8/21/2022 6:29:55 AM", modified = "10/29/2024 4:10:10 PM",
    trigger = inGame() && currentDay() == 90 && prev(currentDay()) == 89 && seriousSurvival() == 4294967295
)

achievement(
    title = "A Complete Picturebook", points = 50,
    description = "Find, craft, or cook every item in the game.",
    id = 241934, badge = "362262", published = "8/21/2022 6:30:49 AM", modified = "10/28/2024 11:20:53 AM",
    trigger = inGame() && measured((picturebookBed() + picturebookShelf() + picturebookSmokerShelf() + picturebookTableSet() +
                  picturebookHouse() + picturebookRaft() + picturebookRaft2() + picturebookAbalone() +
                  picturebook_2Shortneck() + picturebook_2Clam() + picturebook_2Scallop() + picturebook_2Oyster() +
                  picturebook_2FreshwaterClam() + picturebook_2Seaweed() + picturebook_2RedSeaUrchin() +
                  picturebook_2Mackerel() + picturebook_3StripedBreakperch() + picturebook_3Sillaginoid() +
                  picturebook_3BalloonFish() + picturebook_3Moray() + picturebook_3Sardine() + picturebook_3StingFish() +
                  picturebook_3FileFish() + picturebook_3Flatfish() + picturebook_4SeaBream() + picturebook_4ParrotFish() +
                  picturebook_4BlackNibbler() + picturebook_4YellowfinGoby() + picturebook_4SeaBass() +
                  picturebook_4Sweetfish() + picturebook_4Catfish() + picturebook_4BlackBass() + picturebook_5Arowana() +
                  picturebook_5Carp() + picturebook_5Eel() + picturebook_5Crucian() + picturebook_5Char() +
                  picturebook_5Salmon() + picturebook_5MasuSalmon() + picturebook_5JapaneseHuchen() +
                  picturebook_6RainbowTrout() + picturebook_6HermitCrab() + picturebook_6SandCrab() +
                  picturebook_6CoconutCrab() + picturebook_6Tortoise() + picturebook_6Lizard() + picturebook_7PitViper() +
                  picturebook_7Tarantula() + picturebook_7Boar() + picturebook_7Duck() + picturebook_7Deer() +
                  picturebook_7Raccoon() + picturebook_7Chicken() + picturebook_7Rabbit() + picturebook_8FieldMouse() +
                  picturebook_8Pigeon() + picturebook_8Goat() + picturebook_8Lynx() + picturebook_8Squirrel() +
                  picturebook_8Wolf() + picturebook_8Tiger() + picturebook_9Alligator() + picturebook_9Gorilla() +
                  picturebook_9GreatWhiteShark() + picturebook_10BlackMushroom() + picturebook_10BlueMushroom() +
                  picturebook_10BrownMushroom() + picturebook_10Bit3() + picturebook_10PurpleMushroom() +
                  picturebook_10RedMushroom() + picturebook_10WhiteMushroom() + picturebook_10YellowMushroom() +
                  picturebook_11Chives() + picturebook_11BambooShoot() + picturebook_11Carrot() + picturebook_11Dandelion()
                  + picturebook_11Burdock() + picturebook_11Onion() + picturebook_11Potato() + picturebook_11Radish() +
                  picturebook_12Taro() + picturebook_12Fern() + picturebook_12Coconut() + picturebook_12Papaya() +
                  picturebook_12Raspberry() + picturebook_12BreadFruit() + picturebook_12Banana() +
                  picturebook_12Pineapple() + picturebook_13Mugwort() + picturebook_13LotusRoot() + picturebook_13Guava() +
                  picturebook_13PassionFruit() + picturebook_13TreeVine() + picturebook_13TreeBark() + picturebook_13Leaf()
                  + picturebook_13Log() + picturebook_14Stick() + picturebook_14Twigs() + picturebook_14LargeBone() +
                  picturebook_14Fur() + picturebook_14Stone() + picturebook_14GreenBamboo() + picturebook_14Feather() +
                  picturebook_14Lard() + picturebook_15SharpenedStone() + picturebook_15SharpenedBone() +
                  picturebook_15Basket() + picturebook_15IronRod() + picturebook_15SmokedMeatSmall() +
                  picturebook_15SmokedMeatMedium() + picturebook_15SmokedMeatLarge() + picturebook_15SmokedFishSmall() +
                  picturebook_16SmokedFishMedium() + picturebook_16SmokedFishLarge() + picturebook_16Egg() +
                  picturebook_16Lunchbox() + picturebook_16WhiteRoundShell() + picturebook_16BrownRoundShell() +
                  picturebook_16BlackRoundShell() + picturebook_16WhitePointyShell() + picturebook_17BrownPointyShell() +
                  picturebook_17BlackPointyShell() + picturebook_17WhiteOddShell() + picturebook_17BrownOddShell() +
                  picturebook_17BlackOddShell() + picturebook_17RedStone() + picturebook_17OrangeStone() +
                  picturebook_17YellowStone() + picturebook_18GreenStone() + picturebook_18LightBlueStone() +
                  picturebook_18DarkBlueStone() + picturebook_18PurpleStone() + picturebook_18ShellNecklace() +
                  picturebook_18SunNecklace() + picturebook_18SunsetNecklace() + picturebook_18MoonNecklace() +
                  picturebook_19YoungLeafNecklace() + picturebook_19BlueSkyNecklace() + picturebook_19DeepSeaNecklace() +
                  picturebook_19NightSkyNecklace() + picturebook_19MapA() + picturebook_19MapB() + picturebook_19MapC() +
                  picturebook_19MapD() + picturebook_20Radio() + picturebook_20Bottle() + picturebook_20BottledWater() +
                  picturebook_20BottledMilk() + picturebook_20OilDrum() + picturebook_20FlatRock() +
                  picturebook_20IndentedRock() + picturebook_20FireStarter() + picturebook_21FireStarterWBow() +
                  picturebook_21BambooFishingRodA() + picturebook_21BambooFishingRodB() + picturebook_21WoodenFishingRodA()
                  + picturebook_21WoodenFishingRodB() + picturebook_21WoodenBow() + picturebook_21BambooBow() +
                  picturebook_21BambooArrowsA() + picturebook_22BambooArrowsB() + picturebook_22BambooArrowsC() +
                  picturebook_22BambooArrowsD() + picturebook_22WoodenArrowsA() + picturebook_22WoodenArrowsB() +
                  picturebook_22WoodenArrowsC() + picturebook_22WoodenArrowsD() + picturebook_22IronArrowsA() +
                  picturebook_23IronArrowsB() + picturebook_23BambooSpearA() + picturebook_23BambooSpearB() +
                  picturebook_23BambooSpearC() + picturebook_23WoodenSpearA() + picturebook_23WoodenSpearB() +
                  picturebook_23WoodenSpearC() + picturebook_23IronSpear() + picturebook_24WoodenTorch() +
                  picturebook_24BambooTorch() + picturebook_24RoundLureA() + picturebook_24RoundLureB() +
                  picturebook_24RoundLureC() + picturebook_24ThinLureA() + picturebook_24ThinLureB() +
                  picturebook_24ThinLureC() + picturebook_25LongLureA() + picturebook_25LongLureB() +
                  picturebook_25LongLureC() + picturebook_25SpecialLure() + picturebook_25SmallTrap() +
                  picturebook_25LargeTrap() + picturebook_25FishTrap() + picturebookEggSalad() + picturebook_26RadishSalad()
                  + picturebook_26BurdockRootSalad() + picturebook_26SeaweedSalad() + picturebook_26MushroomSalad() +
                  picturebook_26MackerelSashimi() + picturebook_26SeaBassSashimi() + picturebook_26SashimiPlatter() +
                  picturebook_26FruitPlatter() + picturebook_27BakedPotato() + picturebook_27GrilledEel() +
                  picturebook_27GrilledSweetfish() + picturebook_27GrilledClam() + picturebook_27GrilledChicken() +
                  picturebook_27GrilledSalmon() + picturebook_27GrilledSeaBream() + picturebook_27GrilledMasuSalmon() +
                  picturebook_28ButterGrilledTrout() + picturebook_28GrilledSeaBass() + picturebook_28MasuSalmonSkewer() +
                  picturebook_28SauteedNibbler() + picturebook_28SauteedWolf() + picturebook_28TropicalFriedPork() +
                  picturebook_28PanfriedFlatfish() + picturebook_28CrabOmelette() + picturebook_29MushroomOmelette() +
                  picturebook_29ItalianOmelette() + picturebook_29ButterFriedClam() + picturebook_29MushroomSaute() +
                  picturebook_29BurdockRoot() + picturebook_29EggsSunnysideUp() + picturebook_29RainbowTroutSaute() +
                  picturebook_29PanfriedSeaBass() + picturebook_30BoiledPorkSalad() + picturebook_30ClamChowder() +
                  picturebook_30MeatPotatoStew() + picturebook_30Potaufeu() + picturebook_30SardineSoup() +
                  picturebook_30OnionSoup() + picturebook_30PigeonSoup() + picturebook_30DuckHotPot() +
                  picturebook_31BoiledEgg() + picturebook_31SalmonHotPot() + picturebook_31RaccoonHotPot() +
                  picturebook_31PorkMisoSoup() + picturebook_31DeerHotPot() + picturebook_31BoiledBambooShoot() +
                  picturebook_31WolfHotPot() + picturebook_31CreamStew() + picturebook_32FriedSillaginoid() +
                  picturebook_32OnionRings() + picturebook_32FrenchFries() + picturebook_32FriedOyster() +
                  picturebook_32FriedMackerel() + picturebook_32DeepFriedChicken() + picturebook_32MixedTempura() +
                  picturebook_32GobyTempura() + picturebook_33LotusRootChips() + picturebook_33PotatoSalad() +
                  picturebook_33SteamedCrab() + picturebook_33SteamedTaro() + picturebook_33EggHotchpotch() +
                  picturebook_33CustardPudding() + picturebook_33SteamedSeaUrchin()) == 255
              ) &&
              (prev(picturebookBed()) + prev(picturebookShelf()) + prev(picturebookSmokerShelf()) +
              prev(picturebookTableSet()) + prev(picturebookHouse()) + prev(picturebookRaft()) +
              prev(picturebookRaft2()) + prev(picturebookAbalone()) + prev(picturebook_2Shortneck()) +
              prev(picturebook_2Clam()) + prev(picturebook_2Scallop()) + prev(picturebook_2Oyster()) +
              prev(picturebook_2FreshwaterClam()) + prev(picturebook_2Seaweed()) + prev(picturebook_2RedSeaUrchin()) +
              prev(picturebook_2Mackerel()) + prev(picturebook_3StripedBreakperch()) + prev(picturebook_3Sillaginoid())
              + prev(picturebook_3BalloonFish()) + prev(picturebook_3Moray()) + prev(picturebook_3Sardine()) +
              prev(picturebook_3StingFish()) + prev(picturebook_3FileFish()) + prev(picturebook_3Flatfish()) +
              prev(picturebook_4SeaBream()) + prev(picturebook_4ParrotFish()) + prev(picturebook_4BlackNibbler()) +
              prev(picturebook_4YellowfinGoby()) + prev(picturebook_4SeaBass()) + prev(picturebook_4Sweetfish()) +
              prev(picturebook_4Catfish()) + prev(picturebook_4BlackBass()) + prev(picturebook_5Arowana()) +
              prev(picturebook_5Carp()) + prev(picturebook_5Eel()) + prev(picturebook_5Crucian()) +
              prev(picturebook_5Char()) + prev(picturebook_5Salmon()) + prev(picturebook_5MasuSalmon()) +
              prev(picturebook_5JapaneseHuchen()) + prev(picturebook_6RainbowTrout()) + prev(picturebook_6HermitCrab())
              + prev(picturebook_6SandCrab()) + prev(picturebook_6CoconutCrab()) + prev(picturebook_6Tortoise()) +
              prev(picturebook_6Lizard()) + prev(picturebook_7PitViper()) + prev(picturebook_7Tarantula()) +
              prev(picturebook_7Boar()) + prev(picturebook_7Duck()) + prev(picturebook_7Deer()) +
              prev(picturebook_7Raccoon()) + prev(picturebook_7Chicken()) + prev(picturebook_7Rabbit()) +
              prev(picturebook_8FieldMouse()) + prev(picturebook_8Pigeon()) + prev(picturebook_8Goat()) +
              prev(picturebook_8Lynx()) + prev(picturebook_8Squirrel()) + prev(picturebook_8Wolf()) +
              prev(picturebook_8Tiger()) + prev(picturebook_9Alligator()) + prev(picturebook_9Gorilla()) +
              prev(picturebook_9GreatWhiteShark()) + prev(picturebook_10BlackMushroom()) +
              prev(picturebook_10BlueMushroom()) + prev(picturebook_10BrownMushroom()) + prev(picturebook_10Bit3()) +
              prev(picturebook_10PurpleMushroom()) + prev(picturebook_10RedMushroom()) +
              prev(picturebook_10WhiteMushroom()) + prev(picturebook_10YellowMushroom()) + prev(picturebook_11Chives())
              + prev(picturebook_11BambooShoot()) + prev(picturebook_11Carrot()) + prev(picturebook_11Dandelion()) +
              prev(picturebook_11Burdock()) + prev(picturebook_11Onion()) + prev(picturebook_11Potato()) +
              prev(picturebook_11Radish()) + prev(picturebook_12Taro()) + prev(picturebook_12Fern()) +
              prev(picturebook_12Coconut()) + prev(picturebook_12Papaya()) + prev(picturebook_12Raspberry()) +
              prev(picturebook_12BreadFruit()) + prev(picturebook_12Banana()) + prev(picturebook_12Pineapple()) +
              prev(picturebook_13Mugwort()) + prev(picturebook_13LotusRoot()) + prev(picturebook_13Guava()) +
              prev(picturebook_13PassionFruit()) + prev(picturebook_13TreeVine()) + prev(picturebook_13TreeBark()) +
              prev(picturebook_13Leaf()) + prev(picturebook_13Log()) + prev(picturebook_14Stick()) +
              prev(picturebook_14Twigs()) + prev(picturebook_14LargeBone()) + prev(picturebook_14Fur()) +
              prev(picturebook_14Stone()) + prev(picturebook_14GreenBamboo()) + prev(picturebook_14Feather()) +
              prev(picturebook_14Lard()) + prev(picturebook_15SharpenedStone()) + prev(picturebook_15SharpenedBone()) +
              prev(picturebook_15Basket()) + prev(picturebook_15IronRod()) + prev(picturebook_15SmokedMeatSmall()) +
              prev(picturebook_15SmokedMeatMedium()) + prev(picturebook_15SmokedMeatLarge()) +
              prev(picturebook_15SmokedFishSmall()) + prev(picturebook_16SmokedFishMedium()) +
              prev(picturebook_16SmokedFishLarge()) + prev(picturebook_16Egg()) + prev(picturebook_16Lunchbox()) +
              prev(picturebook_16WhiteRoundShell()) + prev(picturebook_16BrownRoundShell()) +
              prev(picturebook_16BlackRoundShell()) + prev(picturebook_16WhitePointyShell()) +
              prev(picturebook_17BrownPointyShell()) + prev(picturebook_17BlackPointyShell()) +
              prev(picturebook_17WhiteOddShell()) + prev(picturebook_17BrownOddShell()) +
              prev(picturebook_17BlackOddShell()) + prev(picturebook_17RedStone()) + prev(picturebook_17OrangeStone()) +
              prev(picturebook_17YellowStone()) + prev(picturebook_18GreenStone()) +
              prev(picturebook_18LightBlueStone()) + prev(picturebook_18DarkBlueStone()) +
              prev(picturebook_18PurpleStone()) + prev(picturebook_18ShellNecklace()) +
              prev(picturebook_18SunNecklace()) + prev(picturebook_18SunsetNecklace()) +
              prev(picturebook_18MoonNecklace()) + prev(picturebook_19YoungLeafNecklace()) +
              prev(picturebook_19BlueSkyNecklace()) + prev(picturebook_19DeepSeaNecklace()) +
              prev(picturebook_19NightSkyNecklace()) + prev(picturebook_19MapA()) + prev(picturebook_19MapB()) +
              prev(picturebook_19MapC()) + prev(picturebook_19MapD()) + prev(picturebook_20Radio()) +
              prev(picturebook_20Bottle()) + prev(picturebook_20BottledWater()) + prev(picturebook_20BottledMilk()) +
              prev(picturebook_20OilDrum()) + prev(picturebook_20FlatRock()) + prev(picturebook_20IndentedRock()) +
              prev(picturebook_20FireStarter()) + prev(picturebook_21FireStarterWBow()) +
              prev(picturebook_21BambooFishingRodA()) + prev(picturebook_21BambooFishingRodB()) +
              prev(picturebook_21WoodenFishingRodA()) + prev(picturebook_21WoodenFishingRodB()) +
              prev(picturebook_21WoodenBow()) + prev(picturebook_21BambooBow()) + prev(picturebook_21BambooArrowsA()) +
              prev(picturebook_22BambooArrowsB()) + prev(picturebook_22BambooArrowsC()) +
              prev(picturebook_22BambooArrowsD()) + prev(picturebook_22WoodenArrowsA()) +
              prev(picturebook_22WoodenArrowsB()) + prev(picturebook_22WoodenArrowsC()) +
              prev(picturebook_22WoodenArrowsD()) + prev(picturebook_22IronArrowsA()) +
              prev(picturebook_23IronArrowsB()) + prev(picturebook_23BambooSpearA()) +
              prev(picturebook_23BambooSpearB()) + prev(picturebook_23BambooSpearC()) +
              prev(picturebook_23WoodenSpearA()) + prev(picturebook_23WoodenSpearB()) +
              prev(picturebook_23WoodenSpearC()) + prev(picturebook_23IronSpear()) + prev(picturebook_24WoodenTorch()) +
              prev(picturebook_24BambooTorch()) + prev(picturebook_24RoundLureA()) + prev(picturebook_24RoundLureB()) +
              prev(picturebook_24RoundLureC()) + prev(picturebook_24ThinLureA()) + prev(picturebook_24ThinLureB()) +
              prev(picturebook_24ThinLureC()) + prev(picturebook_25LongLureA()) + prev(picturebook_25LongLureB()) +
              prev(picturebook_25LongLureC()) + prev(picturebook_25SpecialLure()) + prev(picturebook_25SmallTrap()) +
              prev(picturebook_25LargeTrap()) + prev(picturebook_25FishTrap()) + prev(picturebookEggSalad()) +
              prev(picturebook_26RadishSalad()) + prev(picturebook_26BurdockRootSalad()) +
              prev(picturebook_26SeaweedSalad()) + prev(picturebook_26MushroomSalad()) +
              prev(picturebook_26MackerelSashimi()) + prev(picturebook_26SeaBassSashimi()) +
              prev(picturebook_26SashimiPlatter()) + prev(picturebook_26FruitPlatter()) +
              prev(picturebook_27BakedPotato()) + prev(picturebook_27GrilledEel()) +
              prev(picturebook_27GrilledSweetfish()) + prev(picturebook_27GrilledClam()) +
              prev(picturebook_27GrilledChicken()) + prev(picturebook_27GrilledSalmon()) +
              prev(picturebook_27GrilledSeaBream()) + prev(picturebook_27GrilledMasuSalmon()) +
              prev(picturebook_28ButterGrilledTrout()) + prev(picturebook_28GrilledSeaBass()) +
              prev(picturebook_28MasuSalmonSkewer()) + prev(picturebook_28SauteedNibbler()) +
              prev(picturebook_28SauteedWolf()) + prev(picturebook_28TropicalFriedPork()) +
              prev(picturebook_28PanfriedFlatfish()) + prev(picturebook_28CrabOmelette()) +
              prev(picturebook_29MushroomOmelette()) + prev(picturebook_29ItalianOmelette()) +
              prev(picturebook_29ButterFriedClam()) + prev(picturebook_29MushroomSaute()) +
              prev(picturebook_29BurdockRoot()) + prev(picturebook_29EggsSunnysideUp()) +
              prev(picturebook_29RainbowTroutSaute()) + prev(picturebook_29PanfriedSeaBass()) +
              prev(picturebook_30BoiledPorkSalad()) + prev(picturebook_30ClamChowder()) +
              prev(picturebook_30MeatPotatoStew()) + prev(picturebook_30Potaufeu()) + prev(picturebook_30SardineSoup())
              + prev(picturebook_30OnionSoup()) + prev(picturebook_30PigeonSoup()) + prev(picturebook_30DuckHotPot()) +
              prev(picturebook_31BoiledEgg()) + prev(picturebook_31SalmonHotPot()) + prev(picturebook_31RaccoonHotPot())
              + prev(picturebook_31PorkMisoSoup()) + prev(picturebook_31DeerHotPot()) +
              prev(picturebook_31BoiledBambooShoot()) + prev(picturebook_31WolfHotPot()) +
              prev(picturebook_31CreamStew()) + prev(picturebook_32FriedSillaginoid()) +
              prev(picturebook_32OnionRings()) + prev(picturebook_32FrenchFries()) + prev(picturebook_32FriedOyster()) +
              prev(picturebook_32FriedMackerel()) + prev(picturebook_32DeepFriedChicken()) +
              prev(picturebook_32MixedTempura()) + prev(picturebook_32GobyTempura()) +
              prev(picturebook_33LotusRootChips()) + prev(picturebook_33PotatoSalad()) +
              prev(picturebook_33SteamedCrab()) + prev(picturebook_33SteamedTaro()) +
              prev(picturebook_33EggHotchpotch()) + prev(picturebook_33CustardPudding()) +
              prev(picturebook_33SteamedSeaUrchin())) == 254
)
