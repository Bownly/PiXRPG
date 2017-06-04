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

		if (Reg.flags["owl_clan_attack"] == 0)  // 0 = pre-attack
		{
			if (Reg.flags["frogponddun"] == 0)  // 0 = dun not done
				npc.events = [new EventDialog(Strings.frogpondhouse3Strings[0], this),
							  new EventDialog(Strings.frogpondhouse3Strings[1], this),
							  new EventDialog(Strings.frogpondhouse3Strings[2], this)
			];			
			else
				npc.events = [new EventDialog(Strings.frogpondhouse3Strings[3], this)];			
		}
		else if (Reg.flags["owl_clan_attack"] <= 2)  // 1 = post-attack; 2 = return home
			npc.events = [new EventDialog(Strings.frogpondhouse3Strings[4], this)];			
		else if (Reg.flags["owl_clan_attack"] >= 3)  // 3 = return to The Pond; 4 = docks; 5 = done
			npc.events = [new EventDialog(Strings.frogpondhouse3Strings[5], this)];		
	}



}




