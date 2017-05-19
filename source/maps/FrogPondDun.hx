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

class FrogPondDun extends TownState
{
	var chest5:Chest;
	var door5:NPC;
	var door6:NPC;
	var door7:NPC;
	var npclazy:NPC;
	var dummy:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		
		dummy = new NPC(0, 0, FlxObject.DOWN, 8, this, "npc 0");
		npclazy = new NPC(0, 0, FlxObject.UP, 1, this, "npc 1");
		grpNPCs.add(dummy);
		grpNPCs.add(npclazy);

		chest5 = new Chest(0, 0, this, "frogpond_chest5");
		grpNPCs.add(chest5);
		

		if (Reg.flags["frogpond_door5"] == 0)
		{
			door5 = new NPC(0, 0, FlxObject.DOWN, 9, this, "door5");
			grpNPCs.add(door5);
		}
		if (Reg.flags["frogpond_door6"] == 0)
		{
			door6 = new NPC(0, 0, FlxObject.DOWN, 9, this, "door6");
			grpNPCs.add(door6);
		}
		if (Reg.flags["frogpond_door7"] == 0)
		{
			door7 = new NPC(0, 0, FlxObject.DOWN, 9, this, "door7");
			grpNPCs.add(door7);
		}

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		npclazy.events = [ new EventDialog(Strings.frogponddunStrings[16], this)];


		if (Reg.flags["frogpond_chest5"] == 0)
		{
			chest5.events = [new EventCurItemChange("Pond Scum"),
							new EventDialog(Strings.inventoryStrings[0], this),
							new EventItemGet(new ItemClasses.ItemHealing("Pond Scum", "Relax, it's the name of a popular sports drink. It's not only tasty, but it also fully restores MP.", 9, 999)),
							new EventFlag("frogpond_chest5", 1),
							new EventNPCTrigger(chest5, 0)
							];
		}

		// door 5 block
		if (Reg.flags["frogpond_door5"] == 0)
			door5.events = [new EventDialog(Strings.frogponddunStrings[6], this),
							new EventBattle([new EnemyDoor()], this, "frogpond_door5", 1)
							];
		else if (Reg.flags["frogpond_door5"] == 1) 
		{
			eventManager.addEvents([new EventNPCRemove(door5)]);
			eventManager.addEvents([new EventFlag("frogpond_door5", 2)]);
		}

		// door 6 block
		if (Reg.flags["frogpond_door6"] == 0)
			door6.events = [new EventDialog(Strings.frogponddunStrings[8], this),
							new EventBattle([new EnemyDoor()], this, "frogpond_door6", 1)
							];
		else if (Reg.flags["frogpond_door6"] == 1) 
		{
			eventManager.addEvents([new EventNPCRemove(door6)]);
			eventManager.addEvents([new EventFlag("frogpond_door6", 2)]);
		}		

		// door 7 block
		if (Reg.flags["frogpond_door7"] == 0)
			door7.events = [new EventDialog(Strings.frogponddunStrings[7], this),
							new EventBattle([new EnemyDoor()], this, "frogpond_door7", 1)
							];
		else if (Reg.flags["frogpond_door7"] == 1) 
		{
			eventManager.addEvents([new EventNPCRemove(door7)]);
			eventManager.addEvents([new EventFlag("frogpond_door7", 2)]);
		}

		// dummy fight flags for easy copy/pasting later	
		if (Reg.flags["fight_dummy"] == 0)		
			dummy.events = [new EventDialog(Strings.frogponddunStrings[0], this,
											[new MenuItemDialogChoice(Strings.frogponddunStrings[1], null, 
																	new EventFlag("fight_dummy", 1)),
											 new MenuItemDialogChoice(Strings.frogponddunStrings[2], null, 
																	new EventFlag("fight_dummy", -1))
											 ])
					   	   ];
		else if (Reg.flags["fight_dummy"] == 1)  // if you agreed to fight him
			eventManager.addEvents([new EventFlag("tutorial_battle", 1),
									new EventDialog(Strings.frogponddunStrings[3], this),
									new EventBattle([new EnemyTest()], this),
									new EventFlag("fight_dummy", 0),
									]);
		else if (Reg.flags["fight_dummy"] == -1)  // if you reject his battle proposition
			eventManager.addEvents([new EventDialog(Strings.frogponddunStrings[4], this),
									new EventFlag("fight_dummy", 0)]);

	}
							
}




