package;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class TownStateog extends FlxState
{
	var exitX:Float = 0;
	var exitY:Float = 0;
	var town1X:Float = 0;
	var town1Y:Float = 0;
	var town2X:Float = 0;
	var town2Y:Float = 0;
	var town3X:Float = 0;
	var town3Y:Float = 0;
	var town4X:Float = 0;
	var town4Y:Float = 0;
	var dungeonX:Float = 0;
	var dungeonY:Float = 0;
	
	public var encounterDecrementer:Int = 0;
	
	var worldMapPosX:Float = 0;
	var worldMapPosY:Float = 0;
	
	public var _coords:FlxText;
	public var player:Player;
	public var grpNPCs:FlxTypedGroup<NPC>;
	
	var sub:BattleSubState;
	
	var _ogmoLoader:FlxOgmoLoader;
	public var _tileMap:FlxTilemap;
	var levelName:String = "assets/levels/town_1.oel";
	var tileName:String = "assets/images/tiles_town.png";
	var nonCollidableTiles:Array<Int> = [0, 1, 2, 3, 4, 5, 6];
	
	public var songTownsong:FlxSound;

	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		songTownsong = FlxG.sound.load("assets/music/townsong.wav");
		
		Reg.resetEncounterCounter();
		
		FlxG.camera.bgColor = 0xffffffff;
		
		_coords = new FlxText(16, 16, 300, "Picross RPG", 8);
		
		grpNPCs = new FlxTypedGroup<NPC>();
		
		player = new Player(240, 240, FlxObject.UP, this);
		
		// room stuff
		_ogmoLoader = new FlxOgmoLoader(levelName);
		_tileMap = _ogmoLoader.loadTilemap(tileName, 16, 16, "walls");
		
		for (tile in nonCollidableTiles)  // tile collision settings
		{
			_tileMap.setTileProperties(tile, FlxObject.NONE); // misc walkthroughable tiles
		}
		_ogmoLoader.loadEntities(placeEntities, "entities");
		
		
		add(_tileMap);
		//add(_coords);
		add(player);
		add(grpNPCs);
		
		FlxG.camera.follow(player, FlxCamera.STYLE_NO_DEAD_ZONE);
		
		FlxG.mouse.visible = false;		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		if (subState == null && !Reg.isMuted)
			songTownsong.play(false);
		else
			songTownsong.pause();
		
		_coords.text = ("X: " + player.x + ", Y: " + player.y + ", Dir: " + player.facing);
		
		if (player.x == exitX && player.y == exitY)
		{
			FlxG.switchState(new WorldMap(worldMapPosX, worldMapPosY));
		}
		else if (player.x == town1X && player.y == town1Y)
		{
			FlxG.switchState(new Town1());
		}
		else if (player.x == town2X && player.y == town2Y)
		{
			FlxG.switchState(new Town2());
		}
		else if (player.x == town3X && player.y == town3Y)
		{
			FlxG.switchState(new Town3());
		}
		else if (player.x == town4X && player.y == town4Y)
		{
			FlxG.switchState(new Town4());
		}
		else if (player.x == dungeonX && player.y == dungeonY)
		{
			FlxG.switchState(new Dungeon());
		}
		
		// start battle!!!!
		if (player.isMoving == false && Reg.encounterCounter <= 0)
		{
			var xx:Int = 0;
			var yy:Int = 0;
			
			switch (player.facing)
			{
				case FlxObject.UP:
					yy = -16;
				case FlxObject.DOWN:
					yy = 16;
				case FlxObject.LEFT:
					xx = -16;
				case FlxObject.RIGHT:
					xx = 16;
			}
			var map = _tileMap;
			// var val:Int = map.getTile(Math.floor((player.x + xx) / 16 ), Math.floor((player.y + yy) / 16));
			var val:Int = map.getTile(Math.floor((player.x) / 16 ), Math.floor((player.y) / 16));
			if (val > 4)
				val = 1;
				
			songTownsong.pause();
			sub = new BattleSubState(val - 1);
			this.openSubState(sub);
		}
		if (FlxG.keys.anyJustPressed(["M"]))
			Reg.muteToggle();
		super.update();
	}	

	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Float = Std.parseFloat(entityData.get("x"));
		var y:Float = Std.parseFloat(entityData.get("y"));
		
		if (entityName == "player")
		{
			player.x = x;
			player.y = y;
		}
		else if (entityName == "npc")
		{
			if (entityData.get("species") != "6")
				grpNPCs.add(new NPC(x, y, Std.parseInt(entityData.get("facing")), Std.parseInt(entityData.get("species")),
					Std.parseInt(entityData.get("lineNum")), Std.parseInt(entityData.get("lineCount")), this));
			else
				grpNPCs.add(new EndBoss(x, y, Std.parseInt(entityData.get("facing")), Std.parseInt(entityData.get("species")),
					Std.parseInt(entityData.get("lineNum")), Std.parseInt(entityData.get("lineCount")), this));
			
			
		}
		else if (entityName == "exit")
		{
			exitX = x;
			exitY = y;
		}
		else if (entityName == "town1")
		{
			town1X = x;
			town1Y = y;
		}
		else if (entityName == "town2")
		{
			town2X = x;
			town2Y = y;
		}
		else if (entityName == "town3")
		{
			town3X = x;
			town3Y = y;
		}
		else if (entityName == "town4")
		{
			town4X = x;
			town4Y = y;
		}
		else if (entityName == "dungeon")
		{
			dungeonX = x;
			dungeonY = y;
		}
	}

}