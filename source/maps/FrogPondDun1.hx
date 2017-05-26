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

class FrogPondDun1 extends TownState
{
	var chest1:Chest;
	var chest2:Chest;
	var chest3:Chest;
	var chest4:Chest;
	var door1:NPC;
	var door2:NPC;
	var door3:NPC;
	var door4:NPC;
	var mimic1:NPC;
	var mimic2:NPC;
	var mimic3:NPC;
	var mimic4:NPC;
	var mimic5:NPC;
	var mimic6:NPC;
	var mimic7:NPC;
	var mimic8:NPC;
	var obs1:NPC;
	var obs2:NPC;
	var obs3:NPC;
	var obs4:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "cavesong";
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		
		chest1 = new Chest(0, 0, this, "frogpond_chest1");
		chest2 = new Chest(0, 0, this, "frogpond_chest2");
		chest3 = new Chest(0, 0, this, "frogpond_chest3");
		chest4 = new Chest(0, 0, this, "frogpond_chest4");
		mimic1 = new Chest(0, 0, this, "frogpond_mimic1");
		mimic2 = new Chest(0, 0, this, "frogpond_mimic2");
		mimic3 = new Chest(0, 0, this, "frogpond_mimic3");
		mimic4 = new Chest(0, 0, this, "frogpond_mimic4");
		mimic5 = new Chest(0, 0, this, "frogpond_mimic5");
		mimic6 = new Chest(0, 0, this, "frogpond_mimic6");
		mimic7 = new Chest(0, 0, this, "frogpond_mimic7");
		mimic8 = new Chest(0, 0, this, "frogpond_mimic8");
		grpNPCs.add(chest1);
		grpNPCs.add(chest2);
		grpNPCs.add(chest3);
		grpNPCs.add(chest4);
		grpNPCs.add(mimic1);
		grpNPCs.add(mimic2);
		grpNPCs.add(mimic3);
		grpNPCs.add(mimic4);
		grpNPCs.add(mimic5);
		grpNPCs.add(mimic6);
		grpNPCs.add(mimic7);
		grpNPCs.add(mimic8);
		

		if (Reg.flags["frogpond_door1"] == 0)
		{
			door1 = new NPC(0, 0, FlxObject.DOWN, 9, this, "frogpond_door1");
			grpNPCs.add(door1);
		}
		if (Reg.flags["frogpond_door2"] == 0)
		{
			door2 = new NPC(0, 0, FlxObject.DOWN, 9, this, "frogpond_door2");
			grpNPCs.add(door2);
		}
		if (Reg.flags["frogpond_door3"] == 0)
		{
			door3 = new NPC(0, 0, FlxObject.DOWN, 9, this, "frogpond_door3");
			grpNPCs.add(door3);
		}
		if (Reg.flags["frogpond_door4"] == 0)
		{
			door4 = new NPC(0, 0, FlxObject.DOWN, 9, this, "frogpond_door4");
			grpNPCs.add(door4);
		}

		if (Reg.flags["frogpond_obs1"] == 0)
		{
			obs1 = new NPC(0, 0, FlxObject.DOWN, 14, this, "frogpond_obs1");
			grpNPCs.add(obs1);
		}
		if (Reg.flags["frogpond_obs2"] == 0)
		{
			obs2 = new NPC(0, 0, FlxObject.DOWN, 14, this, "frogpond_obs2");
			grpNPCs.add(obs2);
		}
		if (Reg.flags["frogpond_obs3"] == 0)
		{
			obs3 = new NPC(0, 0, FlxObject.DOWN, 14, this, "frogpond_obs3");
			grpNPCs.add(obs3);
		}
		if (Reg.flags["frogpond_obs4"] == 0)
		{
			obs4 = new NPC(0, 0, FlxObject.DOWN, 14, this, "frogpond_obs4");
			grpNPCs.add(obs4);
		}

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		if (Reg.flags["frogpond_chest1"] == 0)
		{
			chest1.events = [new EventDialog(Strings.frogponddunStrings[14], this),
							 new EventFlag("frogpond_chest1", 1),
							 new EventNPCTrigger(chest1, 0),
							 new EventFlag("frogpond_obs1", 1),
							 new EventNPCRemove(obs1)
							];
		}

		if (Reg.flags["frogpond_chest2"] == 0)
		{
			chest2.events = [new EventDialog(Strings.frogponddunStrings[14], this),
							 new EventFlag("frogpond_chest2", 1),
							 new EventNPCTrigger(chest2, 0),
							 new EventFlag("frogpond_obs2", 1),
							 new EventNPCRemove(obs2)
							];
		}

		if (Reg.flags["frogpond_chest3"] == 0)
		{
			chest3.events = [new EventDialog(Strings.frogponddunStrings[14], this),
							 new EventFlag("frogpond_chest3", 1),
							 new EventNPCTrigger(chest3, 0),
							 new EventFlag("frogpond_obs3", 1),
							 new EventNPCRemove(obs3)
							];
		}

		if (Reg.flags["frogpond_chest4"] == 0)
		{
			chest4.events = [new EventDialog(Strings.frogponddunStrings[14], this),
							 new EventFlag("frogpond_chest4", 1),
							 new EventNPCTrigger(chest4, 0),
							 new EventFlag("frogpond_obs4", 1),
							 new EventNPCRemove(obs4)
							];
		}


