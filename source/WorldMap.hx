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
		_song = "worldmap";

		if (Reg.flags["frogponddun"] == 0)
			encounterDecrementer = 0;
		else
			encounterDecrementer = 1;

		encounterLowerBound = 15;
		encounterUpperBound = 25;
	}
	
	override public function create():Void 
	{
		super.create();
	}
	
	override function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}