package;

import flixel.FlxObject;
import flixel.group.FlxGroup;


/**
 * ...
 * @author Bownly
 */

class FrogPond extends TownState
{

	var npc1:NPC;
	var npc2:NPC;
	var npc3:NPC;

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
		npc2 = new NPC(16, 32, 1, 1, this, "busyguy");
		npc3 = new NPC(240, 160, 1, 2, this, "");

		grpNPCs.add(npc1);
		grpNPCs.add(npc2);
		grpNPCs.add(npc3);


		super.create();

		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		// if (Reg.flags["a"] == true)
		// {
		// 	npc2.dialogBox = new DialogClasses.DialogBox(Strings.stringArray[3]);
		// }
		// else
		// {
		// 	npc1.dialogBox = new DialogClasses.DialogBox(Strings.stringArray[0], npc1, [[FlxObject.UP, 2], [FlxObject.RIGHT, 1]]);
		// 	npc2.dialogBox = new DialogClasses.DialogBox(Strings.stringArray[1], npc2, "a");
		// }

	}
}




