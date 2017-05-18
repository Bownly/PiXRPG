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

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		
		if (Reg.flags["first_wakeup"] == 0)
		{
			npcRival = new NPC(48, 32, FlxObject.UP, 2, this, "npc 0");
			grpNPCs.add(npcRival);
		}
		
		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		if (Reg.flags["save"] == 1)
		{
			eventManager.addEvents([new EventSaveGame(2, mapName),
									new EventFlag("save", 0)]);
		}

		if (Reg.flags["first_wakeup"] == 0)
		{
			eventManager.addEvents([new EventDialog(Strings.mchomeStrings[0], this, 
													[new MenuItemDialogChoice(Strings.mchomeStrings[1], 
														null, new EventFlag("dummy", 1)),
													 new MenuItemDialogChoice(Strings.mchomeStrings[2], 
													 	null, new EventFlag("dummy", 1))
													]),
									new EventDialog(Strings.mchomeStrings[3], this),
									new EventDialog(Strings.mchomeStrings[4], this),
									new EventDialog(Strings.mchomeStrings[5], this),
									new EventNPCWalk(npcRival, [[FlxObject.LEFT, 6],
															[FlxObject.DOWN, 1]]),
									new EventNPCRemove(npcRival),
									new EventFlag("first_wakeup", 1)
									]);
		}
		// npc2.events = [ 
		// 	// new EventBattle([new EnemyTest()], this),
		// 	// new EventDialog(Strings.frogpondStrings[0], this)
		// 	new EventDialog(Strings.mchomeStrings[0], this),
		// 	new EventDialog(Strings.mchomeStrings[1], this),
		// 	new EventDialog(Strings.mchomeStrings[2], this),
		// 	new EventDialog(Strings.mchomeStrings[3], this),
		// 	new EventDialog(Strings.mchomeStrings[4], this),
		// 	new EventDialog(Strings.mchomeStrings[5], this),
		// 	new EventDialog(Strings.mchomeStrings[6], this),
		// 	new EventDialog(Strings.mchomeStrings[7], this)
		// ];
		
		// npc3.events = [	
		// 	// new EventDialog(Strings.stringArray[30], this),
		// 	// new EventDialog(Strings.stringArray[31], this),
		// 	new EventHealPlayer(),
		// 	new EventDialog(Strings.stringArray[12], this, 
		// 					[new MenuItemDialogChoice(Strings.stringArray[13], 
		// 						null, new EventFlag("save", 1)),
		// 					 new MenuItemDialogChoice(Strings.stringArray[14], 
		// 					 	null, new EventFlag("save", 0))
		// 					])
		// ];
		
	}
}




