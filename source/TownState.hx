package;

import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tile.FlxBaseTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

import haxe.io.Path;



/**
 * A FlxState which can be used for the game's menu.
 */
class TownState extends FlxState
{
	public var encounterDecrementer:Int = 0;

	public var eventManager:EventClasses.EventManager;
	
	public var player:Player;
	public var grpNPCs:FlxTypedGroup<NPC> = new FlxTypedGroup<NPC>();
	public var grpExits:FlxTypedGroup<Exit>;
	
	public var width:Int;
	public var height:Int;
	public var tileMap:FlxTilemap;
	
	var sub:BattleSubState;
	
	public var songTownsong:FlxSound;

	
	// tiled stuff
	public var level:TiledLevel;
	public var entranceID:Int = 0;
	public var mapName:String;
	public var edgeExitNextEntID:Int;
	public var edgeExitNextMapName:String;
	public var encounterMap:TiledTileLayer;


	override public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool)
	{

		entranceID = EntranceID;
		mapName = MapName;
		super();
	}


	override public function create():Void
	{

		eventManager = new EventClasses.EventManager(this);

		if (mapName == "worldmap.tmx")
			encounterDecrementer = 1;

		songTownsong = FlxG.sound.load("assets/music/townsong.wav");
		
		Reg.resetEncounterCounter();
		
		FlxG.camera.bgColor = 0xffffffff;
				
		grpExits = new FlxTypedGroup<Exit>();
		
		player = new Player(240, 240, FlxObject.DOWN, this);
		
		FlxG.camera.follow(player);
		
		FlxG.mouse.visible = false;		
		super.create();

		bgColor = 0xffffffff;  // hwite
		bgColor = 0x00000000;  // black

		level = new TiledLevel("assets/levels/" + mapName, this);
		
		// Add backgrounds
		add(level.backgroundLayer);
		// for (lvl in level.backgroundLayer)
		// {

		// 	if (lvl.width < FlxG.width)
		// 	{
		// 		trace("tiny");
		// 		trace("lvl.x pre: ", lvl.x);
		// 		lvl.x -= 16;
		// 		trace("lvl.x post: ", lvl.x);
		// 		trace("lvl.width:  ", lvl.width);
		// 	}
		// }
		
		// Load player objects
		add(level.objectsLayer);

		// if (encounterMap != null)
		// {
		// 	trace("tilemap", encounterMap);
		// 	trace("tile encounter map thing", encounterMap.tileArray);
		// }

		// Add foreground tiles after adding level objects, so these tiles render on top of player
		add(level.foregroundTiles);
		add(grpExits);
		add(player);
		add(grpNPCs);

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
	override public function update(elapsed:Float):Void
	{
		eventManager.update();

		if (subState == null && !Reg.isMuted)
			songTownsong.play(false);
		else
			songTownsong.pause();
						

		if (player.x == width || player.x == 0
			|| player.y == height || player.y == 0)
		{
			goToNextLevel(edgeExitNextEntID, edgeExitNextMapName);
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
			var map = tileMap;
			// var val:Int = map.getTile(Math.floor((player.x + xx) / 16 ), Math.floor((player.y + yy) / 16));
			// var val:Int = map.getTile(Math.floor((player.x) / 16 ), Math.floor((player.y) / 16));

			var val:Int = encounterMap.tileArray[Std.int(player.y/16 * (width+16)/16 + player.x/16)];

			if (val > 4)
				val = 1;
			
			songTownsong.pause();
			sub = new BattleSubState([val - 1]);
			this.openSubState(sub);
		}

		if (FlxG.keys.anyJustPressed(["K", "ENTER"]))
		{
			// var menu = new MenuClasses.MenuPause([0, 0], [100, 100], 1, this);
			var sub = new MenuSubState(FlxG.width/2, FlxG.height/2, this);
			this.openSubState(sub);
		}
		else if (FlxG.keys.anyJustPressed(["M"]))
			Reg.muteToggle();
		else if (FlxG.keys.anyJustPressed(["L"]))
		{
			ItemClasses.InventoryManager._arr.push(new ItemClasses.ItemHealing("a potion", "heal 1 MP", 9, 1));
			ItemClasses.InventoryManager._arr.push(new ItemClasses.ItemHealing("b potion", "heal 2 MP", 9, 2));
			ItemClasses.InventoryManager._arr.push(new ItemClasses.ItemHealing("c potion", "heal 3 MP", 9, 3));
			ItemClasses.InventoryManager._arr.push(new ItemClasses.ItemHealing("d potion", "heal 4 MP", 9, 4));
			ItemClasses.InventoryManager._arr.push(new ItemClasses.ItemHealing("e potion", "heal 5 MP", 9, 5));
			ItemClasses.InventoryManager._arr.push(new ItemClasses.ItemHealing("f potion", "heal 6 MP", 9, 6));
		}
		for (exit in grpExits)
		{
			if (exit.y == player.y && exit.x == player.x)
			{
				if (exit.isActive)
					goToNextLevel(exit.nextLvlEntID, exit.nextLvl);
			}			
		}



		super.update(elapsed);
	}	


	public function assignEvents():Void
	{
		return;
	}

	private function goToNextLevel(EntID:Int, MapName:String):Void
	{
		switch MapName {
		    case "frogpond.tmx": FlxG.switchState(new FrogPond(EntID, "frogpond.tmx"));
		    case "town1.tmx": FlxG.switchState(new FrogPond(EntID, "town1.tmx"));
		    case "town2.tmx": FlxG.switchState(new TownState(EntID, "town2.tmx"));
		    case "town3.tmx": FlxG.switchState(new TownState(EntID, "town3.tmx"));
		    case "town4.tmx": FlxG.switchState(new TownState(EntID, "town4.tmx"));
		    case "town5.tmx": FlxG.switchState(new TownState(EntID, "town5.tmx"));
		    case "town6.tmx": FlxG.switchState(new TownState(EntID, "town6.tmx"));
		    default: FlxG.switchState(new TownState(EntID, MapName));
		}
	}




}