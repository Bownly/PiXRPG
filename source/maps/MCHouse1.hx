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

class MCHouse1 extends TownState
{
	var npcRival:NPC;
	var obj0:NPC;
	var obj1:NPC;
	var obj2:NPC;
	var obj3:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		if (Reg.flags["frogponddun"] == 2 && Reg.flags["owl_clan_attack"] == 0 || 
			Reg.flags["owl_clan_attack"] == 1) // 2 = talked to Froggo/concluded flag / 0 = pre-attack; 1 = post-attack; 
			_song = "badstuff";
		else 
			_song = "housesong";
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		
		if (Reg.flags["first_wakeup"] == 0)
		{
			npcRival = new NPC(48, 32, FlxObject.UP, 2, this, "npc 0");
			grpNPCs.add(npcRival);
		}

		obj0 = new NPC(0, 0, FlxObject.RIGHT, 8, this, "obj 0");
		obj1 = new NPC(0, 0, FlxObject.RIGHT, 8, this, "obj 1");
		obj2 = new NPC(0, 0, FlxObject.RIGHT, 8, this, "obj 2");
		obj3 = new NPC(0, 0, FlxObject.RIGHT, 8, this, "obj 3");
		obj0.setCanTurn(false);
		obj1.setCanTurn(false);
		obj2.setCanTurn(false);
		obj3.setCanTurn(false);
		grpNPCs.add(obj0);
		grpNPCs.add(obj1);
		grpNPCs.add(obj2);
		grpNPCs.add(obj3);
		super.create();

		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		obj0.events = [new EventDialog(Strings.mchouse1Strings[6], this)];
		obj1.events = [new EventDialog(Strings.mchouse1Strings[7], this)];
		obj2.events = [new EventDialog(Strings.mchouse1Strings[8], this)];
		obj3.events = [new EventDialog(Strings.mchouse1Strings[9], this)];


		if (Reg.flags["first_wakeup"] == 0)
		{
			eventManager.addEvents([new EventDialog(Strings.mchouse1Strings[0], this, 
													[new MenuItemDialogChoice(Strings.mchouse1Strings[1], 
														null, new EventFlag("dummy", 1)),
													 new MenuItemDialogChoice(Strings.mchouse1Strings[2], 
													 	null, new EventFlag("dummy", 1))
													]),
									new EventDialog(Strings.mchouse1Strings[3], this),
									new EventDialog(Strings.mchouse1Strings[4], this),
									new EventDialog(Strings.mchouse1Strings[5], this),
									new EventNPCWalk(npcRival, [[FlxObject.LEFT, 6],
															[FlxObject.DOWN, 1]]),
									new EventNPCRemove(npcRival),
									new EventFlag("first_wakeup", 1)
									]);
		}
	}
}




