package;

import flixel.FlxObject;
import flixel.group.FlxGroup;

import DialogClasses;
import EventClasses;

import MenuClasses;

/**
 * ...
 * @author Bownly
 */

class FrogPond1 extends TownState
{

	var npc1:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);

	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		
		if (Reg.flags["first_wakeup"] == 0)
		{
			npc1 = new NPC(32, 32, 1, 2, this, "22real");
			grpNPCs.add(npc1);
		}

		super.create();


		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		if (Reg.flags["AorB"] == 1)
		{
			eventManager.addEvent(new EventDialog(new DialogBox(Strings.stringArray[6]), this));
			eventManager.addEvent(new EventFlag("AorB", 0));
		}
		else if (Reg.flags["AorB"] == -1)
		{
			eventManager.addEvent(new EventDialog(new DialogBox(Strings.stringArray[7]), this));
			eventManager.addEvent(new EventFlag("AorB", 0));
		}

		else if (Reg.flags["first_wakeup"] == 0)
		{
			npc1.events = [	
			// new EventDialog(new DialogBox(Strings.stringArray[0]), this),
			new EventBattle([0, 1, 2], this),
			new EventDialog(new DialogBox(Strings.stringArray[5], 
										[new MenuItemFlag("A", 0, null, new EventFlag("AorB", 1)),
										 new MenuItemFlag("B", 0, null, new EventFlag("AorB", -1, this))]),
							this),
			// new EventWalk(npc1, [[FlxObject.DOWN, 1], [-1, -1]])];
			new EventWalk(npc1, [[FlxObject.DOWN, 1]])
			// new EventFlag("first_wakeup", 1)
			];
		}
		
	}
}




