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
	
	
	public static var STATE = 0;
	public static var STATE_NORMAL = 0;
	public static var STATE_CUTSCENE = 1;

	public static var pName = "Bownly";
	public static var rivalName = "(((Rival Kid)))";

	public static var pLV = 1;
	public static var pMP = 60;
	public static var pXP = 0;
	public static var maxXP = 100;
	
	public static var encounterCounter = 0;
	
	public static var postDialogBattleFlag:Bool = false;
	public static var isMuted:Bool = false;


	public static var flags:Map<String, Int> =
	[
		"first_wakeup" => 0,
		"AorB" => 0,
		"a" => 0,
		"b" => 0
	];

	
	public static function resetEncounterCounter():Void
	{
		encounterCounter = FlxG.random.int(8, 12);
	}
	
	public static function muteToggle():Void
	{
		if (isMuted)
			isMuted = false;
		else
			isMuted = true;
	}
	
	public static function AddXP(Val:Int):Void
	{
		pXP += Val;
		if (pXP > maxXP)
			pXP = maxXP;
		
		if (pXP >= 100)
		{
			pLV = 5;
		}
		else if (pXP >= 55)
		{
			pLV = 4;
		}
		else if (pXP >= 25)
		{
			pLV = 3;
		}
		else if (pXP >= 10)
		{
			pLV = 2;
		}
		pMP = 30 + (pLV) * 30;
	}
}