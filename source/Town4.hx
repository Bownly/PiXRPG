package;

/**
 * ...
 * @author ...
 */
class Town4 extends TownState
{

	public function new() 
	{
		super();
		
		levelName = "assets/levels/town_4.oel";
		tileName = "assets/images/tiles_dungeon.png";
		nonCollidableTiles = [0, 1, 2, 3, 4, 5, 6];
		worldMapPosX = 64;
		worldMapPosY = 144;	
	}
	
}