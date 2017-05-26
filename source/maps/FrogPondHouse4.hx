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

class FrogPondHouse4 extends TownState
{
	var npcDad:NPC;
	var npcFroggo:NPC;
	var npcRival:NPC;
	var _events:Map<String, Array<BaseEvent>>;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
		super(EntranceID, MapName, SongName, Dungeon);

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();

		if (Reg.flags["owl_clan_attack"] == 1)
			npcFroggo = new NPC(256, 256, FlxObject.RIGHT, 0, this, "npc 2");
		else if (Reg.flags["owl_clan_attack"] == 3)
			npcFroggo = new NPC(256, 256, FlxObject.RIGHT, 0, this, "npc 3");			
		else if (Reg.flags["owl_clan_attack"] != 4 && Reg.flags["owl_clan_attack"] != 5 )
			npcFroggo = new NPC(256, 256, FlxObject.DOWN, 0, this, "npc 0");
		grpNPCs.add(npcFroggo);

		if (Reg.flags["frogponddun"] == 1)  // dungeon completed
		{
			npcRival = new NPC(256, 256, FlxObject.LEFT, 2, this, "npc 1");
			grpNPCs.add(npcRival);
		}
		if (Reg.flags["owl_clan_attack"] >= 3)  // 
		{
			npcDad = new NPC(256, 256, FlxObject.LEFT, 1, this, "npc 4", true);
			grpNPCs.add(npcDad);
			npcRival = new NPC(256, 256, FlxObject.LEFT, 2, this, "npc 5", true);
			grpNPCs.add(npcRival);
		}

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();
		if (Reg.flags["frogponddun"] == 0)
			npcFroggo.events = [new EventDialog(Strings.frogpondStrings[1], this)];	
		else if (Reg.flags["frogponddun"] == 1)
			eventManager.addEvents([new EventNPCWalk(npcFroggo, [[FlxObject.LEFT, 0]]),
									new EventDialog(Strings.frogpondStrings[8], this),  // pname, over here
									new EventNPCWalk(player, [[FlxObject.RIGHT, 5], [FlxObject.DOWN, 1],
															  [FlxObject.RIGHT, 1]]),
									new EventNPCWalk(npcFroggo, [[FlxObject.DOWN, 0]]),
									new EventDialog(Strings.frogpondStrings[9], this),  // we did it, rival!
									new EventDialog(Strings.frogpondStrings[10], this),  // took you long enough, pname
									new EventDialog(Strings.frogpondStrings[11], this),  // hey, you only barely beat me
									new EventDialog(Strings.frogpondStrings[12], this),  // ahem, boys
									new EventNPCWalk(player, [[FlxObject.UP, 0]]),
									new EventNPCWalk(npcRival, [[FlxObject.UP, 0]]),
									new EventDialog(Strings.frogpondStrings[13], this),  // you won, blah blah go home
									new EventNPCWalk(player, [[FlxObject.RIGHT, 0]]),
									new EventNPCWalk(npcRival, [[FlxObject.LEFT, 0]]),
									new EventDialog(Strings.frogpondStrings[14], this),  // I can't wait to tell dad! Let's go, rival
									new EventNPCWalk(player, [[FlxObject.UP, 0]]),
									new EventDialog(Strings.frogpondStrings[15], this),  // thank you so much, froggo
									new EventNPCWalk(npcRival, [[FlxObject.UP, 0]]),
									new EventDialog(Strings.frogpondStrings[16], this),  // yeah, thanks
									new EventDialog(Strings.frogpondStrings[17], this),  // my pleasure
									new EventNPCWalk(npcRival, [[FlxObject.LEFT, 0]]),
									new EventDialog(Strings.frogpondStrings[18], this),  // let's go
									new EventNPCWalk(npcRival, [[FlxObject.LEFT, 1]]),
									new EventNPCRemove(npcRival),
									new EventFlag("frogponddun", 2)
									]);
		else if (Reg.flags["frogponddun"] == 2 && Reg.flags["owl_clan_attack"] == 0)
			npcFroggo.events = [new EventDialog(Strings.frogpondStrings[2], this)];
		else if (Reg.flags["owl_clan_attack"] == 1)  // post-attack
			eventManager.addEvents([new EventNPCWalk(player, [[FlxObject.UP, 3]]),
									new EventDialog(Strings.frogpondStrings[19], this),  // elder froggo !!!!
									new EventNPCWalk(npcFroggo, [[FlxObject.DOWN, 1], [FlxObject.LEFT, 2],
																 [FlxObject.DOWN, 0]]),
									new EventNPCWalk(player, [[FlxObject.UP, 4], [FlxObject.RIGHT, 0]]),
									new EventNPCWalk(npcFroggo, [[FlxObject.LEFT, 0]]),
									new EventDialog(Strings.frogpondStrings[20], this),  // pname, what's wrong? Why are you flustered?									
									new EventDialog(Strings.frogpondStrings[21], this),  // dad and rival got mind blasted by an owl!
									new EventDialog(Strings.frogpondStrings[22], this),  // what? an owl here? Tell me everything that happened.
									new EventDialog(Strings.frogpondStrings[23], this),  // this that and the other thing
									new EventZaWarudo(0.7),
									new EventNPCWalk(npcFroggo, [[FlxObject.DOWN, 0]]),
									new EventDialog(Strings.frogpondStrings[24], this),  // let's hurry over to your house
									new EventZaWarudo(0.3),
									new EventNPCWalk(npcFroggo, [[FlxObject.LEFT, 0]]),
									new EventDialog(Strings.frogpondStrings[25], this),  // let's hurry over to your house
									new EventNPCWalk(npcFroggo, [[FlxObject.LEFT, 1]]),
									new EventNPCRemove(npcFroggo),
									new EventFlag("owl_clan_attack", 2)
									]);		
		else if (Reg.flags["owl_clan_attack"] == 3)  // return to The Pond
		{
			eventManager.addEvents([new EventNPCWalk(npcFroggo, [[FlxObject.RIGHT, 1], [FlxObject.UP, 0]]),
									new EventZaWarudo(0.3),
									new EventDialog(Strings.frogpondStrings[26], this),  // where is it?
									new EventNPCWalk(player, [[FlxObject.UP, 3]]),
									new EventDialog(Strings.frogpondStrings[27], this),  // froggo, I'm ready
									new EventZaWarudo(0.3),
									new EventNPCWalk(npcFroggo, [[FlxObject.RIGHT, 1], [FlxObject.UP, 0]]),
									new EventNPCWalk(player, [[FlxObject.LEFT, 0]]),
									new EventZaWarudo(0.3),
									new EventDialog(Strings.frogpondStrings[28], this),  // helloooo?
									new EventNPCWalk(player, [[FlxObject.UP, 4], [FlxObject.RIGHT, 2]]),
									new EventDialog(Strings.frogpondStrings[5], this),  // helloooo?
									new EventNPCWalk(npcFroggo, [[FlxObject.LEFT, 1], [FlxObject.UP, 0]]),
									new EventZaWarudo(0.3),
									new EventDialog(Strings.frogpondStrings[29], this),  // eureka
									new EventNPCWalk(player, [[FlxObject.LEFT, 2], [FlxObject.UP, 1], [FlxObject.LEFT, 0]]),
									new EventDialog(Strings.frogpondStrings[30], this),  // oh, there he is--
									new EventNPCWalk(npcFroggo, [[FlxObject.RIGHT, 0]]),
									new EventDialog(Strings.frogpondStrings[31], this),  // great timing
									new EventNPCWalk(npcFroggo, [[FlxObject.RIGHT, 3]]),
									new EventDialog(Strings.frogpondStrings[32], this),  // take this hood
									new EventFlag("p_hood", 1),
									new EventZaWarudo(0.1),
									new EventNPCWalk(player, [[FlxObject.DOWN, 0]]),
									new EventZaWarudo(0.1),
									new EventNPCWalk(player, [[FlxObject.RIGHT, 0]]),
									new EventZaWarudo(0.1),
									new EventNPCWalk(player, [[FlxObject.UP, 0]]),
									new EventZaWarudo(0.1),
									new EventNPCWalk(player, [[FlxObject.LEFT, 0]]),
									new EventZaWarudo(0.1),
									new EventDialog(Strings.frogpondStrings[33], this),  // it fits well
									new EventDialog(Strings.frogpondStrings[34], this),  // chuh, your dad special ordered it
									new EventDialog(Strings.frogpondStrings[35], this),  // dad...
									new EventDialog(Strings.frogpondStrings[36], this),  // chin up, let's go to the docks so you can depart
									new EventNPCWalk(npcFroggo, [[FlxObject.RIGHT, 1]]),
									new EventNPCRemove(npcFroggo),
									new EventFlag("owl_clan_attack", 4)
									]);		

			var tempID = 3;
			if (Reg.flags["p_hood"] == 1)
				tempID = 4;
			npcDad.events = [new EventDialog(Strings.frogpondStrings[tempID], this)];
			npcRival.events = [new EventDialog(Strings.frogpondStrings[tempID], this)];
		}
		else if (Reg.flags["owl_clan_attack"] > 3)  // return to The Pond
		{
			var tempID = 3;
			if (Reg.flags["p_hood"] == 1)
				tempID = 4;
			npcDad.events = [new EventDialog(Strings.frogpondStrings[tempID], this)];
			npcRival.events = [new EventDialog(Strings.frogpondStrings[tempID], this)];
		}

	}
}





