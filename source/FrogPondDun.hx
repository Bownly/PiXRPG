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

class FrogPondDun extends TownState
{
	var chest1:Chest;
	var chest2:Chest;
	var chest3:Chest;
	var door1:NPC;
	var door2:NPC;
	var door3:NPC;
	var npcia:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		
		npcia = new NPC(32, 32, FlxObject.DOWN, 1, this, "cia");
		grpNPCs.add(npcia);

		chest1 = new Chest(224, 224, this, "frogpond_chest1");
		chest2 = new Chest(240, 240, this, "frogpond_chest2");
		grpNPCs.add(chest1);
		grpNPCs.add(chest2);
		

		if (Reg.flags["frogpond_door1"] == 0)
		{
			door1 = new NPC(224, 224, FlxObject.DOWN, 7, this, "frogpond_door1");
			grpNPCs.add(door1);
		}
		if (Reg.flags["frogpond_door2"] == 0)
		{
			door2 = new NPC(224, 224, FlxObject.DOWN, 7, this, "frogpond_door2");
			grpNPCs.add(door2);
		}
		if (Reg.flags["frogpond_door3"] == 0)
		{
			door3 = new NPC(224, 224, FlxObject.DOWN, 7, this, "frogpond_door3");
			grpNPCs.add(door3);
		}

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		npcia.events = [new EventDialog(Strings.stringArray[21], this)];

		if (Reg.flags["frogpond_chest1"] == 0)
		{
			chest1.events = [new EventCurItemChange("potion"),
							new EventDialog(Strings.stringArray[14], this),
							new EventItemGet(new ItemClasses.ItemHealing("potion", "heal 42 MP", 9, 42)),
							new EventFlag("frogpond_chest1", 1),
							new EventNPCTrigger(chest1, -1)
							];
		}

		if (Reg.flags["frogpond_chest2"] == 0)
		{
			chest2.events = [new EventCurItemChange("69 potion"),
							new EventDialog(Strings.stringArray[14], this),
							new EventItemGet(new ItemClasses.ItemHealing("69 potion", "heal 69 MP", 9, 69)),
							new EventFlag("frogpond_chest2", 1),
							new EventNPCTrigger(chest2, -1)
							];
		}

		// door 1 block
		if (Reg.flags["frogpond_door1"] == 0)
			door1.events = [new EventDialog(Strings.stringArray[13], this),
							new EventFlag("tutorial_battle", 1),
							new EventBattle([new EnemyDoor()], this, "frogpond_door1", 1)
							// new EventFlag("frogpond_door1", 1)
							];
		else if (Reg.flags["frogpond_door1"] == 1) 
		{
			eventManager.addEvents([new EventNPCRemove(door1)]);
			eventManager.addEvents([new EventFlag("frogpond_door1", 2)]);
		}
		else if (door1 != null && door1.visible == true)
			eventManager.addEvents([new EventNPCRemove(door1)]);


		if (Reg.flags["frogpond_door2"] == 0)
		{
			door2.events = [new EventDialog(Strings.stringArray[15], this),
							new EventNPCRemove(door2),
							new EventFlag("frogpond_door2", 1)
							];
		}

		if (Reg.flags["frogpond_door3"] == 0)
		{
			door3.events = [new EventDialog(Strings.stringArray[14], this),
							new EventNPCRemove(door3),
							new EventFlag("frogpond_door3", 1)
							];
		}
	}
}




