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

class FrosCasBed extends TownState
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

		if (Reg.flags["waterkid_in_hut"] <= 2)
		{
			npcGuard = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["frostking"], this, "npc 0");
			grpNPCs.add(npcGuard);	
		}
		if (Reg.flags["waterkid_in_hut"] == 3)
		{
			npcGuard = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["frostking"], this, "npc 0");
			npcWaterkid = new NPC(0, 0, FlxObject.UP, Reg.npcs["waterkid"], this, "npc 1");
			npcWaterkid.visible = false;
			grpNPCs.add(npcGuard);	
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

		if (Reg.flags["waterkid_in_hut"] < 2)  // before waterkid confession
		{
			var events = [new EventDialog(Strings.frostkingdomStrings[0], this),
						  new EventFlag("waterkid_in_hut", 2)];
			npcGuard.events = events;
		}
		else if (Reg.flags["waterkid_in_hut"] == 3)  // with waterkid in party
		{

			npcGuard.events = [ new EventNPCAdd(npcWaterkid, grpNPCs),
								new EventNPCWalk([player], [[[FlxObject.DOWN, 1], [FlxObject.UP, 0]]]),
								new EventDialog(Strings.frostkingdomStrings[1], this),
								new EventNPCWalk([npcGuard, npcWaterkid, player],
									[[[FlxObject.UP, 11], [FlxObject.RIGHT, 5], [FlxObject.UP, 6], [FlxObject.LEFT, 5], [FlxObject.UP, 7]],
									 [[FlxObject.UP, 12], [FlxObject.RIGHT, 5], [FlxObject.UP, 6], [FlxObject.LEFT, 5], [FlxObject.UP, 6]],
									 [[FlxObject.UP, 13], [FlxObject.RIGHT, 5], [FlxObject.UP, 6], [FlxObject.LEFT, 5], [FlxObject.UP, 5], [FlxObject.LEFT, 1], [FlxObject.UP, 1]]]),
								new EventDialog(Strings.frostkingdomStrings[2], this),
								new EventNPCWalk([npcGuard], [[[FlxObject.DOWN, 0]]]),
								new EventDialog(Strings.frostkingdomStrings[3], this),
								new EventDialog(Strings.frostkingdomStrings[4], this),
								new EventDialog(Strings.frostkingdomStrings[5], this),
								new EventNPCRun([player, npcWaterkid, npcGuard], 
												[[[FlxObject.LEFT, 0]],
												 [[FlxObject.LEFT, 0]],
												 [[FlxObject.LEFT, 4]]]),
								new EventNPCRun([npcGuard], [[[FlxObject.DOWN, 4]]]),
								new EventNPCRun([player, npcWaterkid, npcGuard], 
												[[[FlxObject.DOWN, 0]],
												 [[FlxObject.DOWN, 0]],
												 [[FlxObject.DOWN, 5]]]),
								new EventNPCRemove(npcGuard),
								new EventNPCWalk([player, npcWaterkid], [[[FlxObject.RIGHT, 0]], 
																		 [[FlxObject.LEFT, 0]]]),
								new EventDialog(Strings.frostkingdomStrings[6], this),
								new EventDialog(Strings.frostkingdomStrings[7], this),
								new EventDialog(Strings.frostkingdomStrings[8], this),
								new EventDialog(Strings.frostkingdomStrings[9], this),
								new EventDialog(Strings.frostkingdomStrings[10], this),
								new EventDialog(Strings.frostkingdomStrings[11], this),
								new EventNPCWalk([npcWaterkid], [[[FlxObject.LEFT, 1]]]),
								new EventNPCRemove(npcWaterkid),
								new EventNPCWalk([player], [[[FlxObject.RIGHT, 1], [FlxObject.UP, 2]]])
								];
		
		}
	}
}




