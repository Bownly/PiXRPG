package maps;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

import DialogClasses;
import EventClasses;
import EnemyClasses;
import MenuClasses;

/**
 * ...
 * @author Bownly
 */

class FrogPondDocks extends TownState
{
	var npcBoat:NPC;
	var npcDoor:NPC;
	var npcFroggo:NPC;
	var _sprTitle:FlxSprite;
	var _txtTitle:FlxText;
	var _txtPrologue:FlxText;
	var _txtThanks:FlxText;

	public function new(EntranceID:Int, MapName:String, ?SongName:String, ?Dungeon:Bool) 
		super(EntranceID, MapName, SongName, Dungeon);

	override public function create():Void
	{
		grpNPCs = new FlxTypedGroup<NPC>();

		if (Reg.flags["owl_clan_attack"] == 4)
		{
			npcFroggo = new NPC(256, 256, FlxObject.UP, 0, this, "npc 0");
			grpNPCs.add(npcFroggo);
			npcFroggo.visible = false;		
		}
		if (Reg.flags["owl_clan_attack"] == 5)
		{
			npcFroggo = new NPC(256, 256, FlxObject.LEFT, 0, this, "npc 2");
			grpNPCs.add(npcFroggo);
		}
		else
		{
			npcDoor = new NPC(0, 0, FlxObject.DOWN, 9, this, "npc door");
			grpNPCs.add(npcDoor);	
		}

		npcBoat = new NPC(0, 0, FlxObject.RIGHT, 12, this, "npc 1");
		grpNPCs.add(npcBoat);


		super.create();
		
		_sprTitle = new FlxSprite(0, 48);
		_sprTitle.loadGraphic(AssetPaths.title_logo__png, true, 320, 32);
		_sprTitle.x = (player.x - _sprTitle.width/2 + 8);  // 9 is a somewhat arbitrary spacing to match the credits state

		// _txtTitle = new FlxText(0, 0, Strings.stringVars["%title%"], 32);
		// _txtTitle.y = (FlxG.height - _txtTitle.height * 3) / 2;
		// _txtTitle.x = (player.x - _txtTitle.width/2 + 9);  // 9 is a somewhat arbitrary spacing to match the credits state

		_txtPrologue = new FlxText(0, 0, "End of Prologue", 24);
		_txtPrologue.y = (_sprTitle.y + _sprTitle.height + 8);
		_txtPrologue.x = (player.x - _txtPrologue.width/2 + 8);
		_txtPrologue.visible = false;

		_txtThanks = new FlxText(0, 0, "Thanks For Playing!", 24);
		_txtThanks.y = (_txtPrologue.y + _txtPrologue.height + 8);
		_txtThanks.x = (player.x - _txtThanks.width/2 + 8);
		_txtThanks.visible = false;

		add(_sprTitle);
		add(_txtPrologue);
		// add(_txtThanks);
		assignEvents();
	}
	
	override public function assignEvents():Void
	{
		super.assignEvents();

		if (npcDoor != null)
			npcDoor.events = [new EventDialog(Strings.frogponddocksStrings[0], this)];

		if (Reg.flags["owl_clan_attack"] == 4)
			npcDoor.events = [new EventNPCAdd(npcFroggo, grpNPCs),
							  new EventNPCWalk(npcFroggo, [[FlxObject.RIGHT, 1], [FlxObject.LEFT, 0]]),
							  new EventDialog(Strings.frogponddocksStrings[1], this),  // hold on a moment, I'll have to unlock the door
							  new EventNPCWalk(player, [[FlxObject.LEFT, 1], [FlxObject.RIGHT, 0]]),
							  new EventNPCWalk(npcFroggo, [[FlxObject.LEFT, 1], [FlxObject.UP, 0]]),
							  new EventZaWarudo(0.5),
							  new EventNPCRemove(npcDoor),
							  new EventNPCWalk(npcFroggo, [[FlxObject.LEFT, 0]]),
							  new EventZaWarudo(0.5),
							  new EventDialog(Strings.frogponddocksStrings[2], this),  // but first, I want to test you
							  new EventBattle([new EnemyFroggo()], this, "owl_clan_attack", 5),
							  new EventDialog(Strings.frogponddocksStrings[3], this),  // good job kid, peace out, door removed
							  new EventNPCWalk(npcFroggo, [[FlxObject.RIGHT, 1], [FlxObject.LEFT, 0]]),
							];
		else if (Reg.flags["owl_clan_attack"] == 5)
		{
			npcFroggo.events = [new EventDialog(Strings.frogponddocksStrings[4], this)];  // frogspeed, pname, believe in yourself
			npcBoat.events = [new EventDialog(Strings.frogponddocksStrings[5], this,  // am I ready for this?
								 [new MenuItemDialogChoice(Strings.frogponddocksStrings[6],  // yes
									null, new EventFlag("end_prologue", 1)),
								  new MenuItemDialogChoice(Strings.frogponddocksStrings[7],  // not yet
								 	null, new EventFlag("end_prologue", -1))
								 ]),
							 ];
		}
		if (Reg.flags["end_prologue"] == 1)
		{
			eventManager.addEvents([new EventMusicStop(),
									new EventMusicPlay("shadilay"),
									new EventNPCWalk(player, [[FlxObject.UP, 1]]),
									new EventNPCRemove(player),
									new EventNPCWalk(npcFroggo, [[FlxObject.UP, 0]]),
									new EventNPCWalk(npcBoat, [[FlxObject.RIGHT, 12]]),
									new EventZaWarudo(1.7),
									new EventNPCWalk(player, [[FlxObject.DOWN, 8]]),
									new EventZaWarudo(1.95),
									new EventNPCWalk(npcFroggo, [[FlxObject.DOWN, 0]]),
									new EventZaWarudo(1.1),
									new EventNPCWalk(npcFroggo, [[FlxObject.DOWN, 4], [FlxObject.LEFT, 1], 
																 [FlxObject.DOWN, 2]]),
									new EventNPCRemove(npcFroggo),
									new EventZaWarudo(1.35),
									new EventNPCWalk(player, [[FlxObject.UP, 44]]),
									new EventZaWarudo(3),
									new EventTextShowOrHide(_txtPrologue, true),
									// new EventTextShowOrHide(_txtThanks, true),
									new EventFlag("end_prologue", 0),
									new EventZaWarudo(15),
									new EventSwitchState("credits")
									]);
		}
		else if (Reg.flags["end_prologue"] == -1)
		{
			eventManager.addEvents([new EventNPCWalk(player, [[FlxObject.DOWN, 1]]),
									new EventFlag("end_prologue", 0)
									]);
		}
		


	}
}





