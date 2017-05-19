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
	var npcSign:NPC;
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
		npcSign = new NPC(0, 0, FlxObject.DOWN, 15, this, "npc 3");

		if (Reg.flags["first_froggo"] == 0)
		{
			npcFroggo = new NPC(256, 256, FlxObject.DOWN, 0, this, "npc 0");
			npcRival = new NPC(0, 0, FlxObject.DOWN, 2, this, "npc 2");
			grpNPCs.add(npcFroggo);
			grpNPCs.add(npcRival);
			npcRival.visible = false;
		}
		grpNPCs.add(npc1);
		grpNPCs.add(npcSign);
		grpNPCs.add(npcGondola);

		super.create();

		initializeEvents();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();
		// initializeEvents();

		if (Reg.flags["save"] == 1)
			eventManager.addEvents([new EventSaveGame(2, mapName),
									new EventFlag("save", 0)]);

		npcGondola.events = [	
			new EventHealPlayer(),
			new EventBattle([new EnemyOwl()], this),
			new EventDialog(Strings.stringArray[12], this, 
							[new MenuItemDialogChoice(Strings.stringArray[13], 
								null, new EventFlag("save", 1)),
							 new MenuItemDialogChoice(Strings.stringArray[14], 
							 	null, new EventFlag("save", 0))
							])
		];

		npcSign.events = [new EventDialog(Strings.frogpondStrings[7], this)];

		if (Reg.flags["owl_clan_attack"] == 0)  // pre-attack
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
			npc1.events = [new EventDialog(Strings.frogpondStrings[5], this)];
		}
		else if (Reg.flags["owl_clan_attack"] == 1)  // post-attack
			npc1.events = [new EventDialog(Strings.frogpondStrings[7], this)];			
		else if (Reg.flags["owl_clan_attack"] == 3)  // return to The Pond
			npc1.events = [new EventDialog(Strings.frogpondStrings[13], this)];			


	}


	public function initializeEvents():Void
	{
		_events = [

			"fight_dummy" => [new EventDialog(Strings.stringArray[17], this),
							new EventBattle([new EnemyTest()], this),
							new EventFlag("fight_dummy", 0)],
	
			"reject_dummy" => [new EventDialog(Strings.stringArray[18], this),
								new EventFlag("fight_dummy", 0)],

			"talk_to_dummy" => [new EventDialog(Strings.stringArray[10], this,
												[new MenuItemDialogChoice(Strings.stringArray[15], null, 
																		new EventFlag("fight_dummy", 1)),
												new MenuItemDialogChoice(Strings.stringArray[16], null, 
																		new EventFlag("fight_dummy", -1))
												])]
		];
	}

}




