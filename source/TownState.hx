package;

import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.system.FlxSound;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tile.FlxBaseTilemap;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;

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
	public var grpEntities:FlxTypedGroup<Entity> = new FlxTypedGroup<Entity>();
	
	public var width:Int;
	public var height:Int;
	public var tileMap:FlxTilemap;
	
	var sub:BattleSubState;
	var _song:String = "townsong";
	
	var _sprTransition:FlxSprite;

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
		
		_sprTransition = new FlxSprite(0, 0);
		_sprTransition.makeGraphic(FlxG.width + 40, FlxG.height + 40, 0xff000000);
		_sprTransition.alpha = 0;

		FlxG.camera.bgColor = 0xffffffff;
		FlxG.camera.follow(player);		
		// FlxG.camera.pixelPerfectRender = false;
		FlxG.mouse.visible = false;		

		// does this fix it????
		FlxG.camera.pixelPerfectRender = true;
		// FlxG.camera.pixelPerfectPosition = false;

FlxG.scaleMode = new PixelPerfectScaleMode();
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

		add(_sprTransition);

		// grpEntities = new FlxTypedGroup<Entity>();
		for (npc in grpNPCs)
			grpEntities.add(npc);
		grpEntities.add(player);

		SoundManager.initializeSFX();
		playSong();
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
		super.update(elapsed);	

		if (Reg.STATE != Reg.STATE_TRANSITION)
		{
			if (player.x == width || player.x == 0 || player.y == height || player.y == 0)
				// Reg.goToNextLevel(edgeExitNextEntID, edgeExitNextMapName);
						stateTransition();

			// start battle!!!!
			if (Reg.encounterCounter <= 0 && encounterUpperBound != 0)  // eUB = 0 when the map doesn't have random encounters
			{
				var map = tileMap;
				var val:Int = encounterMap.tileArray[Std.int(player.y/16 * (width+16)/16 + player.x/16)];

				sub = new BattleSubState(this, calculateEncounter(val));
				this.openSubState(sub);
			}

			if (Reg.STATE == Reg.STATE_NORMAL)
			{
				if (FlxG.keys.anyJustPressed(Reg.keys["menu"]))
				{
					var sub = new MenuSubState(FlxG.width/2, FlxG.height/2, this);
					this.openSubState(sub);
				}
				// debug cheat
				// else if (FlxG.keys.anyJustPressed(["O"]))
				// {
				// 	eventManager.addEvents([new EventClasses.EventItemGet(new ItemClasses.ItemHealing("WWWWWWWW", "heals 5 MP\nWait, only 5? Must be past its expiration\ndate.", 9, 5))]);
				// 	eventManager.addEvents([new EventClasses.EventItemGet(new ItemClasses.ItemHealing("WWWWWWWW", "heals 10 MP\nAh, the classic bargain bin potion.", 9, 10))]);
				// 	eventManager.addEvents([new EventClasses.EventItemGet(new ItemClasses.ItemHealing("Good potion", "heals 15 MP\nAnd it tastes great too.", 9, 15))]);
				// 	eventManager.addEvents([new EventClasses.EventItemGet(new ItemClasses.ItemHealing("Edible Barrel", Strings.itemDescriptions["Edible Barrel"], 9, 69))]);
				// 	eventManager.addEvents([new EventClasses.EventItemGet(new ItemClasses.ItemHealing("e potion", "heals 100 MP\nNow that's a lotta MP!", 9, 100))]);
				// 	Reg.STATE = Reg.STATE_CUTSCENE;
				// }
			}
			
			if (FlxG.keys.anyJustPressed(["M"]))
				FlxG.sound.toggleMuted();
			
			for (exit in grpExits)
			{
				if (exit.y == player.y && exit.x == player.x)
				{
					if (exit.isActive)
					{
						edgeExitNextEntID = exit.nextLvlEntID;
						edgeExitNextMapName = exit.nextLvl;
						stateTransition();
					}
				}			
			}
		}
		// else
		// 	stateTransition();
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

	public function encounterCheck():Bool
	{
		Reg.encounterCounter -= encounterDecrementer;
		if (Reg.encounterCounter <= 0 && encounterUpperBound != 0)
			return true;
		else
			return false;
	}

	public function playSong():Void
	{
		SoundManager.stopMusic(_song);
		SoundManager.playMusic(_song);		
	}

	private function calculateEncounter(Val:Int):Array<EnemyClasses.BaseEnemy>
	{
		var arr:Array<EnemyClasses.BaseEnemy> = [];

		switch (Val)
		{
			case 1: arr.push(new EnemyClasses.EnemyMush());
			case 2: arr.push(new EnemyClasses.EnemyBee());
			case 3: arr.push(new EnemyClasses.EnemySnail());
			case 4: arr.push(new EnemyClasses.EnemyFlower());
			case 5: arr.push(new EnemyClasses.EnemyTadpole());
			case 6: arr.push(new EnemyClasses.EnemyFrog());
		}
		return arr;
	}

	private function stateTransition():Void
	{
		Reg.STATE = Reg.STATE_TRANSITION;
		_sprTransition.x = FlxG.camera.scroll.x - 20;
		_sprTransition.y = FlxG.camera.scroll.y - 20;
	    FlxTween.tween(_sprTransition, { alpha: 1 }, 0.10, { ease:FlxEase.circOut, onComplete: goToNextLevel});
	    // FlxG.camera.alpha = 0;
	}

	private function goToNextLevel(_):Void
	{
		Reg.STATE = Reg.STATE_NORMAL;
		Reg.goToNextLevel(edgeExitNextEntID, edgeExitNextMapName);
	}




}