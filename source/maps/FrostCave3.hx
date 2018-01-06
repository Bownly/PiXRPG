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

class FrostCave3 extends Dungeon
{
	var chest1:Chest;
	var npcPedestal:NPC;
	var npcMonshou:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String) 
	{
		super(EntranceID, MapName, SongName);
		_song = "shadilay";

		encounterDecrementer = 1;
		encounterLowerBound = 0;
		encounterUpperBound = 0;
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();

		chest1 = new Chest(0, 0, FlxObject.UP, Reg.npcs["chest1_closed"], this, "froscav_chest1");
		chest1.setCanTurn(false);
		grpNPCs.add(chest1);

		npcPedestal = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["pedestal1"], this, "pedestal");
		grpNPCs.add(npcPedestal);
		npcPedestal.setCanTurn(false);

		if (Reg.flags["monshou_ice"] == 0)
		{
			npcMonshou = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["seals1"], this, "monshou");
			npcMonshou.setCanTurn(false);
			grpNPCs.add(npcMonshou);
		}

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		if (Reg.flags["monshou_ice"] == 0)
		{
			npcPedestal.events = [new EventDialog(Strings.frostcaveStrings[6], this)];
			if (player.x < npcMonshou.x)  // if player is to the left
				npcPedestal.events.push(new EventNPCWalk([npcMonshou], [[[FlxObject.DOWN, 1], [FlxObject.LEFT, 1]]], [false]));
			else if (player.x > npcMonshou.x)  // if player is to the right
				npcPedestal.events.push(new EventNPCWalk([npcMonshou], [[[FlxObject.DOWN, 1], [FlxObject.RIGHT, 1]]], [false]));
			else if (player.y > npcMonshou.y)  // if player is to the bottom
				npcPedestal.events.push(new EventNPCWalk([npcMonshou], [[[FlxObject.DOWN, 2]]]));

			npcPedestal.events.push(new EventNPCRemove(npcMonshou));
			npcPedestal.events.push(new EventDialog(Strings.frostcaveStrings[7], this));
			npcPedestal.events.push(new EventFlag("monshou_ice", 1));
		}


		if (Reg.flags["froscav_chest1"] == 0)
		{
			chest1.events = [new EventStringVarChange("%item%", "Escape Rope"),
							 new EventFlag("froscav_chest1", 1),
							 new EventNPCTrigger(chest1, 0),
							 new EventDialog(Strings.inventoryStrings[0], this),
							 new EventItemGet(new ItemClasses.ItemEscapeRope()),
							 new EventItemGet(new ItemClasses.ItemHealing("Soggy Ration", Strings.itemDescriptions["Soggy Ration"], 14, 15))
							];
		}






		
	}
}




