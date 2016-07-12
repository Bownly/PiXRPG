package;

/**
 * ...
 * @author ...
 */
class Town2 extends TownState
{

	public function new() 
	{
		super();
		
		levelName = "assets/levels/town_2.oel";
		tileName = "assets/images/tiles_town.png";
		nonCollidableTiles = [0, 1, 2, 3, 4, 5, 6];
		worldMapPosX = 368;
		worldMapPosY = 336;	
	}
	
}