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

class FrogPond extends TownState
{

	var npcFroggo:NPC;
	var npc1:NPC;
	var npcRival:NPC;
	var npcSign1:NPC;
	var npcSign2:NPC;
	var npcSign3:NPC;
	var npcGondola:NPC;
	var _events:Map<String, Array<BaseEvent>>;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		npc1 = new NPC(336, 32, FlxObject.DOWN, 3, this, "npc 1");
		npcGondola = new NPC(0, 0, FlxObject.DOWN, 13, this, "npc gondola");
		npcSign1 = new NPC(0, 0, FlxObject.UP, 15, this, "npc sign 0");
		npcSign2 = new NPC(0, 0, FlxObject.DOWN, 15, this, "npc sign 1");
		npcSign3 = new NPC(0, 0, FlxObject.DOWN, 15, this, "npc sign 2");

		if (Reg.flags["first_froggo"] == 0)
		{
			npcFroggo = new NPC(256, 256, FlxObject.DOWN, 0, this, "npc 0");
			npcRival = new NPC(0, 0, FlxObject.DOWN, 2, this, "npc 2");
			grpNPCs.add(npcFroggo);
			grpNPCs.add(npcRival);
			npcRival.visible = false;
		}

		grpNPCs.add(npc1);
		grpNPCs.add(npcSign1);
		grpNPCs.add(npcSign2);
		grpNPCs.add(npcSign3);
		// grpNPCs.add(npcGondola);

		super.create();

		eventManager.addEvents([new EventNPCSetCanTurn(npcSign1, false),
								new EventNPCSetCanTurn(npcSign2, false),
								new EventNPCSetCanTurn(npcSign3, false)
								]);

		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();

		if (Reg.flags["save"] == 1)
			eventManager.addEvents([new EventSaveGame(2, mapName),
									new EventFlag("save", 0)]);

		npcGondola.events = [	
			new EventHealPlayer(),
			new EventBattle([new EnemyTadpole()], this),
			new EventDialog(Strings.stringArray[4], this, 
							[new MenuItemDialogChoice(Strings.stringArray[15], 
								null, new EventFlag("save", 1)),
							 new MenuItemDialogChoice(Strings.stringArray[15+1], 
							 	null, new EventFlag("save", 0))
							])
		];

		npcSign1.events = [new EventDialog(Strings.frogpondStrings[53], this)];
		npcSign2.events = [new EventDialog(Strings.frogpondStrings[54], this)];
		npcSign3.events = [new EventDialog(Strings.frogpondStrings[55], this)];

		if (Reg.flags["owl_clan_attack"] == 0)  // 0 = pre-attack
		{
			if (Reg.flags["first_froggo"] == 0)  // first meeting
			{
				npcFroggo.events = [new EventNPCAdd(npcRival, grpNPCs),
									new EventNPCWalk(npcRival, [[FlxObject.LEFT, 1], [FlxObject.UP, 0]]),
									new EventDialog(Strings.frogpondStrings[0], this),
									new EventFlag("first_froggo", 1),
									new EventNPCWalk(npcFroggo, [[FlxObject.UP, 1]]),
								 	new EventNPCRemove(npcFroggo),
								 	new EventNPCWalk(npcRival, [[FlxObject.RIGHT, 0]]),
								 	new EventNPCWalk(player, [[FlxObject.LEFT, 0]]),
									new EventDialog(Strings.frogpondStrings[6], this),
								 	new EventNPCWalk(npcRival, [[FlxObject.RIGHT, 1]]),
								 	new EventNPCRemove(npcRival)
								 	];
			}
			if (Reg.flags["frogponddun"] == 0)  // 0 = dun not done
				npc1.events = [new EventDialog(Strings.frogpondStrings[40], this)];			
			else
				npc1.events = [new EventDialog(Strings.frogpondStrings[43], this)];			
		}
		else if (Reg.flags["owl_clan_attack"] <= 2)  // 1 = post-attack
			npc1.events = [new EventDialog(Strings.frogpondStrings[47], this)];			
		else if (Reg.flags["owl_clan_attack"] >= 3)  // 3 = return to The Pond; 4 = docks; 5 = done
			npc1.events = [new EventDialog(Strings.frogpondStrings[51], this)];			
	}
}




