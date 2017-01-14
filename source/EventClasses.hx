package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

import EnemyClasses;
import MenuClasses;

/**
 * ...
 * @author Bownly
 */

class EventManager
{
	var _arr:Array<BaseEvent> = [];
	var _state:FlxState;

	public function new(S:FlxState) 
	{
		_state = S;
	}

	public function update()
	{
		if (_arr.length > 0) 
		{
			Reg.STATE = Reg.STATE_CUTSCENE;
			if (_arr[0].isAlive == false)
				_arr.shift();
			else
				_arr[0].update();
		}
		else
		{
			Reg.STATE = Reg.STATE_NORMAL;
			if (Type.getClassName(Type.getClass(_state)) != "BattleSubState")
			{	
				var _state2 = cast(_state, TownState);
				_state2.assignEvents();
			}
		}
	}

	public function addEvents(events:Array<BaseEvent>) {
		for (e in events)
			_arr.push(e);
	}

	public function getLength():Int {
		return _arr.length;
	}
}

class BaseEvent
{
	public var isAlive: Bool;

	public function new() 
	{
		isAlive = true;
	}

	public function update()
	{
	}

	public function destroy()
	{
		isAlive = false;
	}
}

class EventAddEvent extends BaseEvent
{
	var _events:Array<BaseEvent>;
	var _eManager:EventManager;

	public function new(Events:Array<BaseEvent>, EManager:EventManager)
	{
		super();
		_events = Events;
		_eManager = EManager;
	}

	override public function update()
	{
		for (event in _events)
			_eManager.addEvents([event]);
		destroy();
	}
}

class EventBattle extends BaseEvent
{
	var _enemies:Array<BaseEnemy>;
	var _state:TownState;
	var _winFlag:String;
	var _winFlagVal:Int;

	public function new(Enemies:Array<BaseEnemy>, State:TownState, ?WinFlag:String, ?WinFlagVal:Int)
	{
		super();
		_enemies = Enemies;
		_state = State;
		_winFlag = WinFlag;
		_winFlagVal = WinFlagVal;
	}

	override public function update()
	{
		destroy();
		if (_winFlag != null) {
			var sub = new BattleSubState(_enemies, _winFlag, _winFlagVal);
			_state.openSubState(sub);
		}
		else {
			var sub = new BattleSubState(_enemies);			
			_state.openSubState(sub);
		}
		super.update();
	}
}

class EventCurItemChange extends BaseEvent
{
	var _name:String;

	public function new(Name:String)
	{
		_name = Name;
		super();
	}

	override public function update()
	{
		Strings.stringVars["%item%"] = _name;
		trace("item name: ", Strings.stringVars["%item%"]);
		destroy();
	}
}

class EventDialog extends BaseEvent
{
	var _dialogBox:DialogClasses.DialogBox;
	var _state:FlxState;

	public function new(DBLine:Array<DialogClasses.DialogLine>, State:FlxState, ?Choices:Array<BaseMenuItem>)
	{
		super();
		_dialogBox = new DialogClasses.DialogBox(DBLine, Choices);
		_state = State;
	}

	override public function update()
	{
		destroy();
		var sub = new DialogSubState(_dialogBox);
		_state.openSubState(sub);
		super.update();
	}
}

class EventDialogMenu extends BaseEvent
{
	var _menu:MenuClasses.BaseMenu;
	// var _state:TownState;

	public function new(Menu:MenuClasses.BaseMenu, ?State:TownState)
	{
		super();

		// _menu = Menu;
		// _state = State;
	}

	// override public function update()
	// {
		// destroy();
		// var sub = new DialogSubState(_dialogBox);
		// _state.openSubState(sub);
		// super.update();
	// }
}

class EventFlag extends BaseEvent
{
	var _flag:String;
	var _val:Int;
	var _state:TownState;

	public function new(Flag:String, Val:Int, ?State:TownState)
	{
		super();
		_flag = Flag;
		_val = Val;
		_state = State;
	}

