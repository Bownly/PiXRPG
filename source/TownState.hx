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

import DialogClasses;
import EventClasses;
import EnemyClasses;
import MenuClasses;


/**
 * A FlxState which can be used for the game's menu.
 */
class TownState extends FlxState
{
	public var encounterDecrementer:Int = 0;
	public var encounterLowerBound:Int = 0;
	public var encounterUpperBound:Int = 0;

	public var eventManager:EventClasses.EventManager;
	
	public var player:Player;
	public var grpNPCs:FlxTypedGroup<NPC> = new FlxTypedGroup<NPC>();
	public var grpExits:FlxTypedGroup<Exit> = new FlxTypedGroup<Exit>();
	
	public var width:Int;
	public var height:Int;
	public var tileMap:FlxTilemap;
	
	var sub:BattleSubState;
	
	public var songTownsong:FlxSound;
	
	// tiled stuff
	public var level:TiledLevel;
	public var entranceID:Int = 0;
	public var playerDir:String = "S";
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
		// songTownsong = FlxG.sound.load("assets/music/townsong.wav");
		
		Reg.resetEncounterCounter(encounterLowerBound, encounterUpperBound);
		
		player = new Player(0, 0, FlxObject.DOWN, this);
		
		FlxG.camera.bgColor = 0xffffffff;
		FlxG.camera.follow(player);		
		// FlxG.camera.pixelPerfectRender = false;
		FlxG.mouse.visible = false;		
		super.create();

		bgColor = 0xffffffff;  // hwite
		bgColor = 0x00000000;  // black

		level = new TiledLevel("assets/levels/" + mapName, this);
		
		// Add backgrounds
		add(level.backgroundLayer);

		// Load level objects
		add(level.objectsLayer);

		// Add foreground tiles after adding level objects, so these tiles render on top of player
		add(grpExits);
		add(player);
		add(grpNPCs);
		add(level.foregroundLayer);

		SoundManager.play("townsong");
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update(elapsed:Float):Void
	{
		eventManager.update(elapsed);

		// SoundManager.play("townsong");

		// if (subState == null && !Reg.isMuted)
		// 	songTownsong.play(false);
		// else
		// 	songTownsong.pause();
						

		if (player.x == width || player.x == 0 || player.y == height || player.y == 0)
			Reg.goToNextLevel(edgeExitNextEntID, edgeExitNextMapName);

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

			var val:Int = encounterMap.tileArray[Std.int(player.y/16 * (width+16)/16 + player.x/16)];

			if (val > 4)
				val = 1;
			
			// songTownsong.pause();
			sub = new BattleSubState(this, calculateEncounter(val));
			this.openSubState(sub);
		}

		if (Reg.STATE != Reg.STATE_CUTSCENE)
		{
			if (FlxG.keys.anyJustPressed(Reg.keys["menu"]))
			{
				var sub = new MenuSubState(FlxG.width/2, FlxG.height/2, this);
				this.openSubState(sub);
			}
			else if (FlxG.keys.anyJustPressed(["O"]))
			{
				eventManager.addEvents([new EventClasses.EventItemGet(new ItemClasses.ItemHealing("WWWWWWWW", "heals 5 MP\nWait, only 5? Must be past its expiration\ndate.", 9, 5))]);
				eventManager.addEvents([new EventClasses.EventItemGet(new ItemClasses.ItemHealing("WWWWWWWW", "heals 10 MP\nAh, the classic bargain bin potion.", 9, 10))]);
				eventManager.addEvents([new EventClasses.EventItemGet(new ItemClasses.ItemHealing("Good potion", "heals 15 MP\nAnd it tastes great too.", 9, 15))]);
				eventManager.addEvents([new EventClasses.EventItemGet(new ItemClasses.ItemHealing("Edible Barrel", Strings.itemDescriptions["Edible Barrel"], 9, 69))]);
				eventManager.addEvents([new EventClasses.EventItemGet(new ItemClasses.ItemHealing("e potion", "heals 100 MP\nNow that's a lotta MP!", 9, 100))]);
				Reg.STATE = Reg.STATE_CUTSCENE;
			}
		}
		
		if (FlxG.keys.anyJustPressed(["M"]))
			Reg.muteToggle();
		
		for (exit in grpExits)
		{
			if (exit.y == player.y && exit.x == player.x)
			{
				if (exit.isActive)
					Reg.goToNextLevel(exit.nextLvlEntID, exit.nextLvl);
			}			
		}



		super.update(elapsed);
	}	


	public function assignEvents():Void
	{
		if (Reg.flags["Save"] == 1)
		{
			eventManager.addEvents([new EventDialog(Strings.stringArray[9], this)]);
			eventManager.addEvents([new EventFlag("Save", 0)]);
			eventManager.addEvents([new EventSaveGame(2, mapName)]);
		}

		return;
	}

	private function calculateEncounter(Val:Int):Array<EnemyClasses.BaseEnemy>
	{
		var arr:Array<EnemyClasses.BaseEnemy> = [];

		switch (Val)
		{
			case 1:
				arr.push(new EnemyClasses.EnemyMush());
			case 2:
				arr.push(new EnemyClasses.EnemyBee());
			case 3:
				arr.push(new EnemyClasses.EnemySnail());
			case 4:
				arr.push(new EnemyClasses.EnemyMush());
				arr.push(new EnemyClasses.EnemyFlower());
		}

		return arr;
	}






}