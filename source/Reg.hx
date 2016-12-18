package;

import flixel.FlxG;
import flixel.util.FlxSave;

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
	
	
	public static var STATE:Int = 0;
	public static var STATE_NORMAL:Int = 0;
	public static var STATE_CUTSCENE:Int = 1;

	public static var pName:String = "Main character";
	public static var rivalName:String = "Rival Kid";
	public static var curItem:String = ";)";

	public static var pLV:Int = 1;
	public static var pMP:Int = 60;
	public static var pXP:Int = 0;
	public static var maxXP:Int = 100;
	public static var playerHasHood:Bool = false;
	
	public static var encounterCounter:Int = 0;

	public static var playTime:Int = 0;
	
	public static var postDialogBattleFlag:Bool = false;
	public static var isMuted:Bool = false;

	public static var SAVE_NAME:String = "Save file";

	public static var flags:Map<String, Int> =
	[
		"tutorial_battle" => 0,
		"first_wakeup" => 0,
		"AorB" => 0,
		"a" => 0,
		"b" => 0,
		"fight_dummy" => 0,
		"frogpond_chest1" => 0,
		"frogpond_chest2" => 0,
		"frogpond_chest3" => 0,
		"frogpond_door1" => 0,
		"frogpond_door2" => 0,
		"frogpond_door3" => 0,
	];

	public static function goToNextLevel(EntID:Int, MapName:String):Void
	{
		switch MapName {
		    case "frogpond.tmx": FlxG.switchState(new FrogPond(EntID, "frogpond.tmx"));
		    case "frogpond-1.tmx": FlxG.switchState(new FrogPond1(EntID, "frogpond-1.tmx"));
		    case "frogpond-dungeon.tmx": FlxG.switchState(new FrogPondDun(EntID, "frogpond-dungeon.tmx"));
		    case "town1.tmx": FlxG.switchState(new FrogPond(EntID, "town1.tmx"));
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
		Player.mp = save.data.mp;
		Player.maxmp = save.data.maxmp;
		Player.xp = save.data.xp;
		Player.lvl = save.data.lvl;

		Reg.playTime = save.data.playTime;
		ItemClasses.InventoryManager.arr = save.data.inventory;
		Reg.flags = save.data.flags;

		// set location (map + entrance) and load the game
		goToNextLevel(save.data.entrance, save.data.mapName);
	}

	public static function newGame():Void
	{
		// set flags
		for (flag in flags.keys())
			flags[flag] = 0;

		// set inv
		ItemClasses.InventoryManager.removeAllItems();

		// set mc stats
		playerHasHood = false;

		// set playtime
		playTime = 0;

		// set misc
		curItem = "";

		// set location (map + entrance) and start the game
		FlxG.switchState(new FrogPond1(1, "frogpond-1.tmx"));
	}	

	public static function muteToggle():Void
	{
		if (isMuted)
			isMuted = false;
		else
			isMuted = true;
	}

	public static function saveGame(EntID:Int, MapName:String):Void {
		var save:FlxSave = new FlxSave();
		// Delete all existing data
		save.bind(SAVE_NAME);
		save.erase();

		// Write new data
		// set inv

		// set mc stats
		save.bind(SAVE_NAME);
		save.data.mp = Player.mp;
		save.data.maxmp = Player.maxmp;
		save.data.xp = Player.xp;
		save.data.lvl = Player.lvl;

		// set location (map + entrance)
		save.data.mapName = MapName;
		save.data.entrance = EntID;
	
		// set playtime
		save.data.playTime = 6;
	
		// set inventory
		save.data.inventory = ItemClasses.InventoryManager.arr;

		// set flags
		save.data.flags = Reg.flags;

		save.flush();

	}



	public static function resetEncounterCounter():Void
	{

		encounterCounter = FlxG.random.int(8, 12);

	}
	

}