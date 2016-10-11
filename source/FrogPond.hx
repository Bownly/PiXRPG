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

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);

	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		// var npc1 = new NPC(32, 32, 1, 2, 11, this, "22real");
		// var npc2 = new NPC(16, 32, 1, 4, 12, this, "busyguy");
		npc1 = new NPC(32, 32, 1, 2, this, "22real");
		npc2 = new NPC(16, 32, 1, 0, this, "busyguy");
		npc3 = new NPC(240, 160, 1, 3, this, "");
		npc4 = new NPC(368, 32, 16, 2, this, "");

		grpNPCs.add(npc1);
		grpNPCs.add(npc2);
		grpNPCs.add(npc3);
		grpNPCs.add(npc4);

		super.create();

		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();

			
		npc1.events = [ new EventDialog(new DialogBox(Strings.stringArray[0]), this)];
		npc2.events = [ new EventDialog(new DialogBox(Strings.stringArray[8], 
										[new MenuItemFlag("Save", 0, null, new EventFlag("Save", 1)),
										 new MenuItemFlag("Don't save", 0, null, new EventFlag("Save", -1))]),
										this),
						new EventSaveGame(2, mapName)
						];
		npc3.events = [new EventDialog(new DialogBox(Strings.stringArray[4]), this)];
		npc4.events = [new EventDialog(new DialogBox(Strings.stringArray[3]), this)];


		// if (Reg.flags["AorB"] == 1)
		// {
		// 	eventManager.addEvent(new EventDialog(new DialogBox(Strings.stringArray[6]), this));
		// 	eventManager.addEvent(new EventFlag("AorB", 0));
		// }
	


	}
}




