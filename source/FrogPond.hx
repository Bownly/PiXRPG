package;

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

class FrogPond extends TownState
{

	var npc1:NPC;
	var npc2:NPC;
	var npc3:NPC;
	var npc4:NPC;
	var _events:Map<String, Array<BaseEvent>>;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);

	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		// var npc1 = new NPC(32, 32, 1, 2, 11, this, "22real");
		npc1 = new NPC(256, 256, FlxObject.DOWN, 8, this, "");
		npc2 = new NPC(336, 32, FlxObject.UP, 4, this, "dummy");
		npc3 = new NPC(336, 64, FlxObject.DOWN, 0, this, "froggo");
		npc4 = new NPC(192, 384, FlxObject.UP, 1, this, "");

		grpNPCs.add(npc1);
		grpNPCs.add(npc2);
		grpNPCs.add(npc3);
		grpNPCs.add(npc4);

		super.create();

		initializeEvents();
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();
		initializeEvents();
			
		npc1.events = [ new EventDialog(Strings.stringArray[10], this)];
		
		npc2.events = _events["talk_to_dummy"];
		if (Reg.flags["fight_dummy"] == 1)  // if you agreed to fight him
			eventManager.addEvents(_events["fight_dummy"]);
		else if (Reg.flags["fight_dummy"] == -1)  // if you reject his battle proposition
			eventManager.addEvents(_events["reject_dummy"]);

		npc3.events = [new EventDialog(Strings.stringArray[3], this)];
		npc4.events = [new EventDialog(Strings.stringArray[2], this)];

	}


	public function initializeEvents():Void
	{
		_events = [

			"fight_dummy" => [new EventDialog(Strings.stringArray[17], this),
							new EventBattle([new EnemyTest()], this),
							new EventFlag("fight_dummy", 0)],
	
			"reject_dummy" => [new EventDialog(Strings.stringArray[18], this),
								new EventFlag("fight_dummy", 0)],

			"talk_to_dummy" => [new EventDialog(Strings.stringArray[10], this,
												[new MenuItemDialogChoice(Strings.stringArray[15], null, 
																		new EventFlag("fight_dummy", 1)),
												new MenuItemDialogChoice(Strings.stringArray[16], null, 
																		new EventFlag("fight_dummy", -1))
												])]
		];
	}

}