		var tempID = 15;  // no hood
		if (Reg.flags["p_hood"] == 1)
			tempID = 21;  // hooded
		
		if (Reg.flags["frogpond_mimic1"] == 0)
		{
			mimic1.events = [new EventDialog(Strings.frogponddunStrings[tempID], this),
							 new EventFlag("frogpond_mimic1", 1),
							 new EventBattle([new EnemyFrog()], this, "frogpond_mimic1", 1),
							 new EventNPCTrigger(mimic1, 0)
							];
		}
		if (Reg.flags["frogpond_mimic2"] == 0)
		{
			mimic2.events = [new EventDialog(Strings.frogponddunStrings[tempID], this),
							 new EventFlag("frogpond_mimic2", 1),
							 new EventBattle([new EnemyFrog()], this, "frogpond_mimic2", 1),
							 new EventNPCTrigger(mimic2, 0)
							];
		}
		if (Reg.flags["frogpond_mimic3"] == 0)
		{
			mimic3.events = [new EventDialog(Strings.frogponddunStrings[tempID], this),
							 new EventFlag("frogpond_mimic3", 1),
							 new EventBattle([new EnemyFrog()], this, "frogpond_mimic3", 1),
							 new EventNPCTrigger(mimic3, 0)
							];
		}
		if (Reg.flags["frogpond_mimic4"] == 0)
		{
			mimic4.events = [new EventDialog(Strings.frogponddunStrings[tempID], this),
							 new EventFlag("frogpond_mimic4", 1),
							 new EventBattle([new EnemyFrog()], this, "frogpond_mimic4", 1),
							 new EventNPCTrigger(mimic4, 0)
							];
		}
		if (Reg.flags["frogpond_mimic5"] == 0)
		{
			mimic5.events = [new EventDialog(Strings.frogponddunStrings[tempID], this),
							 new EventFlag("frogpond_mimic5", 1),
							 new EventBattle([new EnemyFrog()], this, "frogpond_mimic5", 1),
							 new EventNPCTrigger(mimic5, 0)
							];
		}
		if (Reg.flags["frogpond_mimic6"] == 0)
		{
			mimic6.events = [new EventDialog(Strings.frogponddunStrings[tempID], this),
							 new EventFlag("frogpond_mimic6", 1),
							 new EventBattle([new EnemyFrog()], this, "frogpond_mimic6", 1),
							 new EventNPCTrigger(mimic6, 0)
							];
		}
		if (Reg.flags["frogpond_mimic7"] == 0)
		{
			mimic7.events = [new EventDialog(Strings.frogponddunStrings[tempID], this),
							 new EventFlag("frogpond_mimic7", 1),
							 new EventBattle([new EnemyFrog()], this, "frogpond_mimic7", 1),
							 new EventNPCTrigger(mimic7, 0)
							];
		}
		if (Reg.flags["frogpond_mimic8"] == 0)
		{
			mimic8.events = [new EventDialog(Strings.frogponddunStrings[tempID], this),
							 new EventFlag("frogpond_mimic8", 1),
							 new EventBattle([new EnemyFrog()], this, "frogpond_mimic8", 1),
							 new EventNPCTrigger(mimic8, 0)
							];
		}

		// door 1 block
		if (Reg.flags["frogpond_door1"] == 0)
			door1.events = [new EventDialog(Strings.frogponddunStrings[9], this),
							new EventBattle([new EnemyDoor()], this, "frogpond_door1", 1)
							];
		else if (Reg.flags["frogpond_door1"] == 1) 
		{
			eventManager.addEvents([new EventNPCRemove(door1)]);
			eventManager.addEvents([new EventFlag("frogpond_door1", 2)]);
		}
		// else if (door1 != null && door1.visible == true)
			// eventManager.addEvents([new EventNPCRemove(door1)]);

		// door 2 block
		if (Reg.flags["frogpond_door2"] == 0)
			door2.events = [new EventDialog(Strings.frogponddunStrings[12], this),
							new EventBattle([new EnemyDoor()], this, "frogpond_door2", 1)
							];
		else if (Reg.flags["frogpond_door2"] == 1) 
		{
			eventManager.addEvents([new EventNPCRemove(door2)]);
			eventManager.addEvents([new EventFlag("frogpond_door2", 2)]);
		}

		// door 3
		if (Reg.flags["frogpond_door3"] == 0)
		{
			door3.events = [new EventDialog(Strings.frogponddunStrings[10], this),
							new EventNPCRemove(door3),
							new EventFlag("frogpond_door3", 1)
							];
		}

		// door 4 block
		if (Reg.flags["frogpond_door4"] == 0)
			door4.events = [new EventDialog(Strings.frogponddunStrings[11], this),
							new EventBattle([new EnemyDoor()], this, "frogpond_door4", 1)
							];
		else if (Reg.flags["frogpond_door4"] == 1) 
		{
			eventManager.addEvents([new EventNPCRemove(door4)]);
			eventManager.addEvents([new EventFlag("frogpond_door4", 2)]);
		}
	}
}




