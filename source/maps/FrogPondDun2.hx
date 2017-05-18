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
	var npcia:NPC;
	var rival:NPC;
	var door8:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		
		npcia = new NPC(0, 0, FlxObject.DOWN, 1, this, "npc 0");
		grpNPCs.add(npcia);


		if (Reg.flags["frogpond_door8"] == 0)
		{
			door8 = new NPC(0, 0, FlxObject.DOWN, 9, this, "door 8");
			grpNPCs.add(door8);
		}

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		npcia.events = [new EventDialog(Strings.frogponddunStrings[16], this)];

		// door 1 block
		if (Reg.flags["frogpond_door8"] == 0)
			door8.events = [new EventDialog(Strings.frogponddunStrings[11], this),
							new EventBattle([new EnemyDoor([5, 5])], this, "frogpond_door8", 1),
							];
		else if (Reg.flags["frogpond_door8"] == 1) 
		{
			eventManager.addEvents([new EventNPCRemove(door8)]);
			eventManager.addEvents([new EventFlag("frogpond_door8", 2)]);
		}

	}
}



