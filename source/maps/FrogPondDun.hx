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
	var obj0:NPC;
	var chest5:Chest;
	var door5:NPC;
	var door6:NPC;
	var door7:NPC;
	var npclazy:NPC;
	var npcRival:NPC;
	var dummy:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "cavesong";
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		
		dummy = new NPC(0, 0, FlxObject.DOWN, 8, this, "npc 0");
		npclazy = new NPC(0, 0, FlxObject.UP, 3, this, "npc 1");
		grpNPCs.add(dummy);
		grpNPCs.add(npclazy);

		chest5 = new Chest(0, 0, FlxObject.UP, this, "frogpond_chest5");
		grpNPCs.add(chest5);
		
		obj0 = new NPC(0, 0, FlxObject.RIGHT, 8, this, "obj 0");
		obj0.events = [new EventDialog(Strings.mchouseStrings[1], this)];
		obj0.setCanTurn(false);
		grpNPCs.add(obj0);

		if (Reg.flags["first_froggo"] == 1)
		{
			npcRival = new NPC(0, 0, FlxObject.LEFT, 2, this, "npc 2");
			// npcRival.visible = false;
			grpNPCs.add(npcRival);
		}

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

		npclazy.events = [new EventDialog(Strings.frogponddunStrings[16], this)];
		obj0.events = [new EventDialog(Strings.frogponddunStrings[21], this)];

		if (Reg.flags["first_froggo"] == 1)
		{
			eventManager.addEvents([new EventNPCWalk(npcRival, [[FlxObject.LEFT, 1], [FlxObject.RIGHT, 0]]),
									new EventNPCWalk(player, [[FlxObject.LEFT, 0]]),
									new EventFlag("first_froggo", 2),
									new EventNPCAdd(npcRival, grpNPCs),
									new EventDialog(Strings.frogponddunStrings[34], this),
									new EventNPCWalk(npcRival, [[FlxObject.LEFT, 1], [FlxObject.UP, 12]]),
									new EventNPCRemove(npcRival)
									]);

		}

		if (Reg.flags["frogpond_chest5"] == 0)
		{
			chest5.events = [new EventStringVarChange("%item%", "Pond Scum"),
							 new EventDialog(Strings.inventoryStrings[0], this),
							 new EventItemGet(new ItemClasses.ItemHealing("Pond Scum", Strings.itemDescriptions["Pond Scum"], 9, 999)),
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
		
		// secret boss fight blocks
		if (Reg.flags["dummy_prizes"] == 1)
		{
			eventManager.addEvents([new EventDialog(Strings.frogponddunStrings[25], this),
									new EventUnlockPen(4),
									new EventStringVarChange("%item%", "PiXcalibur"),
							 		new EventDialog(Strings.inventoryStrings[0], this),
									new EventFlag("dummy_prizes", 2),
									]);
		}
		else if (Reg.flags["dummy_prizes"] == 3)
		{
			eventManager.addEvents([new EventDialog(Strings.frogponddunStrings[26], this),
									new EventStringVarChange("%item%", "Pond Scum"),
							 		new EventDialog(Strings.inventoryStrings[0], this),
									new EventFlag("dummy_prizes", 4),
									]);			
		}
		else if (Reg.flags["dummy_prizes"] == 5)
		{
			eventManager.addEvents([new EventDialog(Strings.frogponddunStrings[27], this),
									new EventStringVarChange("%item%", "Pond Scum"),
							 		new EventDialog(Strings.inventoryStrings[0], this),
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
											[new MenuItemDialogChoice(Strings.frogponddunStrings[29], null, 
																	new EventFlag("fight_dummy", 2)),
											 new MenuItemDialogChoice(Strings.frogponddunStrings[31], null, 
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
											[new MenuItemDialogChoice(Strings.frogponddunStrings[29], null, 
																	new EventFlag("fight_dummy", 1)),
											 new MenuItemDialogChoice(Strings.frogponddunStrings[31], null, 
																	new EventFlag("fight_dummy", -1))
											 ])
					   	   ];
		else if (Reg.flags["fight_dummy"] == 1)  // if you agreed to fight him
			eventManager.addEvents([new EventDialog(Strings.frogponddunStrings[3], this),
									new EventFlag("tutorial_battle", 1),
									new EventBattle([new EnemyTest()], this, "tutorial_battle", 0),
									new EventFlag("fight_dummy", 0),
									]);
		else if (Reg.flags["fight_dummy"] == -1)  // if you reject his battle proposition
			eventManager.addEvents([new EventDialog(Strings.frogponddunStrings[4], this),
									new EventFlag("fight_dummy", 0)]);

	}
							
}




