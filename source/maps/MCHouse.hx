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

		if (Reg.flags["owl_clan_attack"] == 2)  // 2 = return home
		{
			npcDad = new NPC(0, 0, FlxObject.DOWN, 1, this, "npc 1", true);
			npcRival = new NPC(0, 0, FlxObject.UP, 2, this, "npc 5", true);
			npcFroggo = new NPC(0, 0, FlxObject.UP, 0, this, "npc 2");
			grpNPCs.add(npcDad);	
			grpNPCs.add(npcRival);	
			grpNPCs.add(npcFroggo);
			npcFroggo.visible = false;
		}
		else if (Reg.flags["owl_clan_attack"] == 1)  // 1 = post-attack
		{
			npcDad = new NPC(0, 0, FlxObject.RIGHT, 1, this, "npc 1", true);
			npcRival = new NPC(0, 0, FlxObject.LEFT, 2, this, "npc 5", true);
			grpNPCs.add(npcDad);	
			grpNPCs.add(npcRival);	
		}
		else if (Reg.flags["frogponddun"] == 2 && Reg.flags["owl_clan_attack"] == 0) // compeleted the dungeon, owl_clan_attack start
		{
			npcDad = new NPC(0, 0, FlxObject.DOWN, 1, this, "npc 1");
			npcRival = new NPC(0, 0, FlxObject.UP, 2, this, "npc 2");
			npcOwl = new NPC(0, 0, FlxObject.RIGHT, 4, this, "npc 0");
			grpNPCs.add(npcDad);	
			grpNPCs.add(npcRival);	
			grpNPCs.add(npcOwl);
			npcRival.visible = false;
		}
		else if (Reg.flags["owl_clan_attack"] == 0)  // 0 = pre-attack
		{
			if (Reg.flags["first_wakeup"] == 1)
			{
				npcDad = new NPC(0, 0, FlxObject.RIGHT, 1, this, "npc 0");
				npcRival = new NPC(0, 0, FlxObject.LEFT, 2, this, "npc 1");
				door = new NPC(0, 0, FlxObject.DOWN, 9, this, "npc 4");
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


		// playSong();			

		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		obj0.events = [new EventDialog(Strings.mchouseStrings[1], this)];
		obj1.events = [new EventDialog(Strings.mchouseStrings[2], this)];
		obj2.events = [new EventDialog(Strings.mchouseStrings[3], this)];
		obj3.events = [new EventDialog(Strings.mchouseStrings[3], this)];


		if (Reg.flags["owl_clan_attack"] == 2)  // 2 = return home
		{
			eventManager.addEvents([new EventNPCWalk(player, [[FlxObject.UP, 3]]),
									new EventNPCAdd(npcFroggo, grpNPCs),
									new EventNPCWalk(npcFroggo, [[FlxObject.UP, 1], [FlxObject.LEFT, 1], [FlxObject.UP, 1]]),
									new EventDialog(Strings.mchouseStrings[34], this),
									new EventNPCWalk(npcFroggo, [[FlxObject.RIGHT, 1], [FlxObject.UP, 1]]),
									new EventDialog(Strings.mchouseStrings[35], this),
									new EventNPCWalk(player, [[FlxObject.UP, 1]]),
									new EventDialog(Strings.mchouseStrings[36], this),
									new EventNPCWalk(npcFroggo, [[FlxObject.DOWN, 1]]),
									new EventDialog(Strings.mchouseStrings[37], this),
									new EventNPCWalk(npcFroggo, [[FlxObject.UP, 1]]),
									new EventNPCWalk(npcDad, [[FlxObject.DOWN, 1]]),
									new EventNPCRemove(npcDad),
									new EventNPCWalk(npcFroggo, [[FlxObject.LEFT, 0]]),
									new EventNPCWalk(npcRival, [[FlxObject.RIGHT, 1]]),
									new EventNPCRemove(npcRival),
									new EventNPCWalk(npcFroggo, [[FlxObject.DOWN, 1]]),
									new EventNPCWalk(player, [[FlxObject.LEFT, 1], [FlxObject.RIGHT, 0]]),
									new EventNPCWalk(npcFroggo, [[FlxObject.DOWN, 5]]),
									new EventNPCRemove(npcFroggo),
									new EventFlag("owl_clan_attack", 3)
									]);
		}	
		else if (Reg.flags["owl_clan_attack"] == 1)  // 1 = post-attack
		{
			npcRival.events = [new EventDialog(Strings.mchouseStrings[33], this)];
			npcDad.events = [new EventDialog(Strings.mchouseStrings[33], this)];
		}		
		else if (Reg.flags["frogponddun"] == 2 && Reg.flags["owl_clan_attack"] == 0)  // compeleted the dungeon, owl_clan_attack start
		{
			eventManager.addEvents([new EventNPCKillOrNot(npcDad, true),
							 		new EventDialog(Strings.mchouseStrings[21], this),
									new EventNPCWalk(player, [[FlxObject.UP, 3]]),
									new EventNPCAdd(npcRival, grpNPCs),
									new EventNPCWalk(npcRival, [[FlxObject.LEFT, 1], [FlxObject.UP, 1]]),
									new EventNPCWalk(npcOwl, [[FlxObject.DOWN, 0]]),
									new EventDialog(Strings.mchouseStrings[22], this),
									new EventDialog(Strings.mchouseStrings[23], this),
									new EventNPCWalk(npcRival, [[FlxObject.UP, 2]]),
									new EventDialog(Strings.mchouseStrings[24], this),
									new EventNPCWalk(player, [[FlxObject.UP, 3]]),
									new EventDialog(Strings.mchouseStrings[26], this),
									new EventDialog(Strings.mchouseStrings[38], this),
									new EventZaWarudo(0.3),
									new EventSFXPlay("hurt"),
									new EventNPCKillOrNot(npcRival, true),
									new EventZaWarudo(0.3),
									new EventNPCWalk(player, [[FlxObject.LEFT, 0]]),
									new EventDialog(Strings.mchouseStrings[25], this),
									new EventDialog(Strings.mchouseStrings[27], this),
									new EventNPCWalk(npcOwl, [[FlxObject.RIGHT, 0]]),
									new EventDialog(Strings.mchouseStrings[28], this),
									new EventNPCWalk(npcOwl, [[FlxObject.LEFT, 1], [FlxObject.DOWN, 2], 
									 						  [FlxObject.RIGHT, 2], [FlxObject.DOWN, 2]]),
									new EventNPCWalk(player, [[FlxObject.DOWN, 0]]),
									new EventDialog(Strings.mchouseStrings[29], this),
									new EventNPCWalk(player, [[FlxObject.DOWN, 2]]),
									new EventNPCWalk(npcOwl, [[FlxObject.UP, 0]]),
									new EventDialog(Strings.mchouseStrings[30], this),
									new EventBattle([new EnemyOwl()], this, "owl_clan_attack", 1, "miniboss"),
									new EventDialog(Strings.mchouseStrings[31], this),
									new EventNPCWalk(npcOwl, [[FlxObject.DOWN, 3]]),
									new EventNPCRemove(npcOwl),
									new EventDialog(Strings.mchouseStrings[32], this),
									new EventNPCSetCanTurn(npcDad, false),
									new EventNPCSetCanTurn(npcRival, false)
									]);
		}
		else if (Reg.flags["owl_clan_attack"] == 0)  // 0 = pre-attack
		{
			if (Reg.flags["first_wakeup"] == 1)  // first talk with dad
			{
				door.events = [new EventDialog(Strings.mchouseStrings[0], this)];
				npcRival.events = [ new EventDialog(Strings.mchouseStrings[6], this),
									new EventNPCWalk(npcRival, [[FlxObject.LEFT, 0]])];
				npcDad.events = [new EventDialog(Strings.mchouseStrings[7], this),
								 new EventDialog(Strings.mchouseStrings[8], this),
								 new EventDialog(Strings.mchouseStrings[9], this),
								 new EventDialog(Strings.mchouseStrings[10], this),
								 new EventDialog(Strings.mchouseStrings[11], this),
								 new EventDialog(Strings.mchouseStrings[12], this),
								 new EventDialog(Strings.mchouseStrings[13], this),
								 new EventDialog(Strings.mchouseStrings[14], this),
								 new EventDialog(Strings.mchouseStrings[15], this),
								 new EventDialog(Strings.mchouseStrings[16], this),
								 new EventUnlockPen(0),

								 // new EventPlaySFX("item_get"),

								 new EventDialog(Strings.mchouseStrings[17], this),
								 new EventDialog(Strings.mchouseStrings[18], this),
								 new EventNPCWalk(npcRival, [[FlxObject.LEFT, 0]]),
								 new EventDialog(Strings.mchouseStrings[19], this),
								 new EventFlag("first_wakeup", 2),
								 new EventNPCWalk(npcRival, [[FlxObject.DOWN, 6]]),
								 new EventZaWarudo(0.5),
								 new EventNPCRemove(door),
								 new EventZaWarudo(0.5),
								 new EventNPCWalk(npcRival, [[FlxObject.DOWN, 1]]),
								 new EventNPCRemove(npcRival)
				];
			}
			else if (Reg.flags["first_wakeup"] == 2)  // after first talk with dad
				npcDad.events = [new EventDialog(Strings.mchouseStrings[20], this)];
		}
	}
}




