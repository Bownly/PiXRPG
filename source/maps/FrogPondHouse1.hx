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

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
		super(EntranceID, MapName, SongName, Dungeon);

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		npc = new NPC(256, 256, FlxObject.DOWN, 3, this, "npc");
		grpNPCs.add(npc);

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();

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




