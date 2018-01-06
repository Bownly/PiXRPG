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

class FrostCave2 extends Dungeon
{
	var boat5:NPC;
	var boat6:NPC;
	var boat7:NPC;
	var boat8:NPC;
	var boat9:NPC;
	var boat10:NPC;
	var boat11:NPC;
	var boat12:NPC;
	var boat13:NPC;
	var boat14:NPC;
	var boat15:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "shadilay";

		encounterDecrementer = 1;
		encounterLowerBound = 0;
		encounterUpperBound = 0;
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();

		boat5 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 5-"+Reg.flags["froscav_boat5"]);
		boat5.setCanTurn(false);
		grpNPCs.add(boat5);
		boat6 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 6-"+Reg.flags["froscav_boat6"]);
		boat6.setCanTurn(false);
		grpNPCs.add(boat6);
		boat7 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 7-"+Reg.flags["froscav_boat7"]);
		boat7.setCanTurn(false);
		grpNPCs.add(boat7);
		boat8 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 8-"+Reg.flags["froscav_boat8"]);
		boat8.setCanTurn(false);
		grpNPCs.add(boat8);
		boat9 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 9-"+Reg.flags["froscav_boat9"]);
		boat9.setCanTurn(false);
		grpNPCs.add(boat9);
		boat10 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 10-"+Reg.flags["froscav_boat10"]);
		boat10.setCanTurn(false);
		grpNPCs.add(boat10);
		boat11 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 11-"+Reg.flags["froscav_boat11"]);
		boat11.setCanTurn(false);
		grpNPCs.add(boat11);
		boat12 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 12-"+Reg.flags["froscav_boat12"]);
		boat12.setCanTurn(false);
		grpNPCs.add(boat12);
		boat13 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 13-"+Reg.flags["froscav_boat13"]);
		boat13.setCanTurn(false);
		grpNPCs.add(boat13);
		boat14 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 14-"+Reg.flags["froscav_boat14"]);
		boat14.setCanTurn(false);
		grpNPCs.add(boat14);
		boat15 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 15-"+Reg.flags["froscav_boat15"]);
		boat15.setCanTurn(false);
		grpNPCs.add(boat15);

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		// boat 5 block
		if (Reg.flags["froscav_boat5"] == 0)
			boat5.events = [new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
							new EventNPCRun([player, boat5], [[[FlxObject.UP, 7]], [[FlxObject.UP, 7]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
							new EventFlag("froscav_boat5", 1)
			];
		else
			boat5.events = [new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
							new EventNPCRun([player, boat5], [[[FlxObject.DOWN, 7]], [[FlxObject.DOWN, 7]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
							new EventFlag("froscav_boat5", 0)
			];
		
		// boat 6 block
		if (Reg.flags["froscav_boat6"] == 0)
			boat6.events = [new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventNPCRun([player, boat6], [[[FlxObject.LEFT, 4]], [[FlxObject.LEFT, 4]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventFlag("froscav_boat6", 1)
			];
		else
			boat6.events = [new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventNPCRun([player, boat6], [[[FlxObject.RIGHT, 4]], [[FlxObject.RIGHT, 4]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventFlag("froscav_boat6", 0)
			];

		// boat 7 block
		if (Reg.flags["froscav_boat7"] == 0)
			boat7.events = [new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventNPCRun([player, boat7], [[[FlxObject.LEFT, 10]], [[FlxObject.LEFT, 10]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventFlag("froscav_boat7", 1)
			];
		else
			boat7.events = [new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventNPCRun([player, boat7], [[[FlxObject.RIGHT, 10]], [[FlxObject.RIGHT, 10]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventFlag("froscav_boat7", 0)
			];

		// boat 8 block
		if (Reg.flags["froscav_boat8"] == 0)
			boat8.events = [new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
							new EventNPCRun([player, boat8], [[[FlxObject.UP, 12]], [[FlxObject.UP, 12]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
							new EventFlag("froscav_boat8", 1)
			];
		else
			boat8.events = [new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
							new EventNPCRun([player, boat8], [[[FlxObject.DOWN, 12]], [[FlxObject.DOWN, 12]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
							new EventFlag("froscav_boat8", 0)
			];
		
		// boat 9 block
		if (Reg.flags["froscav_boat9"] == 0)
			boat9.events = [new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
							new EventNPCRun([player, boat9], [[[FlxObject.DOWN, 5]], [[FlxObject.DOWN, 5]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
							new EventFlag("froscav_boat9", 1)
			];
		else
			boat9.events = [new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
							new EventNPCRun([player, boat9], [[[FlxObject.UP, 5]], [[FlxObject.UP, 5]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
							new EventFlag("froscav_boat9", 0)
			];
		
		// boat 10 block
		if (Reg.flags["froscav_boat10"] == 0)
			boat10.events = [new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventNPCRun([player, boat10], [[[FlxObject.RIGHT, 17]], [[FlxObject.RIGHT, 17]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventFlag("froscav_boat10", 1)
			];
		else
			boat10.events = [new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventNPCRun([player, boat10], [[[FlxObject.LEFT, 17]], [[FlxObject.LEFT, 17]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventFlag("froscav_boat10", 0)
			];
		
		// boat 11 block
		if (Reg.flags["froscav_boat11"] == 0)
			boat11.events = [new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventNPCRun([player, boat11], [[[FlxObject.LEFT, 13]], [[FlxObject.LEFT, 13]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventFlag("froscav_boat11", 1)
			];
		else
			boat11.events = [new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventNPCRun([player, boat11], [[[FlxObject.RIGHT, 13]], [[FlxObject.RIGHT, 13]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventFlag("froscav_boat11", 0)
			];

		// boat 12 block
		if (Reg.flags["froscav_boat12"] == 0)
			boat12.events = [new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
							new EventNPCRun([player, boat12], [[[FlxObject.UP, 3]], [[FlxObject.UP, 3]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
							new EventFlag("froscav_boat12", 1)
			];
		else
			boat12.events = [new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
							new EventNPCRun([player, boat12], [[[FlxObject.DOWN, 3]], [[FlxObject.DOWN, 3]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
							new EventFlag("froscav_boat12", 0)
			];
		
		// boat 13 block
		if (Reg.flags["froscav_boat13"] == 0)
			boat13.events = [new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventNPCRun([player, boat13], [[[FlxObject.LEFT, 3]], [[FlxObject.LEFT, 3]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventFlag("froscav_boat13", 1)
			];
		else
			boat13.events = [new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventNPCRun([player, boat13], [[[FlxObject.RIGHT, 3]], [[FlxObject.RIGHT, 3]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventFlag("froscav_boat13", 0)
			];
		
		// boat 14 block
		if (Reg.flags["froscav_boat14"] == 0)
			boat14.events = [new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventNPCRun([player, boat14], [[[FlxObject.LEFT, 2]], [[FlxObject.LEFT, 2]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventFlag("froscav_boat14", 1)
			];
		else
			boat14.events = [new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventNPCRun([player, boat14], [[[FlxObject.RIGHT, 2]], [[FlxObject.RIGHT, 2]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventFlag("froscav_boat14", 0)
			];

		// boat 15 block
		if (Reg.flags["froscav_boat15"] == 0)
			boat15.events = [new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
							new EventNPCRun([player, boat15], [[[FlxObject.DOWN, 13]], [[FlxObject.DOWN, 13]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
							new EventFlag("froscav_boat15", 1)
			];
		else if (Reg.flags["froscav_boat15"] == 1)
		{
			if (player.y > boat15.y) // player is to the south
 			{
				boat15.events = [new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
								new EventNPCRun([player, boat15], [[[FlxObject.UP, 13]], [[FlxObject.UP, 13]]], [false, false]),
								new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
								new EventFlag("froscav_boat15", 0)
				];
			}
			else if (player.x > boat15.x)  // if player is to the east
			{
				boat15.events = [new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
								new EventNPCRun([player, boat15], [[[FlxObject.LEFT, 10]], [[FlxObject.LEFT, 10]]], [false, false]),
								new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
								new EventFlag("froscav_boat15", 2)
				];
			}
		}
		else if (Reg.flags["froscav_boat15"] == 2)
		{
			if (player.x < boat15.x)  // if player is to the west
			{
				boat15.events = [new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
								new EventNPCRun([player, boat15], [[[FlxObject.RIGHT, 10]], [[FlxObject.RIGHT, 10]]], [false, false]),
								new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
								new EventFlag("froscav_boat15", 1)
				];
			}
			else if (player.y > boat15.y) // player is to the south
 			{
				boat15.events = [new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
								new EventNPCRun([player, boat15], [[[FlxObject.UP, 5]], [[FlxObject.UP, 5]]], [false, false]),
								new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
								new EventFlag("froscav_boat15", 3)
				];
			}
		}
		else if (Reg.flags["froscav_boat15"] == 3)
		{
			if (player.y < boat15.y) // player is to the north
 			{
				boat15.events = [new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
								new EventNPCRun([player, boat15], [[[FlxObject.DOWN, 5]], [[FlxObject.DOWN, 5]]], [false, false]),
								new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
								new EventFlag("froscav_boat15", 2)
				];
			}
			else if (player.x > boat15.x)  // if player is to the east
			{
				boat15.events = [new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
								new EventNPCRun([player, boat15], [[[FlxObject.LEFT, 5]], [[FlxObject.LEFT, 5]]], [false, false]),
								new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
								new EventFlag("froscav_boat15", 4)
				];
			}
		}
		else if (Reg.flags["froscav_boat15"] == 4)
			boat15.events = [new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventNPCRun([player, boat15], [[[FlxObject.RIGHT, 5]], [[FlxObject.RIGHT, 5]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventFlag("froscav_boat15", 3)
			];

	}

	override private function calculateEncounter(Val:Int):Array<EnemyClasses.BaseEnemy>
	{
		var arr:Array<EnemyClasses.BaseEnemy> = [];

		switch (Val)
		{
			case 1: arr.push(new EnemyClasses.EnemyKettle());
			case 2: arr.push(new EnemyClasses.EnemyKettle());
			case 3: arr.push(new EnemyClasses.EnemyKettle());
			case 4: arr.push(new EnemyClasses.EnemyKettle());
			case 5: arr.push(new EnemyClasses.EnemyKettle());
			case 6: arr.push(new EnemyClasses.EnemyKettle());
			case 7: arr.push(new EnemyClasses.EnemyKettle());
			case 15: arr.push(new EnemyClasses.EnemyTest());
			case 16: arr.push(new EnemyClasses.EnemyTest());
			default: arr.push(new EnemyClasses.EnemyTest());
		}
		trace("VAL:         " + Val);
		trace("enemy arr:   " + arr);
		if (arr == [])
			arr.push(new EnemyClasses.EnemyKettle());
		return arr;
	}
}




