package maps;

import flixel.FlxObject;
import flixel.group.FlxGroup;

import DialogClasses;
import EventClasses;
import EnemyClasses;
import MenuClasses;

/**
 * ...
 * @author Bownly
 */

class FrostCave0 extends Dungeon
{
	var npcGuard:NPC;
	var boat0:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "shadilay";

		encounterDecrementer = 1;
		encounterLowerBound = 22;
		encounterUpperBound = 33;
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();

		npcGuard = new NPC(0, 0, FlxObject.UP, Reg.npcs["frostguard"], this, "npc 0");
		grpNPCs.add(npcGuard);

		boat0 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 0-"+Reg.flags["froscav_boat0"]);
		boat0.setCanTurn(false);
		grpNPCs.add(boat0);
		if (Reg.flags["monshou_ice"] == 0)
			boat0.visible = false;

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		if (Reg.flags["froscav_boat0"] == 0)
			boat0.events = [new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventNPCRun([player, boat0], [[[FlxObject.RIGHT, 7]], [[FlxObject.RIGHT, 7]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventFlag("froscav_boat0", 1)
			];
		else
			boat0.events = [new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventNPCRun([player, boat0], [[[FlxObject.LEFT, 7]], [[FlxObject.LEFT, 7]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventFlag("froscav_boat0", 0)
			];

		if (npcGuard.visible == true)
		{
			if (Reg.flags["frostking_arc"] == 2)  // first talk with guard
			{
				npcGuard.events = [ new EventDialog(Strings.frostcaveStrings[0], this),
									new EventFlag("frostking_arc", 3)
									];
			}

			else
			{
				if (Reg.flags["dialog_choices"] == 0)  // reset boats or not?
					npcGuard.events = [ new EventDialog(Strings.frostcaveStrings[1], this, 
											[new MenuItemDialogChoice(Strings.frostcaveStrings[2], 
												null, new EventFlag("dialog_choices", 1)),
											 new MenuItemDialogChoice(Strings.frostcaveStrings[3], 
											 	null, new EventFlag("dialog_choices", 2))
										])];

				else if (Reg.flags["dialog_choices"] == 1)  // reset boats
				{
					eventManager.addEvents([new EventFlag("dialog_choices", 0),
											new EventDialog(Strings.frostcaveStrings[4], this)
											]);
					for (i in 0...16)
						eventManager.addEvents([new EventFlag("froscav_boat" + i, 0)]);
					edgeExitNextEntID = 2;
					edgeExitNextMapName = "frostcave-0";
					eventManager.addEvents([new EventScreenFade(this, .5),
											new EventZaWarudo(.5),
						new EventSwitchState("frostcave-0.tmx", 2)]);
				}
				else if (Reg.flags["dialog_choices"] == 2)  // don't reset boats
				{
					eventManager.addEvents([new EventFlag("dialog_choices", 0),
											new EventDialog(Strings.frostcaveStrings[5], this)
											]);
				}

			}

		}


		// if (Reg.flags["fireking_arc"] == 0)
		// {
		// 	eventManager.addEvents([ new EventDialog(Strings.firekingdomStrings[0], this),
		// 							new EventNPCWalk([player], [[[FlxObject.DOWN, 0]]]),
		// 							new EventSwitchState("worldmap.tmx", 7)
		// 	]);
		// }
	}

	override private function calculateEncounter(Val:Int):Array<EnemyClasses.BaseEnemy>
	{
		var arr:Array<EnemyClasses.BaseEnemy> = [];

		switch (Val)
		{
			case 1: arr.push(new EnemyClasses.EnemyKettle());
			case 2: arr.push(new EnemyClasses.EnemyKettle());
			case 3: arr.push(new EnemyClasses.EnemyKettle());
			case 4: arr.push(new EnemyClasses.EnemyKettle());
			case 5: arr.push(new EnemyClasses.EnemyKettle());
			case 6: arr.push(new EnemyClasses.EnemyKettle());
			case 7: arr.push(new EnemyClasses.EnemyKettle());
			case 15: arr.push(new EnemyClasses.EnemyTest());
			case 16: arr.push(new EnemyClasses.EnemyTest());
			default: arr.push(new EnemyClasses.EnemyTest());
		}
		trace("VAL:         " + Val);
		trace("enemy arr:   " + arr);
		if (arr == [])
			arr.push(new EnemyClasses.EnemyKettle());
		return arr;
	}
}




