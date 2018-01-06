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

class Well2 extends TownState
{
	var npcBill:NPC;
	var npcOwl:NPC;
	var npcSign1:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "cavesong";
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();

		// npcSign1 = new NPC(0, 0, FlxObject.UP, Reg.npcs["sign1"], this, "npc sign 1");
		// npcSign1.setCanTurn(false);
		npcBill = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["frogman"], this, "npc bill");
		npcOwl = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["owl"], this, "npc owl");
		// grpNPCs.add(npcSign1);	
		grpNPCs.add(npcBill);	
		grpNPCs.add(npcOwl);	
		
		// if (Reg.flags["waterkid_in_hut"] <= 2)
		// {
		// 	npcGuard = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["frostguard"], this, "npc 0");
		// 	grpNPCs.add(npcGuard);	
		// }

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		if (Reg.flags["waterkid_in_hut"] == 3)  // with waterkid in party
		{
			eventManager.addEvents([   
									new EventNPCWalk([npcBill], [[[FlxObject.DOWN, 1], [FlxObject.UP, 0]]]),
									new EventDialog(Strings.wellStrings[20], this),

									new EventNPCWalk([npcBill], [[[FlxObject.DOWN, 3], [FlxObject.LEFT, 6]]]),
									new EventNPCRun([npcBill], [[[FlxObject.RIGHT, 6], [FlxObject.UP, 3]]]),
									new EventDialog(Strings.wellStrings[21], this),
									new EventDialog(Strings.wellStrings[22], this),
									new EventDialog(Strings.wellStrings[23], this),
									new EventDialog(Strings.wellStrings[24], this),
									new EventDialog(Strings.wellStrings[25], this),
									new EventDialog(Strings.wellStrings[26], this),
									new EventDialog(Strings.wellStrings[27], this),
									new EventNPCRun([npcBill], [[[FlxObject.DOWN, 3], [FlxObject.LEFT, 7]]]),
									new EventDialog(Strings.wellStrings[28], this),
									new EventNPCRun([npcBill], [[[FlxObject.LEFT, 4], [FlxObject.UP, 1], [FlxObject.LEFT, 0]]]),
									new EventDialog(Strings.wellStrings[29], this),
							  		new EventFlag("waterkid_in_hut", 4)
									]);


			npcOwl.events = [new EventBattle([new EnemyOwl()], this, "waterkid_in_hut", 4, "miniboss")];

			// npcGuard.events = [ new EventNPCAdd(npcWaterkid),
			// 					new EventNPCWalk([player, npcWaterkid], [[[FlxObject.DOWN, 1], [FlxObject.UP, 0]], 
			// 															[[FlxObject.UP, 0]]]),
			// 					new EventDialog(Strings.frostkingdomStrings[1], this),
			// 					new EventDialog(Strings.frostkingdomStrings[2], this),
			// 					new EventDialog(Strings.frostkingdomStrings[3], this),
			// 					new EventDialog(Strings.frostkingdomStrings[4], this),
			// 					new EventNPCWalk([npcWaterkid, player], [[[FlxObject.DOWN, 1]],
			// 															 [[FlxObject.RIGHT, 1]]]),
			// 					new EventNPCWalk([npcGuard], [[[FlxObject.DOWN, 1], [FlxObject.LEFT, 1], [FlxObject.RIGHT, 0]]]),
			// 					new EventNPCWalk([npcWaterkid, player], [[[FlxObject.RIGHT, 0]],
			// 															 [[FlxObject.LEFT, 0]]]),
			// 					new EventDialog(Strings.frostkingdomStrings[5], this),
			// 					new EventNPCWalk([npcWaterkid], [[[FlxObject.RIGHT, 1]]]),
			// 					new EventNPCRemove(npcWaterkid),
			// 			  		new EventFlag("waterkid_in_hut", 4)
			// 			  		];
		}
	}
}




