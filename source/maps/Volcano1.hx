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

class Volcano1 extends Dungeon
{
	var npcGuard1:NPC;
	var npcGuard2:NPC;
	var npcWaterkid:NPC;
	var obs0:NPC;
	var obj0:NPC;
	var obs1:NPC;
	var obj1:NPC;
	var gap0:NPC;
	var grpGaps:FlxTypedGroup<NPC>;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "housesong";
		encounterDecrementer = 1;
		encounterLowerBound = 33;
		encounterUpperBound = 55;
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		grpGaps = new FlxTypedGroup<NPC>();

		if (Reg.flags["volcano_obj0"] == 0)
		{
			obj0 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 0");
			obj0.setCanTurn(false);
			grpNPCs.add(obj0);
			obs0 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "obs 0");
			obs0.setCanTurn(false);
			grpNPCs.add(obs0);
		}
		else
		{
			obj0 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 1");
			obj0.setCanTurn(false);
			grpNPCs.add(obj0);		
		}

		if (Reg.flags["volcano_obj1"] == 0)
		{
			obj1 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 2");
			obj1.setCanTurn(false);
			grpNPCs.add(obj1);
			obs1 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "obs 1");
			obs1.setCanTurn(false);
			grpNPCs.add(obs1);
		}
		else if (Reg.flags["volcano_obj1"] == 1)
		{
			obj1 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 3");
			obj1.setCanTurn(false);
			grpNPCs.add(obj1);	
		}
		else
		{
			obj1 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 4");
			obj1.setCanTurn(false);
			grpNPCs.add(obj1);		
		}
		
		// gaps
		gap0 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "gap 0");
		gap0.setCanTurn(false);
		grpGaps.add(gap0);
		grpNPCs.add(gap0);
		for (i in 1...2)
		{
			var gap = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "gap " + i);
			gap.setCanTurn(false);
			grpGaps.add(gap);
			grpNPCs.add(gap);
		}
		add(grpGaps);


		var l0 = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["lavafall"], this, "lava 0");
		var l1 = new NPC(0, 0, FlxObject.LEFT, Reg.npcs["lavafall"], this, "lava 1");
		var l2 = new NPC(0, 0, FlxObject.LEFT, Reg.npcs["lavafall"], this, "lava 2");
		var l3 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["lavafall"], this, "lava 3");
		grpNPCs.add(l0);
		grpNPCs.add(l1);
		grpNPCs.add(l2);
		grpNPCs.add(l3);



		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{

		// obs0.events = [new EventDialog(Strings.mchouseStrings[1], this)];
		// obj1.events = [new EventDialog(Strings.mchouseStrings[2], this)];
		// obj2.events = [new EventDialog(Strings.mchouseStrings[3], this)];
		// obj3.events = [new EventDialog(Strings.mchouseStrings[3], this)];

		for (gap in grpGaps)
		{
			if (player.x < gap.x)
				gap.events = [new EventNPCRun([player], [[[FlxObject.RIGHT, 2]]])];
			else
				gap.events = [new EventNPCRun([player], [[[FlxObject.LEFT, 2]]])];			
		}


		if (Reg.flags["volcano_obj0"] == 0)
		{
			obj0.events = [ new EventFlag("volcano_obj0", 1),
							new EventNPCWalk([obj0], [[[FlxObject.RIGHT, 1]]], [false]),
							new EventNPCRun([obj0], [[[FlxObject.DOWN, 7]]], [false]),
							new EventSFXPlay("splash"),
							new EventNPCRemove(obs0)
							];
		}
		if (Reg.flags["volcano_obj1"] == 0)
		{
			obj1.events = [ new EventFlag("volcano_obj1", 1),
							new EventNPCWalk([obj1], [[[FlxObject.LEFT, 1]]], [false]),
							new EventNPCRun([obj1], [[[FlxObject.DOWN, 5]]], [false]),
							new EventSFXPlay("splash"),
							];
		}
		else if (Reg.flags["volcano_obj1"] == 1)
		{
			obj1.events = [ new EventFlag("volcano_obj1", 2),
							new EventNPCWalk([obj1], [[[FlxObject.RIGHT, 1]]], [false]),
							new EventNPCRun([obj1], [[[FlxObject.DOWN, 16]]], [false]),
							new EventSFXPlay("splash"),
							new EventNPCAdd(gap0, grpNPCs)
							];
		}
	}
}




