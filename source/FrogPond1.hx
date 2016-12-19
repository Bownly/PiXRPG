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
			npc1 = new NPC(32, 32, FlxObject.DOWN, 4, this, "22real");
			grpNPCs.add(npc1);
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
		if (Reg.flags["AorB"] == 1)
		{
			eventManager.addEvents([new EventDialog(Strings.stringArray[18], this)]);
			eventManager.addEvents([new EventFlag("AorB", 0)]);
		}
		else if (Reg.flags["AorB"] == -1)
		{
			eventManager.addEvents([new EventDialog(Strings.stringArray[19], this)]);
			eventManager.addEvents([new EventFlag("AorB", 0)]);
		}

		else if (Reg.flags["first_wakeup"] == 0)
		{
				npc2.events = [new EventDialog(Strings.stringArray[20], this)];
				
				npc1.events = [	
				new EventDialog(Strings.stringArray[4], this, 
											[new MenuItemDialogChoice(Strings.stringArray[12], 
												null, new EventFlag("AorB", -1, this)),
											 new MenuItemDialogChoice(Strings.stringArray[13], 
											 	null, new EventFlag("AorB", 1)),
											 new MenuItemDialogChoice(Strings.stringArray[14], 
											 	null, new EventFlag("AorB", -1, this)),
											 new MenuItemDialogChoice(Strings.stringArray[15], 
											 	null, new EventFlag("AorB", -1, this)),
											 new MenuItemDialogChoice(Strings.stringArray[16], 
											 	null, new EventFlag("AorB", -1, this))
											]),
				new EventWalk(npc1, [[FlxObject.DOWN, 1]]),
				new EventNPCRemove(npc1),
				new EventFlag("first_wakeup", 1)
			];

		}
		
	}
}




