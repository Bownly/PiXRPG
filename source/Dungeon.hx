package;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Dungeon extends TownState
{

	public function new() 
	{
		super();
		
		levelName = "assets/levels/dungeon.oel";
		tileName = "assets/images/tiles_dungeon.png";
		nonCollidableTiles = [0, 1, 2, 3, 4, 5, 6];
		worldMapPosX = 32;
		worldMapPosY = 384;	
	}
	
	override public function create():Void 
	{
		super.create();
		songTownsong = FlxG.sound.load("assets/music/quiet.wav");
	}
}