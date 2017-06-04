package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup;

import EventClasses;

/**
 * ...
 * @author ...
 */
class WorldMap extends TownState
{
	var npcBoat:NPC;
	var npcRival:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{

		super(EntranceID, MapName, SongName, Dungeon);
		_song = "worldmap";

		if (Reg.flags["frogponddun"] == 0)
			encounterDecrementer = 0;
		else
			encounterDecrementer = 1;

		encounterLowerBound = 22;
		encounterUpperBound = 33;

	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		if (Reg.flags["first_wakeup"] == 2)
		{
			npcRival = new NPC(0, 0, FlxObject.UP, 2, this, "npc 0");
			grpNPCs.add(npcRival);
		}

		if (Reg.flags["owl_clan_attack"] <= 5)
		{
			npcBoat = new NPC(0, 0, FlxObject.RIGHT, 12, this, "npc boat");
			grpNPCs.add(npcBoat);			
		}

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		if (Reg.flags["first_wakeup"] == 2)
		{
			eventManager.addEvents([new EventFlag("first_wakeup", 3),
				new EventDialog(Strings.worldmapStrings[0], this),
									new EventNPCWalk(npcRival, [[FlxObject.UP, 1]]),
									new EventNPCRemove(npcRival),
									new EventFlag("first_wakeup", 3),
									]);
		}
	}	
	// override public function create():Void 
	// {
	// 	super.create();
	// }
	
	// override function update(elapsed:Float):Void
	// {
	// 	super.update(elapsed);
	// }
}