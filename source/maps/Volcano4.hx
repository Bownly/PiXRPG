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

class Volcano4 extends Dungeon
{
	var lava0:NPC;
	var lava1:NPC;
	var lava2:NPC;
	var lava3:NPC;
	var lava4:NPC;
	var lava5:NPC;
	var lava6:NPC;
	var grpGaps:FlxTypedGroup<NPC>;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "housesong";
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		grpGaps = new FlxTypedGroup<NPC>();

		trace("FLAGS: " + Reg.flags["volcano_obj6"]);

		// lava
		for (i in 0...70)
		{
			var dir:Int = FlxObject.LEFT;
			if (i % 7 == 0)
				dir = FlxObject.DOWN;
			else if (i % 7 == 6)
				dir = FlxObject.RIGHT;
			var lava = new NPC(0, 0, dir, Reg.npcs["lavafall"], this, "lava " + i);
			lava.setCanTurn(false);
			grpGaps.add(lava);
			grpNPCs.add(lava);
		}
		add(grpGaps);

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		// for (gap in grpGaps)
		// {
		// 	if (player.x < gap.x)
		// 		gap.events = [new EventNPCRun([player], [[[FlxObject.RIGHT, 2]]])];
		// 	else
		// 		gap.events = [new EventNPCRun([player], [[[FlxObject.LEFT, 2]]])];			
		// }

		




	}
}




