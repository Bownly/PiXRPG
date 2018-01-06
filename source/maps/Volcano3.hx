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

class Volcano3 extends Dungeon
{
	var gondola:NPC;
	var obj6:NPC;
	var lava0:NPC;
	var lava1:NPC;
	var lava2:NPC;
	var lava3:NPC;
	var lava4:NPC;
	var lava5:NPC;
	var lava6:NPC;
	var steam0:NPC;
	var steam1:NPC;
	var steam2:NPC;
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
		lava0 = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["lavafall"], this, "lava 0");
		lava1 = new NPC(0, 0, FlxObject.LEFT, Reg.npcs["lavafall"], this, "lava 1");
		lava0.setCanTurn(false);
		lava1.setCanTurn(false);
		lava2 = new NPC(0, 0, FlxObject.LEFT, Reg.npcs["lavafall"], this, "lava 2");
		lava3 = new NPC(0, 0, FlxObject.UP, Reg.npcs["lavafall"], this, "lava 3");
		lava4 = new NPC(0, 0, FlxObject.LEFT, Reg.npcs["lavafall"], this, "lava 4", true);
		lava5 = new NPC(0, 0, FlxObject.LEFT, Reg.npcs["lavafall"], this, "lava 5", true);
		lava6 = new NPC(0, 0, FlxObject.LEFT, Reg.npcs["lavafall"], this, "lava 6", true);

		// steam
		steam0 = new NPC(0, 0, FlxObject.UP, Reg.npcs["steam"], this, "steam 0");
		steam1 = new NPC(0, 0, FlxObject.UP, Reg.npcs["steam"], this, "steam 1");
		steam2 = new NPC(0, 0, FlxObject.UP, Reg.npcs["steam"], this, "steam 2");
		grpNPCs.add(steam0);
		grpNPCs.add(steam1);
		grpNPCs.add(steam2);

		// obj 6
		if (Reg.flags["volcano_obj6"] == 0)
		{
			obj6 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 6");
			obj6.setCanTurn(false);
			grpNPCs.add(obj6);
			lava1.visible = false;
			lava2.visible = false;
			lava3.visible = false;
			lava4.visible = false;
			lava5.visible = false;
			lava6.visible = false;
			steam0.visible = false;
			steam1.visible = false;
			steam2.visible = false;
		}
		else
		{
			obj6 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj 7");
			obj6.setCanTurn(false);
			grpNPCs.add(obj6);
		}

		// npcs
		gondola = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["gondolagirl"], this, "npc 0");
		gondola.setCanTurn(false);
		grpNPCs.add(gondola);
		
		// gaps
		for (i in 0...2)
		{
			var gap = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal2"], this, "gap " + i);
			gap.setCanTurn(false);
			grpGaps.add(gap);
			grpNPCs.add(gap);
		}
		add(grpGaps);


		grpNPCs.add(lava0);
		grpNPCs.add(lava1);
		grpNPCs.add(lava2);
		grpNPCs.add(lava3);
		grpNPCs.add(lava4);
		grpNPCs.add(lava5);
		grpNPCs.add(lava6);	






		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		for (gap in grpGaps)
		{
			if (player.x < gap.x)
				gap.events = [new EventNPCRun([player], [[[FlxObject.RIGHT, 2]]])];
			else
				gap.events = [new EventNPCRun([player], [[[FlxObject.LEFT, 2]]])];			
		}

		// obj 2
		if (Reg.flags["volcano_obj6"] == 0)
		{
			obj6.events = [ new EventFlag("volcano_obj6", 1),
							new EventNPCWalk([obj6], [[[FlxObject.LEFT, 1]]], [false]),
							new EventSFXPlay("splash"),
							new EventNPCAdd(lava0),
							new EventZaWarudo(0.2),
							new EventNPCAdd(lava1),
							new EventZaWarudo(0.2),
							new EventNPCAdd(lava2),
							new EventZaWarudo(0.2),
							new EventNPCAdd(lava3),
							new EventZaWarudo(0.2),
							new EventNPCAdd(lava4),
							new EventZaWarudo(0.2),
							new EventNPCAdd(lava5),
							new EventZaWarudo(0.2),
							new EventNPCAdd(lava6),
							new EventZaWarudo(0.2),
							// steam sfx
							new EventSFXPlay("splash"),
							new EventZaWarudo(0.7),
							new EventNPCAdd(steam0),
							new EventNPCAdd(steam1),
							new EventNPCAdd(steam2),

							];

			gondola.events = [new EventDialog(Strings.waterkidhutStrings[23], this)];
		}
		else
			gondola.events = [new EventDialog(Strings.waterkidhutStrings[3], this)];

	




	}
}




