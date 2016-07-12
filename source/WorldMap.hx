package;
import flixel.FlxG;
import flixel.FlxObject;

/**
 * ...
 * @author ...
 */
class WorldMap extends TownState
{

	var playerX:Float;
	var playerY:Float;
	
	public function new(PlayerX:Float, PlayerY:Float) 
	{
		super();
		playerX = PlayerX;
		playerY = PlayerY;
		levelName = "assets/levels/world_map.oel";
		tileName = "assets/images/tiles_worldmap.png";
		nonCollidableTiles = [0, 1, 2, 3, 4, 5, 6];
		encounterDecrementer = 1;
	}
	
	override public function create():Void 
	{
		super.create();
		// _player.setPosition(playerX, playerY + 16);
		// _player.setFacing(FlxObject.DOWN);

		add(encounterMap);
		songTownsong = FlxG.sound.load("assets/music/za_warudo_map.wav");
	}
	
	override function update():Void
	{
		super.update();
	}
}