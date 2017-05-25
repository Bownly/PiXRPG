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
	public static inline var STATE_NORMAL:Int = 0;
	public static inline var STATE_CUTSCENE:Int = 1;

	public static var pLV:Int = 1;
	public static var pMP:Int = 60;
	public static var pXP:Int = 0;
	public static var maxXP:Int = 100;
	
	public static var encounterCounter:Int = 0;

	public static var playTime:Int = 0;
	

	public static var flags:Map<String, Int> =
	[
		"difficulty"        => 0,  // 0 = normal; 1 = hard
		"dummy"             => 0,
		"p_hood"            => 0,
		"monshou_frog"      => 0,  // 0 = don't have; 1 = have
		"monshou_ice"       => 0,  // 0 = don't have; 1 = have
		"monshou_fire"      => 0,  // 0 = don't have; 1 = have
		"monshou_gondola"   => 0,  // 0 = don't have; 1 = have
		"save"              => 0,
		"no_encounters_yet" => 0,
		"tutorial_battle"   => 0, 
		"first_wakeup"      => 0,  // 0 = start game; 1 = went downstairs; 2 = talked to dad
		"first_froggo"      => 0,  // 0 = hasn't met Froggo; 1 = has met him
		"frogponddun"       => 0,  // 0 = dun not done; 1 = dun done; 2 = talked to Froggo/concluded flag
		"fight_dummy"       => 0,  // -2 = secret fight no; -1 = fight no; 0 = neutral; 1 = fight yes; 2 = secret fight yes
		"dummy_prizes"      => 0,  // even = nothing; 1 = PiXcalibur; 3, 5 = Pond Scum; >=6 = done
		"owl_clan_attack"   => 0,  // 0 = pre-attack; 1 = post-attack; 2 = return home; 3 = return to The Pond; 4 = docks; 5 = done
		"end_prologue"      => 0,  // -1 = no; 0 = neutral; 1 = yes
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
	];

	public static var keys:Map<String, Array<FlxKey>> = 
	[
		"up"        => [flixel.input.keyboard.FlxKey.UP, flixel.input.keyboard.FlxKey.W],
		"down"      => [flixel.input.keyboard.FlxKey.DOWN, flixel.input.keyboard.FlxKey.S],
		"vert"      => [flixel.input.keyboard.FlxKey.UP, flixel.input.keyboard.FlxKey.W, flixel.input.keyboard.FlxKey.DOWN, flixel.input.keyboard.FlxKey.S],
		"left"      => [flixel.input.keyboard.FlxKey.LEFT, flixel.input.keyboard.FlxKey.A],
		"right"     => [flixel.input.keyboard.FlxKey.RIGHT, flixel.input.keyboard.FlxKey.D],
		"horz"      => [flixel.input.keyboard.FlxKey.LEFT, flixel.input.keyboard.FlxKey.A, flixel.input.keyboard.FlxKey.RIGHT, flixel.input.keyboard.FlxKey.D],
		"confirm"   => [flixel.input.keyboard.FlxKey.J, flixel.input.keyboard.FlxKey.Z],
		"cancel"    => [flixel.input.keyboard.FlxKey.K, flixel.input.keyboard.FlxKey.X],
		"conf/canc" => [flixel.input.keyboard.FlxKey.J, flixel.input.keyboard.FlxKey.Z, flixel.input.keyboard.FlxKey.K, flixel.input.keyboard.FlxKey.X],
		"menu"      => [flixel.input.keyboard.FlxKey.L, flixel.input.keyboard.FlxKey.C],
		"dpad"      => [flixel.input.keyboard.FlxKey.UP, flixel.input.keyboard.FlxKey.W, flixel.input.keyboard.FlxKey.DOWN, flixel.input.keyboard.FlxKey.S, flixel.input.keyboard.FlxKey.LEFT, flixel.input.keyboard.FlxKey.A, flixel.input.keyboard.FlxKey.RIGHT, flixel.input.keyboard.FlxKey.D]
	];

	public static function goToNextLevel(EntID:Int, MapName:String):Void
	{
		switch MapName {
			case "worldmap.tmx": FlxG.switchState(new WorldMap(EntID, "worldmap.tmx"));
		    case "mchouse.tmx": FlxG.switchState(new MCHouse(EntID, "mchouse.tmx"));
		    case "mchouse-1.tmx": FlxG.switchState(new MCHouse1(EntID, "mchouse-1.tmx"));
		    case "frogpond.tmx": FlxG.switchState(new FrogPond(EntID, "frogpond.tmx"));
		    case "frogpond-house-1.tmx": FlxG.switchState(new FrogPondHouse1(EntID, "frogpond-house-1.tmx"));
		    case "frogpond-house-2.tmx": FlxG.switchState(new FrogPondHouse2(EntID, "frogpond-house-2.tmx"));
		    case "frogpond-house-3.tmx": FlxG.switchState(new FrogPondHouse3(EntID, "frogpond-house-3.tmx"));
		    case "frogpond-house-4.tmx": FlxG.switchState(new FrogPondHouse4(EntID, "frogpond-house-4.tmx"));
		    case "frogpond-docks.tmx": FlxG.switchState(new FrogPondDocks(EntID, "frogpond-docks.tmx"));
		    case "frogpond-dungeon.tmx": FlxG.switchState(new FrogPondDun(EntID, "frogpond-dungeon.tmx"));
		    case "frogpond-dungeon-1.tmx": FlxG.switchState(new FrogPondDun1(EntID, "frogpond-dungeon-1.tmx"));
		    case "frogpond-dungeon-2.tmx": FlxG.switchState(new FrogPondDun2(EntID, "frogpond-dungeon-2.tmx"));
		    case "town1.tmx": FlxG.switchState(new TownState(EntID, "town1.tmx"));
		    case "town2.tmx": FlxG.switchState(new Town2(EntID, "town2.tmx"));
		    case "town3.tmx": FlxG.switchState(new TownState(EntID, "town3.tmx"));
		    case "town4.tmx": FlxG.switchState(new TownState(EntID, "town4.tmx"));
		    case "town5.tmx": FlxG.switchState(new TownState(EntID, "town5.tmx"));
		    case "town6.tmx": FlxG.switchState(new TownState(EntID, "town6.tmx"));
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
		PenClasses.PenManager.equipped = save.data.ePen;
	
		// load playtime
		playTime = save.data.playTime;
	
		// load inventory
		ItemClasses.InventoryManager.arr = save.data.inventory;

		// load flags
		Reg.flags = save.data.flags;

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

		// set flags
		for (flag in flags.keys())
			flags[flag] = 0;

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