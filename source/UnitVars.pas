{ UnitVars

  Copyright (c) 2007-2009 Dave Moore 

  Global Data

  The contents of this file are subject to the Mozilla Public License
  Version 1.1 (the "License"); you may not use this file except in
  compliance with the License. You may obtain a copy of the License at
  http://www.mozilla.org/MPL/
  
  Software distributed under the License is distributed on an "AS IS"
  basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
  License for the specific language governing rights and limitations
  under the License.

  The Original Code is all code apart where indicated.

  The Initial Developer of the Original Code is Dave Moore (starbog@gmail.com)

  Portions created by Dave Moore are Copyright (C) Dave Moore. All Rights Reserved.

  Contributor(s): 

}

unit UnitVars;

interface

uses Graphics, Contnrs, Types, Classes, UnitDefines;

var
  { Dungeon Definitions }
  GDungeonNameArray: Array [0..9] of String = ('The Nexus', 'The Abyss',
    'The Mausoleum', 'The Fortress of Ablach', 'Rancar''s Keep',
    'The Wilderlands', 'Plane of Earth', 'Plane of Air', 'Plane of Fire',
    'Plane of Water');

  GDungeonTypeArray: Array [0..9] of String = ('t_nexus.bmp', 't_abyss.bmp',
    't_mausoleum.bmp', 't_fortress.bmp', 't_keep.bmp', 't_wilderlands.bmp',
    't_planeearth.bmp', 't_air.bmp', 't_planefire.bmp', 't_planewater.bmp');

  GDungeonBalance: Array [0..9] of Integer = (0, 0, 30, 30, 30, 50, 50, 50, 50,
    50);

  GDungeonRoomSize: Array [0..9] of Integer = (0, 6, 8, 6, 6, 8, 8, 8, 8, 8);

  GDungeonCorridorLength: Array [0..9] of Integer = (0, 15, 15, 15, 15, 15, 15,
    15, 15, 15);
  GDungeonRecurseDepth: Array [0..9] of Integer = (0, 150, 150, 100, 100, 120,
    150, 150, 150, 150);

  GDungeonStairCount: Array [0..9] of Integer = (0, 1, 3, 3, 3, 1, 1, 3, 3, 4);
  
  GDungeonCrossCorridors: Array [0..9] of Boolean = (False, False, False,
    False, False, False, False, False, False, False);

  GDungeonCorridorDoorChance: Array [0..9] of Integer = (0, 0, 100, 40, 60, 0,
    0, 0, 0, 50);

  GDungeonEffectDescriptionArray: Array [0..9] of String = ('',
    'a pile of bones', 'a pile of bones', 'a scrapheap of rusted metal',
    'a pile of rusting metal', 'a verdant growth', 'a large boulder',
    'a large boulder', 'a large boulder', 'a large boulder');

  {GDungeonNameArray: Array [0..9] of String = ('The Nexus', 'The Abyss',
    'The Mausoleum', 'The Fortress of Ablach', 'Rancar''s Keep',
    'The Wilderlands', 'Plane of Earth', 'Plane of Air', 'Plane of Fire',
    'Plane of Water');}

  GDungeonBackgroundEffectDescriptionArray: Array [0..9] of String = ('',
    'pool of ichor', 'pile of ground-up bones', 'pool of shallow water',
    'pool of shallow water', 'patch of bare earth', 'patch of disturbed earth',
    'low-lying fog', 'magma pit', 'pool of water');

  GDungeonStairsDescriptionArray: Array [0..9] of String = ('',
    'a shadowy passageway', 'a bone staircase', 'an eroded stone staircase',
    'a wrought-iron ladder', 'a ladder of dense foliage', 'a glowing tunnel',
    'a glowing tunnel', 'a glowing tunnel', 'a glowing tunnel');

  GDungeonDarkerEffectDescriptionArray: Array [0..9] of String = ('',
    'a pile of skulls', 'a pile of skulls', 'a ruined contraption',
    'a pile of rubble', 'a corrupted growth', 'a large boulder',
    'a large boulder', 'a large boulder', 'a large boulder');

  GDungeonDarkerEffectColourArray: Array [0..9] of TColor = (clBlack,
    $002E09DF, $006E6E6E, $004080FF, $00FF8080, $00004080, $000000A6,
    $0080FFFF, $0017FFFF, $006C8703);

  GDungeonGroundEffectColourArray: Array [0..9] of TColor = (clBlack,
    $00B5B5B5, $00FF8080, $00FF2D2D, $00FF2D2D, $00004080, $000000A6,
    $00FCFCFC, $000080FF, $00DFDF00);

  { ASCII Character Definitions }
  GStandardASCII: Array [0..14] of Char = (#0, '#', '#', '.','.', '�', '+',
    '>', '<', '{', '.', #0, '#', #182, #182);

  GColouredASCII: Array [0..14] of Char = (#0, '#', '#', '.', '.','�', '+',
    '>' , '<', #247, #249, #0, #177, #182, #182);

  GStandardTownASCII: Array [0..24] of Char = (' ', '#', '.', '#', '#', '#',
    '#', '#', '#', '~', '>', '>', '>', '>', '>', '>', '>', '>', '>', '#', '*',
    '.', '+', '''', '~');

  GColouredTownASCII: Array [0..24] of Char = (' ', '#', '.', '#', '#', '#',
    '#', '#', '#', '~', '>', '>', '>', '>', '>', '>', '>', '>', '>', '#', '*',
    '.', '+', '''', '~');

  GDungeonEffectArray: Array [0..9] of Char = (' ', '~' , '~', '~', '~',
    '~', '~', '~', '~', '~');

  GDungeonGroundEffectArray: Array [0..9] of Char = (' ', '~' , '~', '~', '~',
    '~', '~', '~', '~', '~');

  {GDungeonNameArray: Array [0..9] of String = ('The Nexus', 'The Abyss',
    'The Mausoleum', 'The Fortress of Ablach', 'Rancar''s Keep',
    'The Wilderlands', 'Plane of Earth', 'Plane of Air', 'Plane of Fire',
    'Plane of Water');}

  GDungeonSpecialEffectArray: Array [0..9] of Char = (' ', '*', '*', '*',
    '*', 'p', '*', '*', '*', '*');

  { ASCII Character Colours }
  GASCIITownColours: Array [0..24] of TColor = (clBlack, $00006CD9, clSilver,
    $003C3CFF, $00C080FF, clGray, $0023ADF8, $00E8E8E8, clLime, $00D9CDCA,
    $00ACACAC, $0000CE00, $008000FF, $00048FB3, $00FF80BF, $000500CE,
    $0007529C, $00FF8000, $00FFF2CC, $000080FF, clPurple, clSilver, clWhite,
    clWhite, clGreen);

  GASCIIColours: Array [0..9, 0..14] of TColor = (
    ($0, $0, $0, $0, $0, $0, $0, $0, $0, $0, $0, $0, $0, $0, $0),
    ($0, $00FF0080, $008000FF, clFuchsia, clFuchsia, clSilver, clSilver,
     clLime, clAqua, clSilver, clSilver, clSilver, $008000FF, clBlue, clBlue),
    ($0, $00006CD9, $00ACACAC, $00EAEAEA, $00EAEAEA, clSilver, clSilver,
     clLime, clAqua, clSilver, clSilver, clSilver, $00ACACAC, clBlue, clBlue),
    ($0, $00036781, $00048FB3, $00048FB3, $00048FB3, clSilver, clSilver,
     clLime, clAqua, clSilver, clSilver, clSilver, $00048FB3, clBlue, clBlue),
    ($0, $00FF0080, $00FF80BF, $00FF80BF, $00FF80BF, clSilver, clSilver,
     clLime, clAqua, clSilver, clSilver, clSilver, $00FF80BF, clBlue, clBlue),
    ($0, $00009100, $0000CE00, $0000CE00, $0000CE00, clSilver, clSilver,
     clLime, clAqua, clSilver, clSilver, clSilver, $0000CE00, clBlue, clBlue),
    ($0, $00004080, $0007529C, $0077B8F9, $0077B8F9, clSilver, clSilver,
     clLime, clAqua, clSilver, clSilver, clSilver, $0007529C, clBlue, clBlue),
    ($0, $00868686, $00FFF2CC, $00FFFAEA, $00FFFAEA, clSilver, clSilver,
     clLime, clAqua, clSilver, clSilver, clSilver, $00FFF2CC, clBlue, clBlue),
    ($0, $0004009B, $000500CE, $006171FC, $006171FC, clSilver, clSilver,
     clLime, clAqua, clSilver, clSilver, clSilver, $000500CE, clBlue, clBlue),
    ($0, $00954A00, $00FF8000, clAqua, clAqua, clSilver, clSilver, clLime,
     clAqua, clSilver, clSilver, clSilver, $00FF8000, clBlue, clBlue));

  { Item Definitions }
  GNonMagicalItemDescriptorArray: Array [0..7] of String = ('Worn', 'Rusted',
    'Corroded', 'Stained', 'Bloodstained', 'Scarred', 'Gashed', 'Crumbling');

  GLowLevelMagicalItemDescriptorArray: Array [0..3] of String = ('Adorned',
    'Ornate', 'Polished', 'Fancy');

  GMediumLevelMagicalItemDescriptorArray: Array [0..3] of String = ('Jewelled',
    'Glowing', 'Runed', 'Shiny');

  GHighLevelMagicalItemDescriptorArray: Array [0..3] of String = ('Exquisite',
    'Gleaming', 'Radiant', 'Adorned');

  GWoodenItemDescriptorArray: Array [0..7] of String = ('Oaken','Beech',
    'Ashen', 'Cedar', 'Elm', 'Alder', 'Fir', 'Pine');

  GMetalItemDescriptorArray: Array [0..7] of String = ('Copper', 'Iron', 'Tin',
    'Zinc', 'Bronze', 'Steel', 'Mithril', 'Adamantine');

  GLeatherItemDescriptorArray: Array [0..1] of String = ('Hide', 'Leather');

  GClothItemDescriptorArray: Array [0..7] of String = ('Woolen', 'Silk',
    'Twill', 'Canvas', 'Felt', 'Fur', 'Cotton', 'Satin');

  GStoneItemDescriptorArray: Array [0..10] of String = ('Granite', 'Quartz',
    'Marble', 'Basalt', 'Topaz', 'Sandstone', 'Gold', 'Silver', 'Platinum',
    'Electrum', 'Crystal');

  GUnknownItemDescriptorArray: Array [0..2] of String = ('Mysterous',
    'Strange' ,'Obscure');

  GPotionItemDescriptorArray: Array [1..16] of String = ('Bubbling', 'Fizzing',
    'Clear', 'Opaque', 'Stagnant', 'Murky', 'Smelly', 'Viscous', 'Fuming',
    'Sedimented', 'Oily', 'Slimy', 'Inky', 'Pungent', 'Thick', 'Curdled');

  GPotionColourItemDescriptorArray: Array [1..16] of String = ('Red', 'Brown',
    'Black', 'Green', 'Blue', 'White', 'Yellow', 'Purple', 'Silvery', 'Orange',
    'Cyan', 'Pink', 'Lime', 'Maroon', 'Grey', 'Olive');

  GPotionColourArray: Array [1..16] of tColor = (clRed, $00004080, clGray,
    clGreen, clBlue, clWhite, clYellow, $00FF0080, clSilver, $000080FF, clAqua,
    $008080FF, $0000FF80, $00400080, clGray, clOlive);

  GItemTypeArray: Array [0..11] of crItemType = (iAny, iJunk, iMiscellaneous,
    iReageant, iArmour, iRing, iWand, iWeapon, iAmulet, iPotion, iSpellbook,
    iScroll);

  {Display Settings }
  MenuColors: Array[0..4] of TColor = (clYellow, $0003A5FC, $000080FF,
    $00043CFB, clRed);

  GGraphicModes: Array[0..2] of String = ('Graphical Tiles',
    'Monochrome ASCII', 'Coloured ASCII');

  GDungeonDisplayMode: Array [0..2, 0..1] of Integer = ((22, 20), (62, 25),
    (62, 24));

  { Monster Settings }
  {('The Nexus', 'The Abyss',
    'The Mausoleum', 'The Fortress', 'The Keep',
    'The Wilderlands', 'Plane of Earth', 'Plane of Air', 'Plane of Fire',
    'Plane of Water');}
  GMonsterPrefix: Array[0..9, 0..5] of String = (
    ('', '', '', '', '', ''),
    ('Laughing', 'Abyssal', 'Infernal', 'Sufferring', 'Scarred', 'Punishing'),
    ('Haunted', 'Suffering', 'Withering', 'Hideous', 'Rotten', 'Tormented'),
    ('Menacing', 'Dominant', 'Forceful', 'Mighty', 'Stalwart', 'Experienced'),
    ('Scarred', 'Beserker', 'Barbaric', 'Enraged', 'Furious', 'Fervent'),
    ('Wild', 'Beastly', 'Brutish', 'Bestial', 'Feral', 'Abominable'),
    ('Diabolical', 'Enormous', 'Fiendish', 'Ravenous', 'Thaumaturgic', 'Eerie'),
    ('Diabolical', 'Enormous', 'Fiendish', 'Ravenous', 'Thaumaturgic', 'Eerie'),
    ('Diabolical', 'Enormous', 'Fiendish', 'Ravenous', 'Thaumaturgic', 'Eerie'),
    ('Diabolical', 'Enormous', 'Fiendish', 'Ravenous', 'Thaumaturgic', 'Eerie')
    );
    
  GMonsterSuffix: Array[0..20] of String = ('Scarred', 'Forsaken', 'Avenger',
    'Invincible', 'Tainted', 'Wrathful', 'Brooding', 'Ferocious', 'Agonizer',
    'Bellicose', 'Devastator', 'Eviscerator', 'Immortal', 'Majestic',
    'Punisher', 'Relentless', 'Render', 'Stalker', 'Tormentor', 'Triumphant',
    'Tyrant');

  GUniqueCheers: Array [0..9] of String = ('will make short work of you',
    'wants your soul', 'will teach you a lesson', 'will make you pay',
    'demands your head', 'laughs at you', 'will send you to the afterlife',
    'is your doom', 'is looking for you',
    'will send you packing with your tail between your legs');

  GUniqueMourns: Array [0..6] of String = ('will be avenged',
    'will not be forgotten', 'will return',
    'will haunt you until your dying day',
    '''s sacrifice will not be in vain',
    'cannot be killed so easily', 'will rise again');

  SpeechType: Array[0..4] of String = ('says', 'cries out', 'wails', 'shouts',
    'mutters');

  { Feelings }
  GLevelFeelings: Array [0..4] of String = ('This is a very boring place...',
    'This place is quite uninteresting...', 'This place is mildly interesting...',
    'You feel good about this place...',
    'You tingle as you sense the power around you...');

  GFoodFeelings: Array [0..17] of String = ('ambrosial', 'delectable',
    'delicious', 'divine', 'exquisite', 'fit for a king', 'gratifying',
    'heavenly', 'mouthwatering', 'palatable', 'piquant', 'satisfying',
    'scrumptious', 'spicy', 'sweet', 'tasty', 'well-seasoned', 'yummy');

  GFoodFeelingsPrefix: Array [0..6] of String = ('most', 'definitely',
    'absolutely', 'certainly', 'quite', 'delicately', '');

  { Magic }
  GMagic: Array [0..15, 0..8] of String;
  GMagicDescription: Array [0..15, 0..8] of String;
  GMagicColour: Array [0..15] of TColor;
  GMagicCost: Array [0..15, 0..8] of Integer;
  GMagicProbability: Array [0..15, 0..8] of Integer;

  { OffSet Arrays Used in Dungeon Building }
  ddx_ddd: Array[0..8] of Integer = (0, 0, 1, -1, 1, -1, 1, -1, 0);
  ddy_ddd: Array[0..8] of Integer = (1, -1, 0, 0, 1, 1, -1, -1, 0);

  { Monster traversal arrays }
  NearbyMonsters: Array[1..3, 1..3] of Integer;

  { Skills }
  GSkillName: Array[0..40] of String = ('Fighting', 'Melee', 'Ranged',
    'Unarmed', 'Defense', 'Heavy Armour', 'Medium Armour', 'Light Armour', '',
    '', 'Subterfuge', 'Stealth', 'Thievery', '', '', '', '', '', '', '',
    'General Magic', 'Fire Magic', 'Air Magic', 'Water Magic', 'Earth Magic',
    'Nature Magic', 'Healing Magic', 'Cursing Magic', 'Combat Magic',
    'Protection Magic', 'Lore Magic', 'Necromancy Magic', 'Demonology Magic',
    'Mind Magic', 'Enchantment Magic', 'Travel Magic', '', '', '', '', '');

  { Friendly Class Names }
  ClassNames: Array[1..5, 1..5] of String = (
    ('Thug', 'Bandit', 'Criminal','Prowler', 'Malefactor'),
    ('Squire', 'Defender', 'Paladin', 'Champion', 'Hero'),
    ('Initiate', 'Apprentice', 'Scholar', 'Sage', 'Archmage'),
    ('Novice', 'Acolyte', 'Priest', 'Minister', 'Prelate'),
    ('Grunt', 'Fighter', 'Soldier', 'Commander', 'Warlord'));

  { NPC Types }
  NPCTypes: Array[0..12] of String = ('Guard', 'Shopkeeper', 'Wanderer',
    'Noble', 'Thug', 'Cultist', 'Beggar', 'Visitor', 'Trader', 'Priest',
    'Knight', 'your Housekeeper', 'your Pet Cat');

  { NPC Adjective }
  NPCAdjective: Array[0..10] of String = ('', 'Scared', 'Happy', 'Excited',
    'Bored', 'Drunk', 'Angry', 'Agressive', 'Cute', 'Flirtatious', 'Lovestruck');

  { NPC Speech }
  NPCSpeech: Array[1..12] of String = ('yelps', 'exclaims', 'proclams', 'yawns',
    'slurs', 'growls', 'rants', 'simpers', 'whispers', 'pants', 'says', 'purrs');

  NPCSays: Array[1..12, 1..3] of String = (
    ('Get away from me!', 'Eek!', 'Leave me alone'),
    ('Happy happy joy joy!', 'Woohoo!', 'I''m in a good mood!'),
    ('I''m about to burst!', 'Yessss!', 'Yay!'),
    ('meh', 'blarg', 'I''m so bored'),
    ('hic!', 'I''m...hic...very...hic...drunk', 'I need more drink!'),
    ('Grrrrrrr!', 'Roargh!', 'I''ll do you in!'),
    ('Get out of my way!', 'Why I oughta.....', 'Watch it, sunshine!'),
    ('iglywiglypoo', 'yummy...ice cream', 'wheeeeee!'),
    ('oooooh you''re a fine one', 'I like you', 'you excite me'),
    ('I love you!', 'Be with me!', 'Let''s run away together'),
    ('Your tea will be ready soon', 'I''ve tidied the place up', 'Goodday!'),
    ('meow!', 'meowmeow!', 'meowmeowmeow!'));

  UniqueAlertsTypes: Array[1..5] of String =
    ('A voice in the distance cries out "%s"', 'A distance voice roars "%s"',
    'A sibilant voice whispers in your ears "%s"', 'A voice screams "%s"',
    'A booming voice rises in the distance. It roars a challenge. "%s"');

  UniqueAlerts: Array [1..6] of String = ('Who dares disturb the domain of %s?',
    'This is the hold of %s. You will be destroyed!',
    'You have entered the territory of %s! Die!',
    'Inrruder! You will die at the hands of %s!',
    'Beware! These lands are controlled by %s!',
    'I, %s will kill you, Stranger!');
                                   
  { Item Lists }
  GDungeonBranchList: TObjectList;
  GEnchantmentList: TObjectList;
  GItemList: TObjectList;
  GVaultList: TObjectList;
  GWeaponList: TObjectList;
  GArmourList: TObjectList;
  GJewelleryList: TObjectList;
  GWandList: TObjectList;
  GPotionList: TObjectList;
  GScrollList: TObjectList;
  GFoodList: TObjectList;
  GMonsterList: TObjectList;
  GMonsterTypeList: TObjectList;
  ActiveMonsterList: TObjectList;
  GTownsPeopleList: TObjectList;

  { Off-Screen Drawing Buffer }
  ScreenBuffer: TBitmap;
  SquareBuffer: TBitmap;

  { Input Blocking Flags }
  InGame: Boolean;
  BlockKeyBoardInput: Boolean;

  { Multidrop List }
  ItemsToDrop: TStringList;

  { Inventory Status Flag }
  InventoryStatus: tInventoryStatus;
  
implementation


end.
