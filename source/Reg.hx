package;

import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxSave;
import maps.*;
/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	/**
	 * Generic levels Array that can be used for cross-state stuff.
	 * Example usage: Storing the levels of a platformer.
	 */
	public static var levels:Array<Dynamic> = [];
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	public static var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	public static var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	public static var score:Int = 0;
	/**
	 * Generic bucket for storing different FlxSaves.
	 * Especially useful for setting up multiple save slots.
	 */
	public static var saves:Array<FlxSave> = [];
	
	public static inline var ICONSIZE:Int = 48;
	public static inline var SAVE_NAME:String = "Save file";

	public static var STATE:Int = 0;
	public static inline var STATE_NORMAL:Int     = 0;
	public static inline var STATE_CUTSCENE:Int   = 1;
	public static inline var STATE_TRANSITION:Int = 2;

	public static var COLORDEFAULT:Int  = 0xffffff;
	public static var COLORSELECTED:Int = 0xA5FF7F;
	public static var COLORBG:Int       = 0x000000;

	public static var pLV:Int = 1;
	public static var pMP:Int = 60;
	public static var pXP:Int = 0;
	public static var maxXP:Int = 100;
	
	public static var curLevelType:Int = 0;
	public static var curLevelExitID:Int = 0;

	public static var encounterCounter:Int = 0;

	public static var playTime:Float = 0;

	public static var flags:Map<String, Int> = [
		// misc flags
		"difficulty"        => 0,  // 0 = normal; 1 = hard
		"dummy"             => 0,
		"p_hood"            => 0,  // 0 = no hood; 1 = tadpole hood; 2 = frog hood
		"monshou_frog"      => 0,  // 0 = don't have; 1 = have
		"monshou_ice"       => 0,  // 0 = don't have; 1 = have
		"monshou_fire"      => 0,  // 0 = don't have; 1 = have
		"monshou_gondola"   => 0,  // 0 = don't have; 1 = have
		"save"              => 0,  
		"dialog_choices"    => 0,  // 0 = no option; # = option #

		// money flags
		"coins_frog"        => 0,
		"coins_frost"       => 0,
		"coins_fire"        => 0,
		"coins_chess"       => 0,
		"coins_gondola"     => 0,

		// story flags
		// prologue
		"no_encounters_yet" => 0,  // 0 = no encounters; 1 = encounters
		"tutorial_battle"   => 0,  // 0 = nothing; 1 = show tutorial text; 2 = already did
		"first_wakeup"      => 0,  // 0 = start game; 1 = went downstairs; 2 = talked to dad; 3 = joined up with rival
		"first_froggo"      => 0,  // 0 = hasn't met Froggo; 1 = has met him; 2 = rival walked off in dungeon (should be frogponddun but whatever)
		"frogponddun"       => 0,  // 0 = dun not done; 1 = dun done; 2 = talked to Froggo/concluded flag
		"fight_dummy"       => 0,  // -2 = secret fight no; -1 = fight no; 0 = neutral; 1 = fight yes; 2 = secret fight yes
		"dummy_prizes"      => 0,  // even = nothing; 1 = PiXcalibur; 3, 5 = Pond Scum; >=6 = done
		"owl_clan_attack"   => 0,  // 0 = pre-attack; 1 = post-attack; 2 = return home; 3 = return to The Pond; 4 = docks; 5 = done
		"end_prologue"      => 0,  // -1 = no; 0 = neutral; 1 = yes

		// chapter 1
		"ch1_progress"      => 0,  // 0 = nada; 1 = ch start; 2 = post shipwreck; 3 = waterkid in party;
		"waterkid_in_hut"   => 0,  // 0 = cutscene start; 1 = mid cutscene; 2 = joins party; 3 = let in by guard; 4 = confession; 5 = done
		"frostking_arc"     => 0,  // 0 = start; 1 = fight; 2 = post first meeting; 3 = meet guard in cave; 4 = done(?)
		"fireking_arc"      => 0,  // 0 = start; 1 = 


		// dungeon flags
		// frogponddun
		"frogpond_obs1"     => 0,
		"frogpond_obs2"     => 0,
		"frogpond_obs3"     => 0,
		"frogpond_obs4"     => 0,
		"frogpond_chest1"   => 0,
		"frogpond_chest2"   => 0,
		"frogpond_chest3"   => 0,
		"frogpond_chest4"   => 0,
		"frogpond_chest5"   => 0,
		"frogpond_door1"    => 0,
		"frogpond_door2"    => 0,
		"frogpond_door3"    => 0,
		"frogpond_door4"    => 0,
		"frogpond_door5"    => 0,
		"frogpond_door6"    => 0,
		"frogpond_door7"    => 0,
		"frogpond_door8"    => 0,
		"frogpond_door9"    => 0,
		"frogpond_door10"   => 0,
		"frogpond_mimic1"   => 0,
		"frogpond_mimic2"   => 0,
		"frogpond_mimic3"   => 0,
		"frogpond_mimic4"   => 0,
		"frogpond_mimic5"   => 0,
		"frogpond_mimic6"   => 0,
		"frogpond_mimic7"   => 0,
		"frogpond_mimic8"   => 0,

		// frost cave
		"froscav_chest0"    => 0,
		"froscav_chest1"    => 0,
		"froscav_boat0"     => 0,
		"froscav_boat1"     => 0,
		"froscav_boat2"     => 0,
		"froscav_boat3"     => 0,
		"froscav_boat4"     => 0,
		"froscav_boat5"     => 0,
		"froscav_boat6"     => 0,
		"froscav_boat7"     => 0,
		"froscav_boat8"     => 0,
		"froscav_boat9"     => 0,
		"froscav_boat10"    => 0,
		"froscav_boat11"    => 0,
		"froscav_boat12"    => 0,
		"froscav_boat13"    => 0,
		"froscav_boat14"    => 0,
		"froscav_boat15"    => 0,

		// volcano
		"volcano_chest0"    => 0,
		"volcano_obj0"      => 0,
		"volcano_obj1"      => 0,
		"volcano_obj2"      => 0,
		"volcano_obj3"      => 0,
		"volcano_obj4"      => 0,
		"volcano_obj5"      => 0,
		"volcano_obj6"      => 0,
		"volcano_obj7"      => 0,

		"volcano_chest1"    => 0,
		"volcano_chest2"    => 0,
		"volcano_chest3"    => 0,
	];

	public static var keys:Map<String, Array<FlxKey>> =  [
		"up"        => [flixel.input.keyboard.FlxKey.UP, flixel.input.keyboard.FlxKey.W],
		"down"      => [flixel.input.keyboard.FlxKey.DOWN, flixel.input.keyboard.FlxKey.S],
		"vert"      => [flixel.input.keyboard.FlxKey.UP, flixel.input.keyboard.FlxKey.W, flixel.input.keyboard.FlxKey.DOWN, flixel.input.keyboard.FlxKey.S],
		"left"      => [flixel.input.keyboard.FlxKey.LEFT, flixel.input.keyboard.FlxKey.A],
		"right"     => [flixel.input.keyboard.FlxKey.RIGHT, flixel.input.keyboard.FlxKey.D],
		"horz"      => [flixel.input.keyboard.FlxKey.LEFT, flixel.input.keyboard.FlxKey.A, flixel.input.keyboard.FlxKey.RIGHT, flixel.input.keyboard.FlxKey.D],
		"confirm"   => [flixel.input.keyboard.FlxKey.J, flixel.input.keyboard.FlxKey.Z, flixel.input.keyboard.FlxKey.SPACE],
		"cancel"    => [flixel.input.keyboard.FlxKey.K, flixel.input.keyboard.FlxKey.X],
		"conf/canc" => [flixel.input.keyboard.FlxKey.J, flixel.input.keyboard.FlxKey.Z, flixel.input.keyboard.FlxKey.K, flixel.input.keyboard.FlxKey.X, flixel.input.keyboard.FlxKey.SPACE],
		"menu"      => [flixel.input.keyboard.FlxKey.L, flixel.input.keyboard.FlxKey.C],
		"dpad"      => [flixel.input.keyboard.FlxKey.UP, flixel.input.keyboard.FlxKey.W, flixel.input.keyboard.FlxKey.DOWN, flixel.input.keyboard.FlxKey.S, flixel.input.keyboard.FlxKey.LEFT, flixel.input.keyboard.FlxKey.A, flixel.input.keyboard.FlxKey.RIGHT, flixel.input.keyboard.FlxKey.D],
		"any"       => [flixel.input.keyboard.FlxKey.J, flixel.input.keyboard.FlxKey.Z, flixel.input.keyboard.FlxKey.K, flixel.input.keyboard.FlxKey.X, flixel.input.keyboard.FlxKey.SPACE, flixel.input.keyboard.FlxKey.UP, flixel.input.keyboard.FlxKey.W, flixel.input.keyboard.FlxKey.DOWN, flixel.input.keyboard.FlxKey.S, flixel.input.keyboard.FlxKey.LEFT, flixel.input.keyboard.FlxKey.A, flixel.input.keyboard.FlxKey.RIGHT, flixel.input.keyboard.FlxKey.D]
	];

	public static var npcs:Map<String, Int> = [
		"froggo"            => 0,
		"dad"               => 1,
		"rival"             => 2,
		"owl"               => 3,

		"frogman"           => 4,
		"frogwoman"         => 5,
		"frogboy"           => 6,
		"froggirl"          => 7,
		"dummy"             => 8,
		"gondolagirl"       => 9,

		"door1"             => 10,
		"door2"             => 11,
		"chest1_closed"     => 12,
		"chest2_closed"     => 13,
		"chest1_opened"     => 14,
		"chest2_opened"     => 15,
		"sign1"             => 16,
		"sign2"             => 17,
		"boat"              => 18,
		"tempwall"          => 19,
		"pedestal1"         => 20,
		"pedestal2"         => 21,
		"seals1"            => 22,
		"seals2"            => 23,

		"waterkid"          => 24,
		"frostking"         => 25,
		"frostman"          => 26,
		"frostwoman"        => 27,
		"frostboy"          => 28,
		"frostgirl"         => 29,
		"frostguard"        => 30,
		"fireking"          => 31,
		"fireman"           => 32,
		"firewoman"         => 33,
		"fireboy"           => 34,
		"firegirl"          => 35,
		"fireguard"         => 36,
		"lavafall"          => 37,
		"raft"              => 38,
		"steam"             => 39,
	];

	public static function goToNextLevel(EntID:Int, MapName:String):Void
	{
		var index = MapName.indexOf("/");
		var cutName = MapName.substr(index+1);

		switch cutName {
			// prologue
			case "worldmap.tmx":            FlxG.switchState(new WorldMap(EntID, "worldmap.tmx"));
		    case "mchouse.tmx":             FlxG.switchState(new MCHouse(EntID, "mchouse.tmx"));
		    case "mchouse-1.tmx":           FlxG.switchState(new MCHouse1(EntID, "mchouse-1.tmx"));
		    case "frogpond.tmx":            FlxG.switchState(new FrogPond(EntID, "frogpond/frogpond.tmx"));
		    case "frogpond-house-1.tmx":    FlxG.switchState(new FrogPondHouse1(EntID, "frogpond/frogpond-house-1.tmx"));
		    case "frogpond-house-2.tmx":    FlxG.switchState(new FrogPondHouse2(EntID, "frogpond/frogpond-house-2.tmx"));
		    case "frogpond-house-3.tmx":    FlxG.switchState(new FrogPondHouse3(EntID, "frogpond/frogpond-house-3.tmx"));
		    case "frogpond-house-4.tmx":    FlxG.switchState(new FrogPondHouse4(EntID, "frogpond/frogpond-house-4.tmx"));
		    case "frogpond-docks.tmx":      FlxG.switchState(new FrogPondDocks(EntID, "frogpond/frogpond-docks.tmx"));
		    case "frogpond-dungeon.tmx":    FlxG.switchState(new FrogPondDun(EntID, "frogpond/frogpond-dungeon.tmx"));
		    case "frogpond-dungeon-1.tmx":  FlxG.switchState(new FrogPondDun1(EntID, "frogpond/frogpond-dungeon-1.tmx"));
		    case "frogpond-dungeon-2.tmx":  FlxG.switchState(new FrogPondDun2(EntID, "frogpond/frogpond-dungeon-2.tmx"));

		    // ch 1
		    case "waterkidhut.tmx":          FlxG.switchState(new WaterKidHut(EntID, "frostfire/waterkidhut.tmx"));
		    case "frostkingd.tmx":           FlxG.switchState(new FrostKingd(EntID, "frostfire/frostkingd.tmx"));
		    case "frostkingd-house-1.tmx":   FlxG.switchState(new TownState(EntID, "frostfire/frostkingd-house-1.tmx"));
		    case "frostkingd-house-2.tmx":   FlxG.switchState(new TownState(EntID, "frostfire/frostkingd-house-2.tmx"));
		    case "frostkingd-house-3.tmx":   FlxG.switchState(new TownState(EntID, "frostfire/frostkingd-house-3.tmx"));
		    case "frostkingd-house-4.tmx":   FlxG.switchState(new TownState(EntID, "frostfire/frostkingd-house-4.tmx"));
		    case "frost-castle.tmx":         FlxG.switchState(new FrosCas(EntID, "frostfire/frost-castle.tmx"));
		    case "frost-castle-bedroom.tmx": FlxG.switchState(new FrosCasBed(EntID, "frostfire/frost-castle-bedroom.tmx"));
		    case "frost-castle-library.tmx": FlxG.switchState(new FrosCasLib(EntID, "frostfire/frost-castle-library.tmx"));
		    case "frost-castle-hall.tmx":    FlxG.switchState(new FrosCasHall(EntID, "frostfire/frost-castle-hall.tmx"));
		    case "frost-castle-throne.tmx":  FlxG.switchState(new FrosCasThrone(EntID, "frostfire/frost-castle-throne.tmx"));
		    case "frost-checkpoint.tmx":     FlxG.switchState(new FrostCheckpoint(EntID, "frostfire/frost-checkpoint.tmx"));
		    case "frostcave-0.tmx":          FlxG.switchState(new FrostCave0(EntID, "frostfire/frostcave-0.tmx"));
		    case "frostcave-1.tmx":          FlxG.switchState(new FrostCave1(EntID, "frostfire/frostcave-1.tmx"));
		    case "frostcave-2.tmx":          FlxG.switchState(new FrostCave2(EntID, "frostfire/frostcave-2.tmx"));
		    case "frostcave-3.tmx":          FlxG.switchState(new FrostCave3(EntID, "frostfire/frostcave-3.tmx"));
		    case "firekingd.tmx":            FlxG.switchState(new FireKingd(EntID, "frostfire/firekingd.tmx"));
		    case "firekingd-house-1.tmx":    FlxG.switchState(new TownState(EntID, "frostfire/firekingd-house-1.tmx"));
		    case "firekingd-house-2.tmx":    FlxG.switchState(new TownState(EntID, "frostfire/firekingd-house-2.tmx"));
		    case "firekingd-house-3.tmx":    FlxG.switchState(new TownState(EntID, "frostfire/firekingd-house-3.tmx"));
		    case "firekingd-house-4.tmx":    FlxG.switchState(new TownState(EntID, "frostfire/firekingd-house-4.tmx"));
		    case "volcano-0.tmx":            FlxG.switchState(new Volcano(EntID, "frostfire/volcano-0.tmx"));
		    case "volcano-1.tmx":            FlxG.switchState(new Volcano1(EntID, "frostfire/volcano-1.tmx"));
		    case "volcano-2.tmx":            FlxG.switchState(new Volcano2(EntID, "frostfire/volcano-2.tmx"));
		    case "volcano-3.tmx":            FlxG.switchState(new Volcano3(EntID, "frostfire/volcano-3.tmx"));
		    case "volcano-4.tmx":            FlxG.switchState(new Volcano4(EntID, "frostfire/volcano-4.tmx"));
		    case "volcano-5.tmx":            FlxG.switchState(new Volcano5(EntID, "frostfire/volcano-5.tmx"));

		    // ch 2
		    case "well-2.tmx":   FlxG.switchState(new Well2(EntID, "frogkingdom/well-2.tmx"));

		    default: FlxG.switchState(new TownState(EntID, MapName));
		}
	}

	public static function loadGame()
	{
		var save:FlxSave = new FlxSave();
		save.bind(SAVE_NAME);

		// load mc stats
		Strings.stringVars = save.data.names;
		Player.mp = save.data.mp;
		Player.maxmp = save.data.maxmp;
		Player.xp = save.data.xp;
		Player.lp = save.data.lp;

		// load pens
		PenClasses.PenManager.arrPens = save.data.pens;
		PenClasses.PenManager.equip(save.data.ePen);
	
		// load playtime
		playTime = save.data.playTime;
	
		// load inventory
		ItemClasses.InventoryManager.arr = save.data.inventory;

		// load flags
		Reg.flags = save.data.flags;

		// level vars
		curLevelType = save.data.curLevelType;
		curLevelExitID = save.data.curLevelExitID;

		// load location (map + entrance)
		goToNextLevel(save.data.entrance, save.data.mapName);
	}

	public static function newGame():Void
	{
		// set mc stats
		Player.resetStats();

		// set pens
		PenClasses.PenManager.resetPens();
	
		// set playtime
		playTime = 0;
	
		// set inventory
		ItemClasses.InventoryManager.removeAllItems();

		// set name strings
		// Strings.stringVars = new Map<String, String> [
		// 	"%title%"        => "Frogicross",
		// 	"%pname%"        => "Player",
		// 	"%jason%"        => "Jason",       // The name Bill Toads refers to you by
		// 	"%pnameDefault%" => "Tad",
		// 	"%rnameDefault%" => "Seth",
		// 	"%rivalname%"    => "Brother",
		// 	"%item%"         => ":O",
		// 	"%level%"        => "2",
		// 	"%xp%"           => "10",
		// 	"%number%"       => "0",
		// ];

		// set flags
		for (key in flags.keys())
			flags[key] = 0;

		// set level vars
		curLevelType = 0;
		curLevelExitID = 0;

		// start the game
		FlxG.switchState(new DifficultySelectionState());
	}	

	public static function saveGame(EntID:Int, MapName:String):Void 
	{
		var save:FlxSave = new FlxSave();
		// Delete all existing data
		save.bind(SAVE_NAME);
		save.erase();
		save.bind(SAVE_NAME);

		// save mc stats
		save.data.names = Strings.stringVars;
		save.data.mp = Player.mp;
		save.data.maxmp = Player.maxmp;
		save.data.xp = Player.xp;
		save.data.lp = Player.lp;

		// save pens
		save.data.pens = PenClasses.PenManager.arrPens;
		save.data.ePen = PenClasses.PenManager.equipped;

		// save playtime
		save.data.playTime = playTime;
	
		// save inventory
		save.data.inventory = ItemClasses.InventoryManager.arr;

		// save flags
		save.data.flags = Reg.flags;

		// set level vars
		save.data.curLevelType = curLevelType;
		save.data.curLevelExitID = curLevelExitID;

		// save location (map + entrance)
		save.data.mapName = MapName;
		save.data.entrance = EntID;
	
		save.flush();
	}

	public static function resetEncounterCounter(lower:Int, upper:Int):Void
	{
		encounterCounter = FlxG.random.int(lower, upper);
	}
	

}