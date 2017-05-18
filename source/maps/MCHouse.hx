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

class MCHouse extends TownState
{
	var npcRival:NPC;
	var npcDad:NPC;
	var door:NPC;
	var npcOwl:NPC;
	var npcFroggo:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		

		if (Reg.flags["owl_clan_attack"] == 2)  // return home
		{
			npcDad = new NPC(0, 0, FlxObject.DOWN, 1, this, "npc 0");
			npcRival = new NPC(0, 0, FlxObject.UP, 2, this, "npc 1");
			npcFroggo = new NPC(0, 0, FlxObject.UP, 2, this, "npc 2");
			grpNPCs.add(npcDad);	
			grpNPCs.add(npcRival);	
			grpNPCs.add(npcFroggo);
		}
		else if (Reg.flags["owl_clan_attack"] == 1)  // post-attack
		{
			npcDad = new NPC(0, 0, FlxObject.RIGHT, 1, this, "npc 0", true);
			npcRival = new NPC(0, 0, FlxObject.LEFT, 2, this, "npc 1");
			grpNPCs.add(npcDad);	
			grpNPCs.add(npcRival);	
		}
		else if (Reg.flags["frogponddun"] == 1)  // compeleted the dungeon
		{
			npcDad = new NPC(0, 0, FlxObject.DOWN, 1, this, "npc 1");
			npcRival = new NPC(0, 0, FlxObject.UP, 2, this, "npc 2");
			npcOwl = new NPC(0, 0, FlxObject.RIGHT, 4, this, "npc 0");
			grpNPCs.add(npcDad);	
			grpNPCs.add(npcRival);	
			grpNPCs.add(npcOwl);
		}
		else if (Reg.flags["owl_clan_attack"] == 0)  // pre-attack
		{
			if (Reg.flags["first_wakeup"] == 1)
			{
				npcDad = new NPC(0, 0, FlxObject.RIGHT, 1, this, "npc 0");
				npcRival = new NPC(0, 0, FlxObject.LEFT, 2, this, "npc 1");
				door = new NPC(0, 0, FlxObject.DOWN, 9, this, "npc 2");
				grpNPCs.add(npcDad);	
				grpNPCs.add(npcRival);	
				grpNPCs.add(door);	
			}
			else if (Reg.flags["first_wakeup"] == 2)
			{
				npcDad = new NPC(0, 0, FlxObject.DOWN, 1, this, "npc 0");
				grpNPCs.add(npcDad);	
			}
		}


		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		if (Reg.flags["owl_clan_attack"] == 4)  // mid-attack pt2
		{
			npcRival.events = [new EventDialog(Strings.mchomeStrings[23], this)];
			npcDad.events = [new EventDialog(Strings.mchomeStrings[23], this)];
		}		
		else if (Reg.flags["owl_clan_attack"] == 3)  // mid-attack pt2
		{
			eventManager.addEvents([new EventDialog(Strings.mchomeStrings[21], this),
									new EventNPCWalk(npcOwl, [[FlxObject.DOWN, 3]]),
									new EventNPCRemove(npcOwl),
									new EventDialog(Strings.mchomeStrings[22], this),
									new EventNPCSetCanTurn(npcDad, false),
									new EventNPCSetCanTurn(npcRival, false),
									new EventFlag("owl_clan_attack", 4)
									]);
		}		
	
