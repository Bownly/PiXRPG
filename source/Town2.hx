package;

import flixel.FlxObject;
import flixel.group.FlxGroup;

import DialogClasses;
import EventClasses;
import EnemyClasses;
import MenuClasses;

/**
 * ...
 * @author ...
 */
class Town2 extends TownState
{
	var npc1:NPC;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
	{
		super(EntranceID, MapName, SongName, Dungeon);
	}

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();
		

		npc1 = new NPC(112, 96, 1, 2, this, "saveman");

		grpNPCs.add(npc1);
		
		super.create();
		assignEvents();
	}

	override public function assignEvents():Void
	{
		// npc1.events = [ new EventDialog(new DialogBox(Strings.stringArray[8]), this),
						// new EventSaveGame(1, mapName)
						// ];
	
	}
}