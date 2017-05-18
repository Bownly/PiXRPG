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

class FrogPondHouse4 extends TownState
{

	var npc_dummy:NPC;
	var npc_froggo:NPC;
	var _events:Map<String, Array<BaseEvent>>;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
		super(EntranceID, MapName, SongName, Dungeon);

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		npc_froggo = new NPC(256, 256, FlxObject.DOWN, 0, this, "froggo");
		grpNPCs.add(npc_froggo);

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();

		if (Reg.flags["owl_clan_attack"] == 0)  // pre-attack
			npc_froggo.events = [new EventDialog(Strings.frogpondStrings[1], this)];
		else if (Reg.flags["owl_clan_attack"] == 1)  // post-attack
			npc_froggo.events = [new EventDialog(Strings.frogpondStrings[10], this)];
		else if (Reg.flags["owl_clan_attack"] == 3)  // return to The Pond
			npc_froggo.events = [new EventDialog(Strings.frogpondStrings[11], this)];


	}
}





