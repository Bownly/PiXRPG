package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

import EventClasses;

/**
 * ...
 * @author ...
 */
class WorldMap extends TownState
{
	var npcBoat:NPC;
	var npcRival:NPC;
	var _txtCh1Title:FlxText;
	var _txtCh1Subtitle:FlxText;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{

		super(EntranceID, MapName, SongName, Dungeon);
		_song = "worldmap";

		if (Reg.flags["frogponddun"] == 0)
			encounterDecrementer = 0;
		else
			encounterDecrementer = 1;

		encounterLowerBound = 22;
		encounterUpperBound = 33;

	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		if (Reg.flags["first_wakeup"] == 2)
		{
			npcRival = new NPC(0, 0, FlxObject.UP, Reg.npcs["rival"], this, "npc 0");
			grpNPCs.add(npcRival);
		}

		if (Reg.flags["owl_clan_attack"] < 5 || Reg.flags["ch1_progress"] == 1)
		{
			npcBoat = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["boat"], this, "npc boat");
			grpNPCs.add(npcBoat);	
			for (i in 1...31)
			{
				var storm = new NPC(0, 0, FlxObject.UP, Reg.npcs["boat"], this, "storm "+i, true);
				grpNPCs.add(storm);
			}
		}

		super.create();

		if (Reg.flags["ch1_progress"] == 1)
		{
			player.visible = false;	
			
			_txtCh1Title = new FlxText(0, 0, FlxG.width, "Chapter 1", 24);
			_txtCh1Title.y = (FlxG.height/2 - _txtCh1Title.height * 1.5);
			_txtCh1Title.alignment = "center";
			_txtCh1Title.scrollFactor.set();

			_txtCh1Subtitle = new FlxText(0, 0, FlxG.width, "Water Kid stuff", 24);
			_txtCh1Subtitle.y = (FlxG.height/2);
			_txtCh1Subtitle.alignment = "center";
			_txtCh1Subtitle.scrollFactor.set();
		}

		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		if (Reg.flags["first_wakeup"] == 2)
		{
			eventManager.addEvents([new EventFlag("first_wakeup", 3),
				new EventDialog(Strings.worldmapStrings[0], this),
									new EventNPCWalk([npcRival], [[[FlxObject.UP, 1]]]),
									new EventNPCRemove(npcRival),
									new EventFlag("first_wakeup", 3),
									]);
		}
		if (Reg.flags["ch1_progress"] == 1)  // boat ride time
		{
			eventManager.addEvents([new EventNPCRun([player, npcBoat], 
													[[[FlxObject.RIGHT, 42], [FlxObject.DOWN, 6], 
													  [FlxObject.RIGHT, 20]],
													 [[FlxObject.RIGHT, 42], [FlxObject.DOWN, 6], 
													  [FlxObject.RIGHT, 20]]]),
									new EventDialog(Strings.worldmapStrings[1], this),
									new EventNPCWalk([player, npcBoat], 
													[[[FlxObject.UP, 3], [FlxObject.RIGHT, 2],
													  [FlxObject.UP, 1], [FlxObject.RIGHT, 3]],
													 [[FlxObject.UP, 3], [FlxObject.RIGHT, 2],
													  [FlxObject.UP, 1], [FlxObject.RIGHT, 3]]]),
									new EventDialog(Strings.worldmapStrings[2], this),
									new EventNPCWalk([player, npcBoat], 
													[[[FlxObject.DOWN, 2]],
													 [[FlxObject.DOWN, 2]]]),
									new EventNPCRun([player, npcBoat], 
													[[ [FlxObject.DOWN, 2], 
													  [FlxObject.LEFT, 1], [FlxObject.UP, 1]],
													 [ [FlxObject.DOWN, 2], 
													  [FlxObject.LEFT, 1], [FlxObject.UP, 1]]]),
									new EventDialog(Strings.worldmapStrings[3], this),
									new EventScreenFade(this, 5),
									new EventNPCRun([player, npcBoat], 
													[[[FlxObject.RIGHT, 1], [FlxObject.DOWN, 1],
													  [FlxObject.LEFT, 1], [FlxObject.UP, 1],
													  [FlxObject.RIGHT, 1], [FlxObject.DOWN, 1],
													  [FlxObject.LEFT, 1], [FlxObject.UP, 1],
													  [FlxObject.RIGHT, 1], [FlxObject.DOWN, 1],
													  [FlxObject.LEFT, 1], [FlxObject.UP, 1],
													  [FlxObject.RIGHT, 1], [FlxObject.DOWN, 1],
													  [FlxObject.LEFT, 1], [FlxObject.UP, 1],
													  [FlxObject.UP, 3]],
													 [[FlxObject.RIGHT, 1], [FlxObject.DOWN, 1],
													  [FlxObject.LEFT, 1], [FlxObject.UP, 1],
													  [FlxObject.RIGHT, 1], [FlxObject.DOWN, 1],
													  [FlxObject.LEFT, 1], [FlxObject.UP, 1],
													  [FlxObject.RIGHT, 1], [FlxObject.DOWN, 1],
													  [FlxObject.LEFT, 1], [FlxObject.UP, 1],
													  [FlxObject.RIGHT, 1], [FlxObject.DOWN, 1],
													  [FlxObject.LEFT, 1], [FlxObject.UP, 1],
													  [FlxObject.UP, 3]]]),
									new EventNPCWalk([player, npcBoat], 
													[[[FlxObject.UP, 5]],
													 [[FlxObject.UP, 5]]]),
									new EventFlag("ch1_progress", 2),
									new EventZaWarudo(1),
									new EventSpriteAdd(_txtCh1Title, this),
									new EventZaWarudo(2),
									new EventSpriteAdd(_txtCh1Subtitle, this),
									new EventZaWarudo(4),
									new EventSwitchState("waterkidhut.tmx", 1)


				]);
		}

	}	
	// override public function create():Void 
	// {
	// 	super.create();
	// }
	
	// override function update(elapsed:Float):Void
	// {
	// 	super.update(elapsed);
	// }
}