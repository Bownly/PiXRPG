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

class Volcano5 extends Dungeon
{
	var lava0:NPC;
	var lava1:NPC;
	var lava2:NPC;
	var lava3:NPC;
	var lava4:NPC;
	var lava5:NPC;
	var lava6:NPC;
	var chest0:Chest;
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


		// lava
		for (i in 0...30)
		{
			var dir:Int = FlxObject.LEFT;
			if (i % 6 == 0)
				dir = FlxObject.DOWN;
			var lava = new NPC(0, 0, dir, Reg.npcs["lavafall"], this, "lava " + i);
			lava.setCanTurn(false);
			grpGaps.add(lava);
			grpNPCs.add(lava);
		}
		add(grpGaps);

		chest0 = new Chest(0, 0, FlxObject.UP, Reg.npcs["chest1_closed"], this, "chest 0");
		grpNPCs.add(chest0);
		
		super.create();
		assignEvents();
		trace("exit ID:  " + edgeExitNextEntID);
	}
	
	override public function assignEvents():Void
	{
		if (Reg.flags["volcano_chest0"] == 0)
		{
			chest0.events = [new EventStringVarChange("%item%", "Escape Rope"),
							 new EventFlag("volcano_chest0", 1),
							 new EventNPCTrigger(chest0, 0),
							 new EventDialog(Strings.inventoryStrings[0], this),
							 new EventItemGet(new ItemClasses.ItemEscapeRope()),
							 new EventItemGet(new ItemClasses.ItemEscapeRope())
							];
		}

	}
}