		// else if (Reg.flags["owl_clan_attack"] == 1)  // mid-attack
		// {
		// 	npcRival.events = [new EventDialog(Strings.mchomeStrings[15], this)];
		// 	npcOwl.events = [new EventDialog(Strings.mchomeStrings[15], this)];
		// 	npcDad.events = [new EventNPCSetCanTurn(npcOwl, true),
		// 					 new EventNPCKillOrNot(npcRival, true),
		// 					 new EventDialog(Strings.mchomeStrings[16], this),
		// 					 new EventDialog(Strings.mchomeStrings[17], this),
		// 					 new EventNPCWalk(npcOwl, [[FlxObject.RIGHT, 0]]),
		// 					 new EventDialog(Strings.mchomeStrings[18], this),
		// 					 new EventNPCWalk(npcOwl, [ [FlxObject.LEFT, 1], [FlxObject.DOWN, 2], 
		// 					 							[FlxObject.RIGHT, 2], [FlxObject.DOWN, 2]]),
		// 					 new EventDialog(Strings.mchomeStrings[19], this),
		// 					 new EventFlag("owl_clan_attack", 2),
		// 					 new EventNPCWalk(player, [[FlxObject.DOWN, 2]]),
		// 					 new EventDialog(Strings.mchomeStrings[20], this),
		// 					 new EventBattle([new EnemyDoor()], this, "owl_clan_attack", 3)
		// 					];
		// }
		else if (Reg.flags["frogponddun"] == 1)  // compeleted the dungeon
		{
			eventManager.addEvents([new EventNPCKillOrNot(npcDad, true),
							 		new EventDialog(Strings.mchomeStrings[11], this),
									new EventNPCWalk(npcRival, [[FlxObject.UP, 3]]),
									new EventNPCWalk(npcOwl, [[FlxObject.DOWN, 0]]),
									new EventDialog(Strings.mchomeStrings[12], this),
									new EventDialog(Strings.mchomeStrings[13], this),
									new EventNPCWalk(npcRival, [[FlxObject.LEFT, 1], [FlxObject.UP, 3]]),
									new EventDialog(Strings.mchomeStrings[14], this),
									new EventNPCWalk(player, [[FlxObject.UP, 6]]),
									new EventDialog(Strings.mchomeStrings[16], this),
									new EventNPCKillOrNot(npcRival, true),
									new EventNPCWalk(player, [[FlxObject.LEFT, 0]]),
									new EventDialog(Strings.mchomeStrings[15], this),
									new EventDialog(Strings.mchomeStrings[17], this),
									new EventNPCWalk(npcOwl, [[FlxObject.RIGHT, 0]]),
									new EventDialog(Strings.mchomeStrings[18], this),
									new EventNPCWalk(npcOwl, [[FlxObject.LEFT, 1], [FlxObject.DOWN, 2], 
									 						  [FlxObject.RIGHT, 2], [FlxObject.DOWN, 2]]),
									new EventNPCWalk(player, [[FlxObject.DOWN]]),
									new EventDialog(Strings.mchomeStrings[19], this),
									new EventNPCWalk(player, [[FlxObject.DOWN, 2]]),
									new EventDialog(Strings.mchomeStrings[20], this),
									new EventBattle([new EnemyOwl()], this, "owl_clan_attack", 3)
									]);
		}
		else if (Reg.flags["owl_clan_attack"] == 0)  // pre-attack
		{
			if (Reg.flags["first_wakeup"] == 1)  // first talk with dad
			{
				npcRival.events = [ new EventDialog(Strings.mchomeStrings[6], this),
									new EventNPCWalk(npcRival, [[FlxObject.LEFT, 0]])];
				npcDad.events = [new EventDialog(Strings.mchomeStrings[7], this),
								 new EventDialog(Strings.mchomeStrings[8], this),
								 new EventDialog(Strings.mchomeStrings[9], this),
								 new EventFlag("first_wakeup", 2),
								 new EventNPCWalk(npcRival, [[FlxObject.DOWN, 6]]),
								 new EventZaWarudo(0.5),
								 new EventNPCRemove(door),
								 new EventNPCWalk(npcRival, [[FlxObject.DOWN, 3]]),
								 new EventNPCRemove(npcRival)
				];
			}
			else if (Reg.flags["first_wakeup"] == 2)  // after first talk with dad
				npcDad.events = [new EventDialog(Strings.mchomeStrings[10], this)];
		}
	}
}




