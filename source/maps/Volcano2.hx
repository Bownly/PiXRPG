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

class Volcano2 extends Dungeon
{
	var obj2:NPC;
	var obj3:NPC;
	var obj4:NPC;
	var obj5:NPC;
	var gap0:NPC;
	var gap1:NPC;
	var grpGaps:FlxTypedGroup<NPC>;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "housesong";
		encounterDecrementer = 1;
		encounterLowerBound = 33;
		encounterUpperBound = 66;
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		grpGaps = new FlxTypedGroup<NPC>();

		// obj 2
		if (Reg.flags["volcano_obj2"] == 0)
		{
			obj2 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 0");
			obj2.setCanTurn(false);
			grpNPCs.add(obj2);
		}
		else if (Reg.flags["volcano_obj2"] == 1)
		{
			obj2 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 1");
			obj2.setCanTurn(false);
			grpNPCs.add(obj2);		
		}
		else if (Reg.flags["volcano_obj2"] == 2)
		{
			obj2 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 2");
			obj2.setCanTurn(false);
			grpNPCs.add(obj2);		
		}
		else if (Reg.flags["volcano_obj2"] == 3)
		{
			obj2 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 3");
			obj2.setCanTurn(false);
			grpNPCs.add(obj2);		
		}
		else if (Reg.flags["volcano_obj2"] == 4)
		{
			var num = 4;
			if (Reg.flags["volcano_obj4"] == 1)
				num = 5;
			obj2 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj " + num);
			obj2.setCanTurn(false);
			grpNPCs.add(obj2);		
		}
		else if (Reg.flags["volcano_obj2"] == 5)
		{
			obj2 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 6");
			obj2.setCanTurn(false);
			grpNPCs.add(obj2);		
		}

		// obj 3
		if (Reg.flags["volcano_obj3"] == 0)
		{
			obj3 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 8");
			obj3.setCanTurn(false);
			grpNPCs.add(obj3);		
		}
		else if (Reg.flags["volcano_obj3"] == 1)
		{
			var num = 9;
			if (Reg.flags["volcano_obj5"] == 1)
				num = 10;
			obj3 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj " + num);
			obj3.setCanTurn(false);
			grpNPCs.add(obj3);		
		}
		else if (Reg.flags["volcano_obj3"] == 2)
		{
			obj3 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 11");
			obj3.setCanTurn(false);
			grpNPCs.add(obj3);		
		}

		// obj 4
		if (Reg.flags["volcano_obj4"] == 0)
		{
			obj4 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 5");
			obj4.setCanTurn(false);
			grpNPCs.add(obj4);		
		}
		else if (Reg.flags["volcano_obj4"] == 1)
		{
			obj4 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 7");
			obj4.setCanTurn(false);
			grpNPCs.add(obj4);		
		}

