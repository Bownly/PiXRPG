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
	var obj0:NPC;
	var obj1:NPC;
	var obj2:NPC;
	var obj3:NPC;
	var _arrObjs:Array<NPC> = new Array<NPC>();
	var _events:Map<String, Array<BaseEvent>>;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
		super(EntranceID, MapName, SongName, Dungeon);

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();

		for (o in 0...10)
		{
			var obj = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "obj " + o);
			obj.setCanTurn(false);
			grpNPCs.add(obj);
			_arrObjs.push(obj);
		}

		if (Reg.flags["owl_clan_attack"] == 1)
		{
			npcFroggo = new NPC(256, 256, FlxObject.RIGHT, Reg.npcs["froggo"], this, "npc 2");
			grpNPCs.add(npcFroggo);
		}
		else if (Reg.flags["owl_clan_attack"] == 3)
		{
			npcFroggo = new NPC(256, 256, FlxObject.RIGHT, Reg.npcs["froggo"], this, "npc 3");			
			grpNPCs.add(npcFroggo);			
		}
		else if (Reg.flags["owl_clan_attack"] != 4 && Reg.flags["owl_clan_attack"] != 5 && Reg.flags["owl_clan_attack"] != 2)
		{
			npcFroggo = new NPC(256, 256, FlxObject.DOWN, Reg.npcs["froggo"], this, "npc 0");
			grpNPCs.add(npcFroggo);			
		}	


		if (Reg.flags["frogponddun"] == 1)  // dungeon completed
		{
			npcRival = new NPC(256, 256, FlxObject.LEFT, Reg.npcs["rival"], this, "npc 1");
			grpNPCs.add(npcRival);
		}
		if (Reg.flags["owl_clan_attack"] >= 3)  // 
		{
			npcDad = new NPC(256, 256, FlxObject.LEFT, Reg.npcs["dad"], this, "npc 4", true);
			grpNPCs.add(npcDad);
			npcRival = new NPC(256, 256, FlxObject.LEFT, Reg.npcs["rival"], this, "npc 5", true);
			grpNPCs.add(npcRival);
			obj0 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "obj 10");
			obj1 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "obj 11");
			obj2 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "obj 12");
			obj3 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "obj 13");
			obj0.setCanTurn(false);
			obj1.setCanTurn(false);
			obj2.setCanTurn(false);
			obj3.setCanTurn(false);
			grpNPCs.add(obj0);
			grpNPCs.add(obj1);
			grpNPCs.add(obj2);
			grpNPCs.add(obj3);
		}

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();

		for (obj in 0...10)
			// 33 is the starting index of the strings
			_arrObjs[obj].events = [new EventDialog(Strings.frogpondhouse4Strings[obj+33], this)];

		if (Reg.flags["frogponddun"] == 0)
			npcFroggo.events = [new EventDialog(Strings.frogpondhouse4Strings[0], this)];	
		else if (Reg.flags["frogponddun"] == 1)
			eventManager.addEvents([new EventNPCWalk([npcFroggo], [[[FlxObject.LEFT, 0]]]),
									new EventDialog(Strings.frogpondhouse4Strings[1], this),  // pname, over here
									new EventNPCWalk([player], [[[FlxObject.RIGHT, 5], [FlxObject.DOWN, 1],
																								  [FlxObject.RIGHT, 1]]]),
									new EventNPCWalk([npcFroggo], [[[FlxObject.DOWN, 0]]]),
									new EventDialog(Strings.frogpondhouse4Strings[2], this),  // we did it, rival!
									new EventDialog(Strings.frogpondhouse4Strings[3], this),  // took you long enough, pname
									new EventDialog(Strings.frogpondhouse4Strings[4], this),  // hey, you only barely beat me
									new EventDialog(Strings.frogpondhouse4Strings[5], this),  // ahem, boys
									new EventNPCWalk([player], [[[FlxObject.UP, 0]]]),
									new EventNPCWalk([npcRival], [[[FlxObject.UP, 0]]]),
									new EventDialog(Strings.frogpondhouse4Strings[6], this),  // you won, blah blah go home
									new EventNPCWalk([player], [[[FlxObject.RIGHT, 0]]]),
									new EventNPCWalk([npcRival], [[[FlxObject.LEFT, 0]]]),
									new EventDialog(Strings.frogpondhouse4Strings[7], this),  // I can't wait to tell dad! Let's go, rival
									new EventNPCWalk([player], [[[FlxObject.UP, 0]]]),
									new EventDialog(Strings.frogpondhouse4Strings[8], this),  // thank you so much, froggo
									new EventNPCWalk([npcRival], [[[FlxObject.UP, 0]]]),
									new EventDialog(Strings.frogpondhouse4Strings[9], this),  // yeah, thanks
									new EventDialog(Strings.frogpondhouse4Strings[10], this),  // my pleasure
									new EventNPCWalk([npcRival], [[[FlxObject.LEFT, 0]]]),
									new EventDialog(Strings.frogpondhouse4Strings[11], this),  // let's go
									new EventNPCWalk([npcRival], [[[FlxObject.LEFT, 1]]]),
									new EventNPCRemove(npcRival),
									new EventFlag("frogponddun", 2)
									]);
		else if (Reg.flags["frogponddun"] == 2 && Reg.flags["owl_clan_attack"] == 0)
			npcFroggo.events = [new EventDialog(Strings.frogpondhouse4Strings[12], this)];
		else if (Reg.flags["owl_clan_attack"] == 1)  // post-attack
			eventManager.addEvents([new EventNPCWalk([player], [[[FlxObject.UP, 3]]]),
									new EventDialog(Strings.frogpondhouse4Strings[13], this),  // elder froggo !!!!
									new EventNPCWalk([npcFroggo], [[[FlxObject.DOWN, 1], [FlxObject.LEFT, 2],
																									 [FlxObject.DOWN, 0]]]),
									new EventNPCWalk([player], [[[FlxObject.UP, 4], [FlxObject.RIGHT, 0]]]),
									new EventNPCWalk([npcFroggo], [[[FlxObject.LEFT, 0]]]),
									new EventDialog(Strings.frogpondhouse4Strings[14], this),  // pname, what's wrong? Why are you flustered?									
									new EventDialog(Strings.frogpondhouse4Strings[15], this),  // dad and rival got mind blasted by an owl!
									new EventDialog(Strings.frogpondhouse4Strings[16], this),  // what? an owl here? Tell me everything that happened.
									new EventDialog(Strings.frogpondhouse4Strings[17], this),  // this that and the other thing
									new EventZaWarudo(0.7),
									new EventNPCWalk([npcFroggo], [[[FlxObject.DOWN, 0]]]),
									new EventDialog(Strings.frogpondhouse4Strings[18], this),  // let's hurry over to your house
									new EventZaWarudo(0.3),
									new EventNPCWalk([npcFroggo], [[[FlxObject.LEFT, 0]]]),
									new EventDialog(Strings.frogpondhouse4Strings[19], this),  // let's hurry over to your house
									new EventNPCWalk([npcFroggo], [[[FlxObject.LEFT, 1]]]),
									new EventNPCRemove(npcFroggo),
									new EventFlag("owl_clan_attack", 2)
									]);		
		else if (Reg.flags["owl_clan_attack"] == 3)  // return to The Pond
		{
			eventManager.addEvents([new EventNPCWalk([npcFroggo], [[[FlxObject.RIGHT, 1], [FlxObject.UP, 0]]]),
									new EventZaWarudo(0.3),
									new EventDialog(Strings.frogpondhouse4Strings[21], this),  // where is it?
									new EventNPCWalk([player], [[[FlxObject.UP, 3]]]),
									new EventDialog(Strings.frogpondhouse4Strings[22], this),  // froggo, I'm ready
									new EventZaWarudo(0.3),
									new EventNPCWalk([npcFroggo], [[[FlxObject.RIGHT, 1], [FlxObject.UP, 0]]]),
									new EventNPCWalk([player], [[[FlxObject.LEFT, 0]]]),
									new EventZaWarudo(0.3),
									new EventDialog(Strings.frogpondhouse4Strings[23], this),  // helloooo?
									new EventNPCWalk([player], [[[FlxObject.UP, 4], [FlxObject.RIGHT, 2]]]),
									new EventDialog(Strings.frogpondhouse4Strings[24], this),  // helloooo?
									new EventNPCWalk([npcFroggo], [[[FlxObject.LEFT, 1], [FlxObject.UP, 0]]]),
									new EventZaWarudo(0.3),
									new EventDialog(Strings.frogpondhouse4Strings[25], this),  // eureka
									new EventNPCWalk([player], [[[FlxObject.LEFT, 2], [FlxObject.UP, 1], [FlxObject.LEFT, 0]]]),
									new EventDialog(Strings.frogpondhouse4Strings[26], this),  // oh, there he is--
									new EventNPCWalk([npcFroggo], [[[FlxObject.RIGHT, 0]]]),
									new EventDialog(Strings.frogpondhouse4Strings[27], this),  // great timing
									new EventNPCWalk([npcFroggo], [[[FlxObject.RIGHT, 3]]]),
									new EventDialog(Strings.frogpondhouse4Strings[28], this),  // take this hood
									new EventFlag("p_hood", 1),
									new EventZaWarudo(0.1),
									new EventSFXPlay("lvl"),
									new EventNPCWalk([player], [[[FlxObject.DOWN, 0]]]),
									new EventZaWarudo(0.1),
									new EventNPCWalk([player], [[[FlxObject.RIGHT, 0]]]),
									new EventZaWarudo(0.1),
									new EventNPCWalk([player], [[[FlxObject.UP, 0]]]),
									new EventZaWarudo(0.1),
									new EventNPCWalk([player], [[[FlxObject.LEFT, 0]]]),
									new EventZaWarudo(0.1),
									new EventDialog(Strings.frogpondhouse4Strings[29], this),  // it fits well
									new EventDialog(Strings.frogpondhouse4Strings[30], this),  // chuh, your dad special ordered it
									new EventDialog(Strings.frogpondhouse4Strings[31], this),  // dad...
									new EventDialog(Strings.frogpondhouse4Strings[32], this),  // chin up, let's go to the docks so you can depart
									new EventNPCWalk([npcFroggo], [[[FlxObject.RIGHT, 1]]]),
									new EventNPCRemove(npcFroggo),
									new EventFlag("owl_clan_attack", 4)
									]);		

			obj0.events = [new EventDialog(Strings.frogpondhouse4Strings[20], this)];
			obj1.events = [new EventDialog(Strings.frogpondhouse4Strings[20], this)];
			obj2.events = [new EventDialog(Strings.frogpondhouse4Strings[20], this)];
			obj3.events = [new EventDialog(Strings.frogpondhouse4Strings[20], this)];
		}
		else if (Reg.flags["owl_clan_attack"] > 3)  // return to The Pond
		{
			obj0.events = [new EventDialog(Strings.frogpondhouse4Strings[20], this)];
			obj1.events = [new EventDialog(Strings.frogpondhouse4Strings[20], this)];
			obj2.events = [new EventDialog(Strings.frogpondhouse4Strings[20], this)];
			obj3.events = [new EventDialog(Strings.frogpondhouse4Strings[20], this)];
		}

	}
}