	override public function update()
	{
		Reg.flags[_flag] = _val;
		destroy();
	}

	// override public function destroy()
	// {
	// 	super.destroy();
	// }
}

class EventHealPlayer extends BaseEvent
{
	var _amt:Int;

	public function new(?NewMP:Int)
	{
		super();
		if (NewMP > 0)
			_amt = NewMP;
		else
			_amt = Player.maxmp;
	}

	override public function update()
	{
		Player.healMP(_amt);
		destroy();
	}	
}

class EventItemGet extends BaseEvent
{
	var _item:ItemClasses.BaseItem;

	public function new(Item:ItemClasses.BaseItem)
	{
		_item = Item;
		super();
	}

	override public function update()
	{
		ItemClasses.InventoryManager.arr.push(_item);
		destroy();
	}
}

class EventNPCRemove extends BaseEvent
{
	var _npc:NPC;

	public function new(Npc:NPC)
	{
		super();
		_npc = Npc;
	}

	override public function update()
	{
		_npc.visible = false;
		destroy();
	}
}

class EventNPCTrigger extends BaseEvent
{
	var _npc:NPC;
	var _dir:Int;

	public function new(Npc:NPC, ?Dir:Int)
	{
		super();
		_npc = Npc;
		_dir = Dir;
	}

	override public function update()
	{
		_npc.triggered(_dir);
		destroy();
	}
}

class EventNPCWalk extends BaseEvent
{
	var _npc:NPC;
	var _path:Array<Array<Int>>;
	private static inline var MOVEMENT_SPEED:Int = 1;
	public var baseX:Float;
	public var baseY:Float;

	// public var isMoving:Bool;

	public function new(Npc:NPC, Path:Array<Array<Int>>)
	{
		super();
		_npc = Npc;
		_path = Path;
		baseX = _npc.x;
		baseY = _npc.y;
	}

	override public function update()
	{
		if (_path.length > 0)
		{
			Reg.STATE = Reg.STATE_CUTSCENE;
			switch (_path[0][0])
			{
				case FlxObject.UP:
				{
					// if not done moving
					if (Std.int(Math.abs(baseY - _npc.y)) != _path[0][1] * 16)
					{
						_npc.y -= MOVEMENT_SPEED;
						_npc.animation.play("up");
					}
					else
					{
						popOffDirection();
					}
				}
				case FlxObject.DOWN:
				{
					if (Std.int(Math.abs(baseY - _npc.y)) != _path[0][1] * 16)
					{
						_npc.y += MOVEMENT_SPEED;
						_npc.animation.play("dn");
					}
					else
					{
						popOffDirection();
					}
				}
				case FlxObject.LEFT:
				{
					if (Std.int(Math.abs(baseX - _npc.x)) != _path[0][1] * 16)
					{
						_npc.x -= MOVEMENT_SPEED;
						_npc.animation.play("lf");
					}
					else
					{
						popOffDirection();
					}				
				}
				case FlxObject.RIGHT:
				{
					if (Std.int(Math.abs(baseX - _npc.x)) != _path[0][1] * 16)
					{
						_npc.x += MOVEMENT_SPEED;
						_npc.animation.play("rt");
					}
					else
					{
						popOffDirection();
					}				
				}
				// case -1:
				// {
				// 	popOffDirection();
				// 	_npc.visible = false;
				// }
				default:
				{
					popOffDirection();
				}
			}
		}
	}


	private function popOffDirection():Void
	{
		_path.remove(_path[0]);
		baseX = _npc.x;
		baseY = _npc.y;
		if (_path.length == 0)
		{
			destroy();
		}
	}
}

class EventSaveGame extends BaseEvent
{
	var _mapName:String;
	var _entID:Int;

	public function new(EntID:Int, MapName:String)
	{
		_mapName = MapName;
		_entID = EntID;
		super();
	}

	override public function update()
	{
		Reg.saveGame(_entID, _mapName);
		destroy();
	}
}