		// obj 5
		if (Reg.flags["volcano_obj5"] == 0)
		{
			obj5 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 10");
			obj5.setCanTurn(false);
			grpNPCs.add(obj5);		
		}
		else if (Reg.flags["volcano_obj5"] == 1)
		{
			obj5 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 12");
			obj5.setCanTurn(false);
			grpNPCs.add(obj5);		
		}

		
		// gaps
		gap0 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "gap 0");
		gap0.setCanTurn(false);
		grpGaps.add(gap0);
		grpNPCs.add(gap0);
		// gap1 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "gap 1");
		// gap1.setCanTurn(false);
		// grpGaps.add(gap1);
		// grpNPCs.add(gap1);
		for (i in 1...3)
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
		var l3 = new NPC(0, 0, FlxObject.LEFT, Reg.npcs["lavafall"], this, "lava 3");
		var l4 = new NPC(0, 0, FlxObject.LEFT, Reg.npcs["lavafall"], this, "lava 4");
		var l5 = new NPC(0, 0, FlxObject.LEFT, Reg.npcs["lavafall"], this, "lava 5");
		var l6 = new NPC(0, 0, FlxObject.LEFT, Reg.npcs["lavafall"], this, "lava 6");
		grpNPCs.add(l0);
		grpNPCs.add(l1);
		grpNPCs.add(l2);
		grpNPCs.add(l3);
		grpNPCs.add(l4);
		grpNPCs.add(l5);
		grpNPCs.add(l6);





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

		// obj 2
		if (Reg.flags["volcano_obj2"] == 0)
		{
			obj2.events = [ new EventFlag("volcano_obj2", 1),
							new EventNPCWalk([obj2], [[[FlxObject.LEFT, 1]]], [false]),
							new EventNPCRun([obj2], [[[FlxObject.DOWN, 4]]], [false]),
							new EventSFXPlay("splash"),
							];
		}
		else if (Reg.flags["volcano_obj2"] == 1)
		{
			obj2.events = [ new EventFlag("volcano_obj2", 2),
							new EventNPCWalk([obj2], [[[FlxObject.LEFT, 1]]], [false]),
							new EventNPCRun([obj2], [[[FlxObject.DOWN, 3]]], [false]),
							new EventSFXPlay("splash"),
							];
		}
		else if (Reg.flags["volcano_obj2"] == 2)
		{
			obj2.events = [ new EventFlag("volcano_obj2", 3),
							new EventNPCWalk([obj2], [[[FlxObject.RIGHT, 1]]], [false]),
							new EventNPCRun([obj2], [[[FlxObject.DOWN, 3]]], [false]),
							new EventSFXPlay("splash"),
							];
		}
		else if (Reg.flags["volcano_obj2"] == 3)
		{
			var num = 7;
			if (Reg.flags["volcano_obj4"] == 0)
				num = 6;
			obj2.events = [ new EventFlag("volcano_obj2", 4),
							new EventNPCWalk([obj2], [[[FlxObject.LEFT, 1]]], [false]),
							new EventNPCRun([obj2], [[[FlxObject.DOWN, num]]], [false]),
							new EventSFXPlay("splash"),
							];
		}
		else if (Reg.flags["volcano_obj2"] == 4)
		{
			obj2.events = [ new EventFlag("volcano_obj2", 5),
							new EventNPCWalk([obj2], [[[FlxObject.LEFT, 1]]], [false]),
							new EventNPCRun([obj2], [[[FlxObject.DOWN, 8]]], [false]),
							new EventSFXPlay("splash"),
							new EventNPCAdd(gap0, grpNPCs)
							];
		}

		// obj 3
		if (Reg.flags["volcano_obj3"] == 0)
		{
			var num = 8;
			if (Reg.flags["volcano_obj5"] == 0)
				num = num - 1;
			obj3.events = [ new EventFlag("volcano_obj3", 1),
							new EventNPCWalk([obj3], [[[FlxObject.RIGHT, 1]]], [false]),
							new EventNPCRun([obj3], [[[FlxObject.DOWN, num]]], [false]),
							new EventSFXPlay("splash"),
							];
		}
		else if (Reg.flags["volcano_obj3"] == 1)
		{
			obj3.events = [ new EventFlag("volcano_obj3", 2),
							new EventNPCWalk([obj3], [[[FlxObject.RIGHT, 1]]], [false]),
							new EventNPCRun([obj3], [[[FlxObject.DOWN, 5]]], [false]),
							new EventSFXPlay("splash"),
							];
		}

		// obj 4
		if (Reg.flags["volcano_obj4"] == 0)
		{
			obj4.events = [ new EventFlag("volcano_obj4", 1),
							new EventNPCWalk([obj4], [[[FlxObject.LEFT, 1]]], [false]),
							];
			if (Reg.flags["volcano_obj2"] == 4)
				obj4.events.push(new EventNPCRun([obj2, obj4], [[[FlxObject.DOWN, 1]], [[FlxObject.DOWN, 1]]], [false]));
			else
				obj4.events.push(new EventNPCRun([obj4], [[[FlxObject.DOWN, 1]]], [false]));
			obj4.events.push(new EventNPCRun([obj4], [[[FlxObject.DOWN, 8]]], [false]));
			obj4.events.push(new EventSFXPlay("splash"));
		}
		
		// obj 5
		if (Reg.flags["volcano_obj5"] == 0)
		{
			obj5.events = [ new EventFlag("volcano_obj5", 1),
							new EventNPCWalk([obj5], [[[FlxObject.RIGHT, 1]]], [false]),
							];
			if (Reg.flags["volcano_obj3"] == 1)
				obj5.events.push(new EventNPCRun([obj3, obj5], [[[FlxObject.DOWN, 1]], [[FlxObject.DOWN, 1]]], [false]));
			else
				obj5.events.push(new EventNPCRun([obj5], [[[FlxObject.DOWN, 1]]], [false]));
			obj5.events.push(new EventNPCRun([obj5], [[[FlxObject.DOWN, 5]]], [false]));
			obj5.events.push(new EventSFXPlay("splash"));

		}
	




	}
}




