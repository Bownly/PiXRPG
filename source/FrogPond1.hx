package;

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

class FrogPond1 extends TownState
{

	var npc1:NPC;
	var npc2:NPC;
	var npc3:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		
		if (Reg.flags["first_wakeup"] == 0)
		{
			npc1 = new NPC(32, 32, FlxObject.RIGHT, 3, this, "rival");
			// grpNPCs.add(npc1);
		}
		
		npc2 = new NPC(32, 32, FlxObject.DOWN, 4, this, "");
		grpNPCs.add(npc2);	

		npc3 = new NPC(48, 48, FlxObject.DOWN, 3, this, "");
		grpNPCs.add(npc3);
		
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
				// eventManager.addEvents([new EventDialog(Strings.stringArray[0], this),
				// 						new EventNPCWalk(npc1, [[FlxObject.LEFT, 6],
				// 												[FlxObject.DOWN, 0]]),
				// 						new EventNPCRemove(npc1),
				// 						new EventFlag("first_wakeup", 1)
				// 						]);

				npc2.events = [ 
					new EventBattle([new EnemyTest()], this),
					new EventDialog(Strings.stringArray[22], this),
					new EventDialog(Strings.stringArray[23], this),
					new EventDialog(Strings.stringArray[24], this),
					new EventDialog(Strings.stringArray[25], this),
					new EventDialog(Strings.stringArray[26], this),
					new EventDialog(Strings.stringArray[27], this),
					new EventDialog(Strings.stringArray[28], this),
					new EventDialog(Strings.stringArray[29], this)
				];
				
				npc3.events = [	
					new EventDialog(Strings.stringArray[30], this),
					new EventDialog(Strings.stringArray[31], this),
					new EventDialog(Strings.stringArray[12], this, 
									[new MenuItemDialogChoice(Strings.stringArray[13], 
										null, new EventFlag("save", 1)),
									 new MenuItemDialogChoice(Strings.stringArray[14], 
									 	null, new EventFlag("save", 0))
									]),
			
				];

		}
		
	}
}




