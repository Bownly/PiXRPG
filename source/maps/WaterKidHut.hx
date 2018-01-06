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

class WaterKidHut extends TownState
{
	var npcWaterKid:NPC;
	var obj0:NPC;
	var obj1:NPC;
	var obj2:NPC;
	var obj3:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "housesong";
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();

		obj0 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal1"], this, "obj 0");
		obj1 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal1"], this, "obj 1");
		obj2 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal1"], this, "obj 2");
		obj3 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal1"], this, "obj 3");
		obj0.setCanTurn(false);
		obj1.setCanTurn(false);
		obj2.setCanTurn(false);
		obj3.setCanTurn(false);
		grpNPCs.add(obj0);
		grpNPCs.add(obj1);
		grpNPCs.add(obj2);
		grpNPCs.add(obj3);

		if (Reg.flags["waterkid_in_hut"] <= 2)
		{
			npcWaterKid = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["waterkid"], this, "npc 0");
			grpNPCs.add(npcWaterKid);	
		}


		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		// obj0.events = [new EventDialog(Strings.mchouseStrings[1], this)];
		// obj1.events = [new EventDialog(Strings.mchouseStrings[2], this)];
		// obj2.events = [new EventDialog(Strings.mchouseStrings[3], this)];
		// obj3.events = [new EventDialog(Strings.mchouseStrings[3], this)];

		if (Reg.flags["waterkid_in_hut"] == 0 && Reg.flags["dialog_choices"] == 0)  // first meeting
			eventManager.addEvents([new EventDialog(Strings.waterkidhutStrings[0], this),
									new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
									new EventDialog(Strings.waterkidhutStrings[1], this),
									new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
									new EventDialog(Strings.waterkidhutStrings[2], this),
									new EventNPCWalk([npcWaterKid], [[[FlxObject.LEFT, 1]]]),
									new EventNPCWalk([player], [[[FlxObject.RIGHT, 0]]]),
									new EventDialog(Strings.waterkidhutStrings[3], this, 
													[new MenuItemDialogChoice(Strings.waterkidhutStrings[4], 
														null, new EventFlag("dialog_choices", 1)),
													 new MenuItemDialogChoice(Strings.waterkidhutStrings[5], 
													 	null, new EventFlag("dialog_choices", 2))
													]),
									new EventFlag("waterkid_in_hut", 1)
									]);
		else if (Reg.flags["waterkid_in_hut"] == 1 && Reg.flags["dialog_choices"] == 1)  // first meeting dialog choice 1
			eventManager.addEvents([new EventDialog(Strings.waterkidhutStrings[6], this),
									new EventDialog(Strings.waterkidhutStrings[8], this),
									new EventDialog(Strings.waterkidhutStrings[9], this),
									new EventDialog(Strings.waterkidhutStrings[10], this),
									new EventDialog(Strings.waterkidhutStrings[11], this),
									new EventDialog(Strings.waterkidhutStrings[12], this),
									new EventDialog(Strings.waterkidhutStrings[13], this),
									new EventNPCWalk([npcWaterKid], [[[FlxObject.LEFT, 1]]]),
									new EventStringVarChange("%item%", "Soggy Ration x 2"),
									new EventItemGet(new ItemClasses.ItemHealing("Soggy Ration", Strings.itemDescriptions["Soggy Ration"], 14, 15)),
									new EventItemGet(new ItemClasses.ItemHealing("Soggy Ration", Strings.itemDescriptions["Soggy Ration"], 14, 15)),
									new EventDialog(Strings.inventoryStrings[Reg.flags["p_hood"]], this),
									new EventDialog(Strings.waterkidhutStrings[14], this),
									new EventDialog(Strings.waterkidhutStrings[15], this),
									new EventNPCWalk([player], [[[FlxObject.UP, 0]]]),									
									new EventDialog(Strings.waterkidhutStrings[16], this),
									new EventDialog(Strings.waterkidhutStrings[17], this),
									new EventDialog(Strings.waterkidhutStrings[18], this),
									new EventFlag("dialog_choices", 0)
									]);
		else if (Reg.flags["waterkid_in_hut"] == 1 && Reg.flags["dialog_choices"] == 2)  // first meeting dialog choice 2
			eventManager.addEvents([new EventDialog(Strings.waterkidhutStrings[7], this),
									new EventDialog(Strings.waterkidhutStrings[8], this),
									new EventDialog(Strings.waterkidhutStrings[9], this),
									new EventDialog(Strings.waterkidhutStrings[10], this),
									new EventDialog(Strings.waterkidhutStrings[11], this),
									new EventDialog(Strings.waterkidhutStrings[12], this),
									new EventDialog(Strings.waterkidhutStrings[13], this),
									new EventNPCWalk([npcWaterKid], [[[FlxObject.LEFT, 1]]]),
									new EventStringVarChange("%item%", "Soggy Ration x 2"),
									new EventItemGet(new ItemClasses.ItemHealing("Soggy Ration", Strings.itemDescriptions["Soggy Ration"], 14, 15)),
									new EventItemGet(new ItemClasses.ItemHealing("Soggy Ration", Strings.itemDescriptions["Soggy Ration"], 14, 15)),
									new EventDialog(Strings.inventoryStrings[Reg.flags["p_hood"]], this),
									new EventNPCWalk([player], [[[FlxObject.DOWN, 2], [FlxObject.RIGHT, 1]]]),
									new EventDialog(Strings.waterkidhutStrings[15], this),
									new EventNPCWalk([player], [[[FlxObject.UP, 0]]]),									
									new EventDialog(Strings.waterkidhutStrings[16], this),
									new EventDialog(Strings.waterkidhutStrings[17], this),
									new EventDialog(Strings.waterkidhutStrings[18], this),
									new EventFlag("dialog_choices", 0)
									]);
		else if (Reg.flags["waterkid_in_hut"] == 1 && Reg.flags["dialog_choices"] == 0)  // free item gibs
		{
			npcWaterKid.events = [new EventDialog(Strings.waterkidhutStrings[19], this)];
			if (ItemClasses.InventoryManager.arr.length <= 1)
			{
				npcWaterKid.events.push(new EventDialog(Strings.waterkidhutStrings[20], this));
	 			npcWaterKid.events.push(new EventStringVarChange("%item%", "Wet Rations"));
				npcWaterKid.events.push(new EventItemGet(new ItemClasses.ItemHealing("Soaked Ration", Strings.itemDescriptions["Soaked Ration"], 14, 15)));
				npcWaterKid.events.push(new EventDialog(Strings.inventoryStrings[Reg.flags["p_hood"]], this));
			}			
		}

		else if (Reg.flags["waterkid_in_hut"] == 2)  // confession time
			eventManager.addEvents([
									new EventDialog(Strings.waterkidhutStrings[21], this),
									new EventNPCRun([player], [[[FlxObject.UP, 6], [FlxObject.RIGHT, 0]]]),
									new EventNPCWalk([npcWaterKid], [[[FlxObject.LEFT, 0]]]),
									new EventDialog(Strings.waterkidhutStrings[22], this),
									new EventDialog(Strings.waterkidhutStrings[23], this),
									new EventDialog(Strings.waterkidhutStrings[24], this),
									new EventDialog(Strings.waterkidhutStrings[25], this),
									new EventDialog(Strings.waterkidhutStrings[26], this),
									new EventDialog(Strings.waterkidhutStrings[27], this),
									new EventDialog(Strings.waterkidhutStrings[28], this),
									new EventDialog(Strings.waterkidhutStrings[29], this),
									new EventDialog(Strings.waterkidhutStrings[30], this),
									new EventDialog(Strings.waterkidhutStrings[31], this),
									new EventDialog(Strings.waterkidhutStrings[32], this),
									new EventDialog(Strings.waterkidhutStrings[33], this),
									new EventNPCWalk([npcWaterKid], [[[FlxObject.LEFT, 1]]]),
									new EventNPCRemove(npcWaterKid),
									new EventFlag("waterkid_in_hut", 3)
									]);


	}
}




