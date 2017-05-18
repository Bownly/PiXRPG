package;

import flixel.FlxG;
import flixel.FlxObject;

/**
 * ...
 * @author ...
 */
class WorldMap extends TownState
{
	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);

		if (Reg.flags["frogponddun"] == 0)
			encounterDecrementer = 0;
		else
			encounterDecrementer = 1;

		encounterLowerBound = 8;
		encounterUpperBound = 12;
	}
	
	override public function create():Void 
	{
		super.create();
		SoundManager.play("worldmap");
	}
	
	override function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}