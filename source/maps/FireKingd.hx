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

class FireKingd extends TownState
{
	var npcGuard1:NPC;
	var npcGuard2:NPC;
	var npcWaterkid:NPC;
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


		for (i in 0...6)
		{
			var torch = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["steam"], this, "flame " + i);
			torch.setCanTurn(false);
			grpNPCs.add(torch);
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

	
		// if (Reg.flags["fireking_arc"] == 0)
		// {
		// 	eventManager.addEvents([ new EventDialog(Strings.firekingdomStrings[0], this),
		// 							new EventNPCWalk([player], [[[FlxObject.DOWN, 0]]]),
		// 							new EventSwitchState("worldmap.tmx", 7)
		// 	]);
		// }
	}
}




