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

class FrosCasThrone extends TownState
{
	var npcKing:NPC;
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
		npcKing = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["frostking"], this, "king");
		grpNPCs.add(npcKing);	


		if (Reg.flags["waterkid_in_hut"] == 5)
		{
			npcWaterkid = new NPC(0, 0, FlxObject.UP, Reg.npcs["waterkid"], this, "npc 1");
			npcWaterkid.visible = false;
			grpNPCs.add(npcWaterkid);	
		}


		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		// obj0.events = [new EventDialog(Strings.mchouseStrings[1], this)];

		if (Reg.flags["frostking_arc"] == 0)  // first meeting with king
		{

			if (Reg.flags["dialog_choices"] == 0)
				npcKing.events = [ 
									new EventNPCAdd(npcWaterkid, grpNPCs),
									new EventNPCWalk([player], [[[FlxObject.DOWN, 1], [FlxObject.UP, 0]]]),
									new EventDialog(Strings.frostcastleStrings[25], this),
									new EventDialog(Strings.frostcastleStrings[26], this),
									new EventDialog(Strings.frostcastleStrings[27], this),
									new EventDialog(Strings.frostcastleStrings[28], this),
									new EventDialog(Strings.frostcastleStrings[29], this),
									new EventDialog(Strings.frostcastleStrings[30], this),
									new EventDialog(Strings.frostcastleStrings[31], this),
									new EventDialog(Strings.frostcastleStrings[32], this),
									new EventDialog(Strings.frostcastleStrings[32], this, 
													[new MenuItemDialogChoice(Strings.frostcastleStrings[33], 
														null, new EventFlag("dialog_choices", 1)),
													 new MenuItemDialogChoice(Strings.frostcastleStrings[37], 
													 	null, new EventFlag("dialog_choices", 2))
													]),
									new EventFlag("frostking_arc", 1)
									];

		}
		else if (Reg.flags["frostking_arc"] == 1)
		{
			if (Reg.flags["dialog_choices"] == 0)  // after battle
					eventManager.addEvents([new EventDialog(Strings.frostcastleStrings[41], this),
											new EventDialog(Strings.frostcastleStrings[42], this),
											new EventDialog(Strings.frostcastleStrings[43], this),
											new EventDialog(Strings.frostcastleStrings[44], this),
											new EventDialog(Strings.frostcastleStrings[45], this),
											new EventDialog(Strings.frostcastleStrings[46], this),
											new EventDialog(Strings.frostcastleStrings[47], this),
											new EventDialog(Strings.frostcastleStrings[48], this),
											new EventDialog(Strings.frostcastleStrings[49], this),
											new EventDialog(Strings.frostcastleStrings[50], this),
											new EventDialog(Strings.frostcastleStrings[51], this),
											new EventDialog(Strings.frostcastleStrings[52], this),
											new EventDialog(Strings.frostcastleStrings[53], this),
											new EventDialog(Strings.frostcastleStrings[54], this),
											new EventDialog(Strings.frostcastleStrings[55], this),
											new EventDialog(Strings.frostcastleStrings[56], this),
											new EventDialog(Strings.frostcastleStrings[57], this),
											new EventDialog(Strings.frostcastleStrings[58], this),
											new EventDialog(Strings.frostcastleStrings[59], this),
											new EventDialog(Strings.frostcastleStrings[60], this),
											new EventDialog(Strings.frostcastleStrings[61], this),
											new EventDialog(Strings.frostcastleStrings[62], this),
											new EventFlag("frostking_arc", 2)
					]);			

			else if (Reg.flags["dialog_choices"] == 1)
				eventManager.addEvents([new EventDialog(Strings.frostcastleStrings[34], this),
										new EventDialog(Strings.frostcastleStrings[35], this),
										new EventDialog(Strings.frostcastleStrings[36], this),
										new EventBattle([new EnemyFrostKing()], this),
										new EventFlag("dialog_choices", 0)
					]);

			else if (Reg.flags["dialog_choices"] == 2)
				eventManager.addEvents([new EventDialog(Strings.frostcastleStrings[38], this),
										new EventDialog(Strings.frostcastleStrings[39], this),
										new EventDialog(Strings.frostcastleStrings[40], this),
										new EventBattle([new EnemyFrostKing()], this),
										new EventFlag("dialog_choices", 0)
					]);
		}
	}
}




