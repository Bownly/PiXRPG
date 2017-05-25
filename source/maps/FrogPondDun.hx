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
		npclazy = new NPC(0, 0, FlxObject.UP, 3, this, "npc 1");
		grpNPCs.add(dummy);
		grpNPCs.add(npclazy);

		chest5 = new Chest(0, 0, this, "frogpond_chest5");
		grpNPCs.add(chest5);
		

		if (Reg.flags["frogpond_door5"] == 0)
		{
			door5 = new NPC(0, 0, FlxObject.DOWN, 9, this, "frogpond_door5");
			grpNPCs.add(door5);
		}
		if (Reg.flags["frogpond_door6"] == 0)
		{
			door6 = new NPC(0, 0, FlxObject.DOWN, 9, this, "frogpond_door6");
			grpNPCs.add(door6);
		}
		if (Reg.flags["frogpond_door7"] == 0)
		{
			door7 = new NPC(0, 0, FlxObject.DOWN, 9, this, "frogpond_door7");
			grpNPCs.add(door7);
		}

		super.create();

		eventManager.addEvents([new EventNPCSetCanTurn(dummy, false),
								new EventNPCSetCanTurn(npclazy, false)
								]);

		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		npclazy.events = [ new EventDialog(Strings.frogponddunStrings[16], this)];


		if (Reg.flags["frogpond_chest5"] == 0)
		{
			chest5.events = [new EventStringVarChange("%item%", "Pond Scum"),
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

		var _hood:Int = Reg.flags["p_hood"];
		
		// secret boss fight blocks
		if (Reg.flags["dummy_prizes"] == 1)
		{
			eventManager.addEvents([new EventDialog(Strings.frogponddunStrings[25], this),
									new EventUnlockPen(4),
									new EventStringVarChange("%item%", "PiXcalibur"),
							 		new EventDialog(Strings.inventoryStrings[_hood], this),
									new EventFlag("dummy_prizes", 2),
									]);
		}
		else if (Reg.flags["dummy_prizes"] == 3)
		{
			eventManager.addEvents([new EventDialog(Strings.frogponddunStrings[26], this),
									new EventStringVarChange("%item%", "Pond Scum"),
							 		new EventDialog(Strings.inventoryStrings[_hood], this),
									new EventFlag("dummy_prizes", 4),
									]);			
		}
		else if (Reg.flags["dummy_prizes"] == 5)
		{
			eventManager.addEvents([new EventDialog(Strings.frogponddunStrings[27], this),
									new EventStringVarChange("%item%", "Pond Scum"),
							 		new EventDialog(Strings.inventoryStrings[_hood], this),
									new EventFlag("dummy_prizes", 6),
									]);			
		}
		else if (Reg.flags["dummy_prizes"] == 7)
		{
			eventManager.addEvents([new EventDialog(Strings.frogponddunStrings[28], this),
									new EventFlag("dummy_prizes", 6),
									]);			
		}
		if (Reg.flags["owl_clan_attack"] == 5 && Reg.flags["fight_dummy"] == 0)
			dummy.events = [new EventDialog(Strings.frogponddunStrings[22], this,
											[new MenuItemDialogChoice(Strings.frogponddunStrings[29+_hood], null, 
																	new EventFlag("fight_dummy", 2)),
											 new MenuItemDialogChoice(Strings.frogponddunStrings[31+_hood], null, 
																	new EventFlag("fight_dummy", -2))
											 ])
					   	   ];
		else if (Reg.flags["fight_dummy"] == 2)  // if you agreed to fight him
			eventManager.addEvents([new EventDialog(Strings.frogponddunStrings[23], this),
									new EventBattle([new EnemyDummyBoss()], this, "dummy_prizes", Reg.flags["dummy_prizes"]+1),
									new EventFlag("fight_dummy", 0),
									]);
		else if (Reg.flags["fight_dummy"] == -2)  // if you reject his battle proposition
			eventManager.addEvents([new EventDialog(Strings.frogponddunStrings[24], this),
									new EventFlag("fight_dummy", 0)]);


		// normal, non secret boss fight, stuff
		else if (Reg.flags["fight_dummy"] == 0)		
			dummy.events = [new EventDialog(Strings.frogponddunStrings[0], this,
											[new MenuItemDialogChoice(Strings.frogponddunStrings[29+_hood], null, 
																	new EventFlag("fight_dummy", 1)),
											 new MenuItemDialogChoice(Strings.frogponddunStrings[31+_hood], null, 
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




