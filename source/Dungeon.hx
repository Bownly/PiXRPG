package;
import flixel.FlxG;

/**
 * ...
 * @author Bownly
 */
class Dungeon extends TownState
{

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		levelType = TownState.DUNGEON;
	}
	
	override public function create():Void 
	{
		super.create();
	}
}