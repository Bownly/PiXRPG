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

class FrogPondDocks extends TownState
{
	var npcBoat:NPC;
	var npcDoor:NPC;
	var npcFroggo:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
		super(EntranceID, MapName, SongName, Dungeon);

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();

		if (Reg.flags["owl_clan_attack"] == 4)
		{
			npcFroggo = new NPC(256, 256, FlxObject.UP, 0, this, "npc 0");
			grpNPCs.add(npcFroggo);
			npcFroggo.visible = false;		
		}
		if (Reg.flags["owl_clan_attack"] == 5)
		{
			npcFroggo = new NPC(256, 256, FlxObject.LEFT, 0, this, "npc 3");
			grpNPCs.add(npcFroggo);
		}
		else
		{
			npcDoor = new NPC(0, 0, FlxObject.DOWN, 9, this, "npc 1");
			grpNPCs.add(npcDoor);	
		}

		npcBoat = new NPC(0, 0, FlxObject.RIGHT, 12, this, "npc 2");
		grpNPCs.add(npcBoat);


		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();

		if (npcDoor != null)
			npcDoor.events = [new EventDialog(Strings.frogponddocksStrings[0], this)];

		if (Reg.flags["owl_clan_attack"] == 4)
			eventManager.addEvents([new EventNPCAdd(npcFroggo, grpNPCs),
									new EventNPCWalk(npcFroggo, [[FlxObject.UP, 1], [FlxObject.DOWN, 0]]),
									new EventDialog(Strings.frogponddocksStrings[1], this),  // hold on a moment, I'll have to unlock the door
									new EventNPCWalk(npcFroggo, [[FlxObject.UP, 1]]),
									new EventZaWarudo(0.5),
									new EventNPCRemove(npcDoor),
									new EventNPCWalk(npcFroggo, [[FlxObject.RIGHT, 1], [FlxObject.DOWN, 0]]),
									new EventDialog(Strings.frogponddocksStrings[2], this),  // frogspeed, pname, believe in yourself
									new EventFlag("owl_clan_attack", 5)
									]);
		else if (Reg.flags["owl_clan_attack"] == 5)
		{
			npcFroggo.events = [new EventDialog(Strings.frogponddocksStrings[3], this)];  // frogspeed, pname, believe in yourself
			npcBoat.events = [new EventDialog(Strings.frogponddocksStrings[4], this,  // am I ready for this?
								 [new MenuItemDialogChoice(Strings.frogponddocksStrings[5],  // yes
									null, new EventFlag("end_prologue", 1)),
								  new MenuItemDialogChoice(Strings.frogponddocksStrings[6],  // not yet
								 	null, new EventFlag("end_prologue", -1))
								 ]),
							 ];
		}
		if (Reg.flags["end_prologue"] == 1)
		{
			eventManager.addEvents([new EventNPCWalk(player, [[FlxObject.UP, 1]]),
									new EventNPCRemove(player),
									new EventNPCWalk(npcFroggo, [[FlxObject.UP, 0]]),
									new EventNPCWalk(npcBoat, [[FlxObject.RIGHT, 12]]),
									new EventNPCWalk(player, [[FlxObject.DOWN, 8]]),
									new EventZaWarudo(.5),
									new EventNPCWalk(npcFroggo, [[FlxObject.DOWN, 0]]),
									new EventZaWarudo(0.5),
									new EventNPCWalk(npcFroggo, [[FlxObject.DOWN, 4]]),
									new EventNPCRemove(npcFroggo),
									new EventFlag("end_prologue", 0),
									new EventSwitchState("credits")
									]);
		}
		else if (Reg.flags["end_prologue"] == -1)
		{
			eventManager.addEvents([new EventNPCWalk(player, [[FlxObject.DOWN, 1]]),
									new EventFlag("end_prologue", 0)
									]);
		}
		


	}
}





