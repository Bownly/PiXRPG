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

class FrostCheckpoint extends TownState
{
	var npcGuard:NPC;
	var obj0:NPC;
	var obj1:NPC;
	var obj2:NPC;
	var obj3:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "housesong";
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();

		obj0 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "obj 0");
		obj1 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "obj 1");
		obj2 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "obj 2");
		obj3 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "obj 3");
		obj0.setCanTurn(false);
		obj1.setCanTurn(false);
		obj2.setCanTurn(false);
		obj3.setCanTurn(false);
		grpNPCs.add(obj0);
		grpNPCs.add(obj1);
		grpNPCs.add(obj2);
		grpNPCs.add(obj3);

		if (Reg.flags["monshou_fire"] != 1)
		{
			npcGuard = new NPC(0, 0, FlxObject.LEFT, Reg.npcs["dad"], this, "npc 0");
			grpNPCs.add(npcGuard);	
		}
		else if (Reg.flags["monshou_fire"] == 1)
		{
			npcGuard = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["dad"], this, "npc 1");
			grpNPCs.add(npcGuard);				
		}


		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		obj0.events = [new EventDialog(Strings.frostcheckpointStrings[4], this)];
		obj1.events = [new EventDialog(Strings.frostcheckpointStrings[4], this)];
		obj2.events = [new EventDialog(Strings.frostcheckpointStrings[3], this)];
		obj3.events = [new EventDialog(Strings.frostcheckpointStrings[3], this)];

	
		if (Reg.flags["monshou_ice"] != 1)  // after first talk with waterkid
		{
			npcGuard.events = [new EventDialog(Strings.frostcheckpointStrings[0], this)];
		}
		else if (Reg.flags["monshou_fire"] == 0)
		{
			npcGuard.events = [ new EventDialog(Strings.frostcheckpointStrings[1], this),
								new EventNPCWalk([npcGuard], [[[FlxObject.UP, 1], [FlxObject.DOWN, 0]]]),
								new EventFlag("monshou_fire", 1)
			];
		}		
		else if (Reg.flags["monshou_fire"] == 1)
		{
			npcGuard.events = [ new EventDialog(Strings.frostcheckpointStrings[2], this)];
		}
	}
}




