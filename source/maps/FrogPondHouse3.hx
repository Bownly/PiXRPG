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

class FrogPondHouse3 extends TownState
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

		// npc 1
		if (Reg.flags["owl_clan_attack"] == 0)  // pre-attack
			npc.events = [new EventDialog(Strings.frogpondStrings[3], this)];
		else if (Reg.flags["owl_clan_attack"] == 1)  // post-attack
			npc.events = [new EventDialog(Strings.frogpondStrings[8], this)];
		else if (Reg.flags["owl_clan_attack"] == 3)  // return to The Pond
			npc.events = [new EventDialog(Strings.frogpondStrings[12], this)];
	}



}




