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

class FrogPondDun2 extends TownState
{
	var shrine:NPC;
	var npcRival:NPC;
	var npcMonshou:NPC;
	var door8:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "cavesong";
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		
		shrine = new NPC(0, 0, FlxObject.UP, 16, this, "npc shrine");
		grpNPCs.add(shrine);
		shrine.setCanTurn(false);

		if (Reg.flags["frogponddun"] == 0)
		{
			npcRival = new NPC(0, 0, FlxObject.UP, 2, this, "npc 0");
			grpNPCs.add(npcRival);
			npcMonshou = new NPC(0, 0, FlxObject.UP, 17, this, "npc monshou");
			npcMonshou.setCanTurn(false);
			grpNPCs.add(npcMonshou);
		}

		if (Reg.flags["frogpond_door8"] == 0)
		{
			door8 = new NPC(0, 0, FlxObject.DOWN, 9, this, "frogpond_door8");
			grpNPCs.add(door8);
		}

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		shrine.events = [new EventDialog(Strings.frogponddunStrings[16], this)];

		// door 1 block
		if (Reg.flags["frogpond_door8"] == 0)
			door8.events = [new EventDialog(Strings.frogponddunStrings[13], this),
							new EventBattle([new EnemyDoor([6, 5], 20, 21)], this, "frogpond_door8", 1),
							];
		else if (Reg.flags["frogpond_door8"] == 1) 
		{
			eventManager.addEvents([new EventNPCRemove(door8),
									new EventFlag("frogpond_door8", 2),
								 	new EventNPCWalk(player, [[FlxObject.UP, 3]]),
								 	new EventNPCWalk(npcRival, [[FlxObject.DOWN, 0]]),
									new EventDialog(Strings.frogponddunStrings[17], this),
								 	new EventNPCWalk(npcRival, [[FlxObject.LEFT, 1], [FlxObject.UP, 3], 
								 								[FlxObject.RIGHT, 1], [FlxObject.DOWN, 0]]),
									new EventDialog(Strings.frogponddunStrings[18], this),								 	
								 	new EventNPCRemove(npcRival),
									new EventDialog(Strings.frogponddunStrings[19], this),
								 	new EventNPCWalk(player, [[FlxObject.UP, 2]]),
									new EventDialog(Strings.frogponddunStrings[20], this),
									new EventZaWarudo(0.5),
									new EventNPCWalk(npcMonshou, [[FlxObject.DOWN, 2]], false),
									new EventNPCRemove(npcMonshou),
									new EventSFXPlay("lvl"),
									new EventZaWarudo(0.25),
									new EventDialog(Strings.frogponddunStrings[33], this),
									new EventFlag("frogponddun", 1),
									new EventFlag("monshou_frog", 1),
									]);
		}

	}
}



