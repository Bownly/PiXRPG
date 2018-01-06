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

class FrostKingd extends TownState
{
	var npcGuard:NPC;
	var npcWaterkid:NPC;
	var npcGondola:NPC;
	var npcSign1:NPC;
	var npc2:NPC;
	var npc3:NPC;
	var npc4:NPC;
	var npc5:NPC;
	var npc6:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "housesong";
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();

		npcGondola = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["gondolagirl"], this, "npc gondola");
		npcSign1 = new NPC(0, 0, FlxObject.UP, Reg.npcs["sign1"], this, "npc sign 1");
		npcSign1.setCanTurn(false);
		npc2 = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["frostman"], this, "npc 2");
		npc3 = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["frostwoman"], this, "npc 3");
		npc4 = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["frostboy"], this, "npc 4");
		npc5 = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["frostgirl"], this, "npc 5");
		npc6 = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["frostking"], this, "npc 6");
		grpNPCs.add(npcGondola);	
		grpNPCs.add(npcSign1);	
		grpNPCs.add(npc2);	
		grpNPCs.add(npc3);	
		grpNPCs.add(npc4);	
		grpNPCs.add(npc5);	
		grpNPCs.add(npc6);	
		

		if (Reg.flags["waterkid_in_hut"] <= 2)
		{
			npcGuard = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["frostguard"], this, "npc 0");
			grpNPCs.add(npcGuard);	
		}
		if (Reg.flags["waterkid_in_hut"] == 3)
		{
			npcGuard = new NPC(0, 0, FlxObject.DOWN, Reg.npcs["frostguard"], this, "npc 0");
			npcWaterkid = new NPC(0, 0, FlxObject.UP, Reg.npcs["waterkid"], this, "npc 1");
			npcWaterkid.visible = false;
			grpNPCs.add(npcGuard);	
			grpNPCs.add(npcWaterkid);	
		}


		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		// obj0.events = [new EventDialog(Strings.mchouseStrings[1], this)];
		// obj1.events = [new EventDialog(Strings.mchouseStrings[2], this)];
		// obj2.events = [new EventDialog(Strings.mchouseStrings[3], this)];
		// obj3.events = [new EventDialog(Strings.mchouseStrings[3], this)];

		if (Reg.flags["waterkid_in_hut"] < 3)  // before waterkid confession
		{
			var events = [
						  new EventDialog(Strings.frostcastleStrings[0], this),
						  // new EventDialog(Strings.frostcastleStrings[1], this),
						  // new EventDialog(Strings.frostcastleStrings[2], this),
						  // new EventDialog(Strings.frostcastleStrings[3], this),
						  // new EventDialog(Strings.frostcastleStrings[4], this),
						  // new EventDialog(Strings.frostcastleStrings[5], this),
						  // new EventDialog(Strings.frostcastleStrings[6], this),
						  // new EventDialog(Strings.frostcastleStrings[7], this),
						  // new EventDialog(Strings.frostcastleStrings[8], this),
						  // new EventDialog(Strings.frostcastleStrings[9], this),
						  // new EventDialog(Strings.frostcastleStrings[10], this),
						  // new EventDialog(Strings.frostcastleStrings[11], this),
						  // new EventDialog(Strings.frostcastleStrings[12], this),
						  // new EventDialog(Strings.frostcastleStrings[13], this),
						  // new EventDialog(Strings.frostcastleStrings[14], this),
						  // new EventDialog(Strings.frostcastleStrings[15], this),
						  // new EventDialog(Strings.frostcastleStrings[16], this),
						  // new EventDialog(Strings.frostcastleStrings[17], this),
						  // new EventDialog(Strings.frostcastleStrings[18], this),
						  // new EventDialog(Strings.frostcastleStrings[19], this),
						  // new EventDialog(Strings.frostcastleStrings[20], this),
						  // new EventDialog(Strings.frostcastleStrings[21], this),
						  // new EventDialog(Strings.frostcastleStrings[22], this),
						  // new EventDialog(Strings.frostcastleStrings[23], this),
						  // new EventDialog(Strings.frostcastleStrings[24], this),
								// new EventNPCWalk([npcGuard], [[[FlxObject.DOWN, 0]]]),
						  // new EventDialog(Strings.frostcastleStrings[25], this),
						  // new EventDialog(Strings.frostcastleStrings[26], this),
						  // new EventDialog(Strings.frostcastleStrings[27], this),
						  // new EventDialog(Strings.frostcastleStrings[28], this),
						  // new EventDialog(Strings.frostcastleStrings[29], this),
						  // new EventDialog(Strings.frostcastleStrings[30], this),
						  // new EventDialog(Strings.frostcastleStrings[31], this),
						  // new EventDialog(Strings.frostcastleStrings[32], this),
						  // new EventDialog(Strings.frostcastleStrings[33], this),
						  // new EventDialog(Strings.frostcastleStrings[34], this),
						  // new EventDialog(Strings.frostcastleStrings[35], this),
						  // new EventDialog(Strings.frostcastleStrings[36], this),
						  // new EventDialog(Strings.frostcastleStrings[37], this),
						  // new EventDialog(Strings.frostcastleStrings[38], this),
						  // new EventDialog(Strings.frostcastleStrings[39], this),
						  // new EventDialog(Strings.frostcastleStrings[40], this),
							 //  new EventBattle([new EnemyFroggo()], this),
						  // new EventDialog(Strings.frostcastleStrings[41], this),
						  // new EventDialog(Strings.frostcastleStrings[42], this),
						  // new EventDialog(Strings.frostcastleStrings[43], this),
						  // new EventDialog(Strings.frostcastleStrings[44], this),
						  // new EventDialog(Strings.frostcastleStrings[45], this),
						  // new EventDialog(Strings.frostcastleStrings[46], this),
						  // new EventDialog(Strings.frostcastleStrings[47], this),
						  // new EventDialog(Strings.frostcastleStrings[48], this),
						  // new EventDialog(Strings.frostcastleStrings[49], this),
						  // new EventDialog(Strings.frostcastleStrings[50], this),
						  // new EventDialog(Strings.frostcastleStrings[51], this),
						  // new EventDialog(Strings.frostcastleStrings[52], this),
						  // new EventDialog(Strings.frostcastleStrings[53], this),
						  // new EventDialog(Strings.frostcastleStrings[54], this),
						  // new EventDialog(Strings.frostcastleStrings[55], this),
						  // new EventDialog(Strings.frostcastleStrings[56], this),
						  // new EventDialog(Strings.frostcastleStrings[57], this),
						  // new EventDialog(Strings.frostcastleStrings[58], this),
						  // new EventDialog(Strings.frostcastleStrings[59], this),
						  // new EventDialog(Strings.frostcastleStrings[60], this),
						  // new EventDialog(Strings.frostcastleStrings[61], this),
						  new EventFlag("waterkid_in_hut", 2)];
			npcGuard.events = events;
		}
		else if (Reg.flags["waterkid_in_hut"] == 3)  // with waterkid in party
		{

			npcGuard.events = [ 

								// test
								new EventDialog(Strings.hivekingdomStrings[0], this),
								new EventDialog(Strings.hivekingdomStrings[1], this),
								new EventDialog(Strings.hivekingdomStrings[2], this),
								new EventDialog(Strings.hivekingdomStrings[3], this),
								new EventDialog(Strings.hivekingdomStrings[4], this),
								new EventDialog(Strings.hivekingdomStrings[5], this),
								new EventDialog(Strings.hivekingdomStrings[6], this),
								new EventDialog(Strings.hivekingdomStrings[7], this),
								new EventDialog(Strings.hivekingdomStrings[8], this),
								new EventDialog(Strings.hivekingdomStrings[9], this),
								new EventDialog(Strings.hivekingdomStrings[10], this),
								new EventDialog(Strings.hivekingdomStrings[11], this),
								new EventDialog(Strings.hivekingdomStrings[12], this),
								new EventDialog(Strings.hivekingdomStrings[13], this),
								new EventDialog(Strings.hivekingdomStrings[14], this),
								new EventDialog(Strings.hivekingdomStrings[15], this),
								new EventDialog(Strings.hivekingdomStrings[16], this),
								new EventDialog(Strings.hivekingdomStrings[17], this),
								new EventDialog(Strings.hivekingdomStrings[18], this),




								// good(ish)
								new EventNPCAdd(npcWaterkid),
								new EventNPCWalk([player, npcWaterkid], [[[FlxObject.DOWN, 1], [FlxObject.UP, 0]], 
																		[[FlxObject.UP, 0]]]),
								new EventDialog(Strings.frostkingdomStrings[1], this),
								new EventDialog(Strings.frostkingdomStrings[2], this),
								new EventDialog(Strings.frostkingdomStrings[3], this),
								new EventDialog(Strings.frostkingdomStrings[4], this),
								new EventDialog(Strings.frostkingdomStrings[5], this),
								new EventDialog(Strings.frostkingdomStrings[6], this),
								new EventDialog(Strings.frostkingdomStrings[7], this),
								new EventNPCWalk([npcWaterkid, npcGuard], [ [[FlxObject.UP, 3]],
																			[[FlxObject.UP, 3]]]),
								new EventNPCWalk([npcWaterkid], [[[FlxObject.DOWN, 0]]]),
								new EventDialog(Strings.frostkingdomStrings[8], this),
								new EventNPCWalk([npcWaterkid, npcGuard], [[[FlxObject.UP, 5]],
																		 [[FlxObject.UP, 5]]]),
								new EventNPCRemove(npcWaterkid),
								new EventNPCRemove(npcGuard),
						  		new EventFlag("waterkid_in_hut", 4)
						  		];

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
		else if (Reg.flags["waterkid_in_hut"] == 4)  // about to go see king, after talking with guard
		{

			npcGuard.events = [ new EventDialog(Strings.frostkingdomStrings[6], this),
								new EventDialog(Strings.frostkingdomStrings[7], this),
						  		];
		}
	}
}




