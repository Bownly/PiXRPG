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
	var npc_gondola:NPC;
	var _events:Map<String, Array<BaseEvent>>;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
		super(EntranceID, MapName, SongName, Dungeon);

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		npc = new NPC(256, 256, FlxObject.LEFT, 3, this, "npc 0");
		npc_gondola = new NPC(0, 0, FlxObject.DOWN, 13, this, "npc 1");
		grpNPCs.add(npc);
		grpNPCs.add(npc_gondola);
		super.create();

		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();

		// gondola
		if (Reg.flags["save"] == 1)
			eventManager.addEvents([new EventSaveGame(2, mapName),
									new EventFlag("save", 0)]);
		npc_gondola.events = [	
			new EventHealPlayer(),
			new EventDialog(Strings.stringArray[12], this, 
							[new MenuItemDialogChoice(Strings.stringArray[13], 
								null, new EventFlag("save", 1)),
							 new MenuItemDialogChoice(Strings.stringArray[14], 
							 	null, new EventFlag("save", 0))
							])
		];

		// npc 1
		// if (Reg.flags["owl_clan_attack"] == 0)  // pre-attack
		// 	npc.events = [new EventDialog(Strings.frogpondStrings[2], this)];
		// else if (Reg.flags["owl_clan_attack"] == 1)  // post-attack
		// 	npc.events = [new EventDialog(Strings.frogpondStrings[6], this)];
		// else if (Reg.flags["owl_clan_attack"] == 3)  // return to The Pond
		// 	npc.events = [new EventDialog(Strings.frogpondStrings[14], this)];
		npc.events = [new EventDialog(Strings.frogpondStrings[4], this)];

	}



}




