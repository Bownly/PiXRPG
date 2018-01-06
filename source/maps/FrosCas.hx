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

class FrosCas extends TownState
{
	var npcGuard:NPC;
	var npcWaterkid:NPC;
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

		obj0 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal1"], this, "obj 0");
		obj1 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal1"], this, "obj 1");
		obj2 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal1"], this, "obj 2");
		obj3 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal1"], this, "obj 3");
		obj0.setCanTurn(false);
		obj1.setCanTurn(false);
		obj2.setCanTurn(false);
		obj3.setCanTurn(false);
		grpNPCs.add(obj0);
		grpNPCs.add(obj1);
		grpNPCs.add(obj2);
		grpNPCs.add(obj3);

		if (Reg.flags["waterkid_in_hut"] == 4)
		{
			npcWaterkid = new NPC(0, 0, FlxObject.UP, Reg.npcs["waterkid"], this, "npc 0");
			npcWaterkid.visible = false;
			grpNPCs.add(npcWaterkid);	
		}


		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		// obj0.events = [new EventDialog(Strings.mchouseStrings[1], this)];
		// obj1.events = [new EventDialog(Strings.mchouseStrings[2], this)];
		// obj2.events = [new EventDialog(Strings.mchouseStrings[3], this)];
		// obj3.events = [new EventDialog(Strings.mchouseStrings[3], this)];


		if (Reg.flags["waterkid_in_hut"] == 4)  // en route to see king
		{

			eventManager.addEvents([
									new EventNPCWalk([player], [[[FlxObject.UP, 4]]]),
									new EventNPCAdd(npcWaterkid),
									new EventNPCWalk([player], [[[FlxObject.UP, 1], [FlxObject.DOWN, 0]]]),

									new EventDialog(Strings.frostcastleStrings[1], this),
									new EventDialog(Strings.frostcastleStrings[2], this),
									new EventDialog(Strings.frostcastleStrings[3], this),
									new EventDialog(Strings.frostcastleStrings[4], this),
									new EventDialog(Strings.frostcastleStrings[5], this),
									new EventDialog(Strings.frostcastleStrings[6], this),
									new EventDialog(Strings.frostcastleStrings[7], this),
									new EventDialog(Strings.frostcastleStrings[8], this),
									new EventDialog(Strings.frostcastleStrings[9], this),
									new EventDialog(Strings.frostcastleStrings[10], this),
									new EventDialog(Strings.frostcastleStrings[11], this),
									new EventDialog(Strings.frostcastleStrings[12], this),
									new EventDialog(Strings.frostcastleStrings[13], this),
									new EventDialog(Strings.frostcastleStrings[14], this),
									new EventDialog(Strings.frostcastleStrings[15], this),
									new EventDialog(Strings.frostcastleStrings[16], this),
									new EventDialog(Strings.frostcastleStrings[17], this),
									new EventDialog(Strings.frostcastleStrings[18], this),
									new EventDialog(Strings.frostcastleStrings[19], this),
									new EventDialog(Strings.frostcastleStrings[20], this),
									new EventDialog(Strings.frostcastleStrings[21], this),
									new EventDialog(Strings.frostcastleStrings[22], this),
									new EventDialog(Strings.frostcastleStrings[23], this),
									new EventNPCWalk([npcWaterkid], [[[FlxObject.UP, 1]]]),
									new EventNPCRemove(npcWaterkid),
									new EventFlag("waterkid_in_hut", 5)
								]);
		
		}
	}
}




