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

class FrogPondHouse2 extends TownState
{

	var npc:NPC;
	var npcGondola:NPC;
	var obj0:NPC;
	var obj1:NPC;
	var obj2:NPC;
	var obj3:NPC;
	var _events:Map<String, Array<BaseEvent>>;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
		super(EntranceID, MapName, SongName, Dungeon);

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		npc = new NPC(256, 256, FlxObject.LEFT, Reg.npcs["frogman"], this, "npc 0");
		npcGondola = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["gondolagirl"], this, "npc 1");
		grpNPCs.add(npc);
		grpNPCs.add(npcGondola);
		
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

		super.create();

		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();

		obj0.events = [new EventDialog(Strings.frogpondhouse2Strings[6], this)];
		obj1.events = [new EventDialog(Strings.frogpondhouse2Strings[6], this)];
		obj2.events = [new EventDialog(Strings.frogpondhouse2Strings[6], this)];
		obj3.events = [new EventDialog(Strings.frogpondhouse2Strings[6], this)];

		// gondola
		if (Reg.flags["save"] == 1)
			eventManager.addEvents([new EventSaveGame(1, mapName),
									new EventFlag("save", 0)]);

		npcGondola.events = [	
			new EventHealPlayer(),
			new EventDialog(Strings.stringArray[4], this, 
							[new MenuItemDialogChoice(Strings.stringArray[0], 
								null, new EventFlag("save", 1)),
							 new MenuItemDialogChoice(Strings.stringArray[1], 
							 	null, new EventFlag("save", 0))
							])
		];

		if (Reg.flags["owl_clan_attack"] == 0)  // 0 = pre-attack
		{
			if (Reg.flags["frogponddun"] == 0)  // 0 = dun not done
				npc.events = [new EventDialog(Strings.frogpondhouse2Strings[0], this),
							  new EventDialog(Strings.frogpondhouse2Strings[1], this)
							 ];			
			else
				npc.events = [new EventDialog(Strings.frogpondhouse2Strings[2], this),
							  new EventDialog(Strings.frogpondhouse2Strings[3], this)
							 ];			
		}
		else if (Reg.flags["owl_clan_attack"] <= 2)  // 1 = post-attack; 2 = return home
			npc.events = [new EventDialog(Strings.frogpondhouse2Strings[4], this)];			
		else if (Reg.flags["owl_clan_attack"] >= 3)  // 3 = return to The Pond; 4 = docks; 5 = done
			npc.events = [new EventDialog(Strings.frogpondhouse2Strings[5], this)];		
	}



}




