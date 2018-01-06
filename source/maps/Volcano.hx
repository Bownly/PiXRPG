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

class Volcano extends Dungeon
{
	var npcGuard1:NPC;
	var npcGuard2:NPC;
	var npcWaterkid:NPC;
	var obj7:NPC;
	var obj1:NPC;
	var obj2:NPC;
	var obj3:NPC;
	var gap0:NPC;
	var gap1:NPC;
	var grpGaps:FlxTypedGroup<NPC>;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
		_song = "housesong";

		encounterDecrementer = 1;
		encounterLowerBound = 22;
		encounterUpperBound = 33;
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		grpGaps = new FlxTypedGroup<NPC>();

		gap0 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal1"], this, "gap 0");
		gap0.setCanTurn(false);
		grpGaps.add(gap0);
		grpNPCs.add(gap0);
		gap1 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["pedestal1"], this, "gap 1");
		gap1.setCanTurn(false);
		grpNPCs.add(gap1);
		grpGaps.add(gap1);
		if (Reg.flags["volcano_obj7"] == 0)
			gap1.visible = false;
		add(grpGaps);

		// obj 7
		var n = Reg.flags["volcano_obj7"] + 7;  // 7 is the base value on the .tmx file
		obj7 = new NPC(0, 0, FlxObject.RIGHT, Reg.npcs["tempwall"], this, "obj " + n);
		obj7.setCanTurn(false);
		grpNPCs.add(obj7);

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

		if (Reg.flags["volcano_obj7"] == 0)
		{
			obj7.events = [ new EventFlag("volcano_obj7", 1),
							new EventNPCWalk([obj7], [[[FlxObject.RIGHT, 1]]], [false]),
							new EventNPCRun([obj7], [[[FlxObject.DOWN, 5]]], [false]),
							new EventSFXPlay("splash"),
							new EventNPCAdd(gap1, grpNPCs)
							];
		}
	
		// if (Reg.flags["fireking_arc"] == 0)
		// {
		// 	eventManager.addEvents([ new EventDialog(Strings.firekingdomStrings[0], this),
		// 							new EventNPCWalk([player], [[[FlxObject.DOWN, 0]]]),
		// 							new EventSwitchState("worldmap.tmx", 7)
		// 	]);
		// }
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
		}
		trace("VAL:         " + Val);
		trace("enemy arr:   " + arr);
		return arr;
	}
}




