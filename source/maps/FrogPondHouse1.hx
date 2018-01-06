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

class FrogPondHouse1 extends TownState
{
	var npc:NPC;
	var _events:Map<String, Array<BaseEvent>>;
	var _arrObjs:Array<NPC> = new Array<NPC>();

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
		super(EntranceID, MapName, SongName, Dungeon);

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		npc = new NPC(256, 256, FlxObject.DOWN, Reg.npcs["frogman"], this, "npc");
		grpNPCs.add(npc);

		for (barrel in 0...15)
		{
			var obj = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "obj " + barrel);
			obj.setCanTurn(false);
			grpNPCs.add(obj);
			_arrObjs.push(obj);
		}

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();

		for (barrel in 0...15)
		{
			// 5 is amound of unique strings, 4 is the starting index of the strings
			_arrObjs[barrel].events = [new EventDialog(Strings.frogpondhouse1Strings[barrel%5+4], this)];
		}	



		if (Reg.flags["owl_clan_attack"] == 0)  // 0 = pre-attack
			npc.events = [new EventDialog(Strings.frogpondStrings[37], this)];			
		else if (Reg.flags["owl_clan_attack"] <= 2)  // 1 = post-attack; 2 = return home
			npc.events = [new EventDialog(Strings.frogpondStrings[44], this)];			
		else if (Reg.flags["owl_clan_attack"] >= 3)  // 3 = return to The Pond; 4 = docks; 5 = done
			npc.events = [new EventDialog(Strings.frogpondStrings[48], this)];			

		if (ItemClasses.InventoryManager.arr.length <= 3)
		{
			npc.events.push(new EventDialog(Strings.frogpondStrings[52], this));
 			npc.events.push(new EventStringVarChange("%item%", "Edible Barrel"));
			npc.events.push(new EventItemGet(new ItemClasses.ItemHealing("Edible Barrel", Strings.itemDescriptions["Edible Barrel"], 13, 20)));
			if (Reg.flags["p_hood"] == 0)  // 0 = no hood
				npc.events.push(new EventDialog(Strings.inventoryStrings[0], this));
			else
				npc.events.push(new EventDialog(Strings.inventoryStrings[1], this));
		}
	}



}




