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

class FrostCave1 extends Dungeon
{
	var boat1:NPC;
	var boat2:NPC;
	var boat3:NPC;
	var boat4:NPC;

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

		boat1 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 1-"+Reg.flags["froscav_boat1"]);
		boat1.setCanTurn(false);
		grpNPCs.add(boat1);
		boat2 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 2-"+Reg.flags["froscav_boat2"]);
		boat2.setCanTurn(false);
		grpNPCs.add(boat2);
		boat3 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 3-"+Reg.flags["froscav_boat3"]);
		boat3.setCanTurn(false);
		grpNPCs.add(boat3);
		boat4 = new NPC(0, 0, FlxObject.UP, Reg.npcs["raft"], this, "boat 4-"+Reg.flags["froscav_boat4"]);
		boat4.setCanTurn(false);
		grpNPCs.add(boat4);

		if (Reg.flags["monshou_ice"] == 0)
			boat1.visible = false;

		super.create();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		// boat 1 block
		if (Reg.flags["froscav_boat1"] == 0)
			boat1.events = [new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventNPCRun([player, boat1], [[[FlxObject.RIGHT, 14]], [[FlxObject.RIGHT, 14]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventFlag("froscav_boat1", 1)

			];
		else
			boat1.events = [new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventNPCRun([player, boat1], [[[FlxObject.LEFT, 14]], [[FlxObject.LEFT, 14]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventFlag("froscav_boat1", 0)
			];
		
		// boat 2 block
		if (Reg.flags["froscav_boat2"] == 0)
			boat2.events = [new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
							new EventNPCRun([player, boat2], [[[FlxObject.UP, 3]], [[FlxObject.UP, 3]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
							new EventFlag("froscav_boat2", 1)

			];
		else
			boat2.events = [new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
							new EventNPCRun([player, boat2], [[[FlxObject.DOWN, 3]], [[FlxObject.DOWN, 3]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
							new EventFlag("froscav_boat2", 0)
			];
				
		// boat 3 block
		if (Reg.flags["froscav_boat3"] == 0)
		{
			if (player.x < boat3.x)  // if player is to the west
			{
				boat3.events = [new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
								new EventNPCRun([player, boat3], [[[FlxObject.RIGHT, 31]], [[FlxObject.RIGHT, 31]]], [false, false]),
								new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
								new EventFlag("froscav_boat3", 1)
				];
			}
			else if (player.y < boat3.y) // player is to the north
 			{
				boat3.events = [new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
								new EventNPCRun([player, boat3], [[[FlxObject.DOWN, 12]], [[FlxObject.DOWN, 12]]], [false, false]),
								new EventNPCWalk([player], [[[FlxObject.DOWN, 1]]]),
								new EventFlag("froscav_boat3", 2)
				];
			}
		}
		else if (Reg.flags["froscav_boat3"] == 1)
			boat3.events = [new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventNPCRun([player, boat3], [[[FlxObject.LEFT, 31]], [[FlxObject.LEFT, 31]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventFlag("froscav_boat3", 0)
			];
		else if (Reg.flags["froscav_boat3"] == 2)
			boat3.events = [new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
							new EventNPCRun([player, boat3], [[[FlxObject.UP, 12]], [[FlxObject.UP, 12]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.UP, 1]]]),
							new EventFlag("froscav_boat3", 0)
			];

		// boat 4 block
		if (Reg.flags["froscav_boat4"] == 0)
			boat4.events = [new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventNPCRun([player, boat4], [[[FlxObject.LEFT, 4]], [[FlxObject.LEFT, 4]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.LEFT, 1]]]),
							new EventFlag("froscav_boat4", 1)
			];
		else
			boat4.events = [new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventNPCRun([player, boat4], [[[FlxObject.RIGHT, 4]], [[FlxObject.RIGHT, 4]]], [false, false]),
							new EventNPCWalk([player], [[[FlxObject.RIGHT, 1]]]),
							new EventFlag("froscav_boat4", 0)
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




