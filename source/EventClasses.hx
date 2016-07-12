package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author Bownly
 */

class EventManager
{
	var _arr:Array<BaseEvent> = [];
	var _state:TownState;

	public function new(S:TownState) 
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
				// _arr.remove(_arr[0]);
			else
				_arr[0].update();
		}
		else
		{
			Reg.STATE = Reg.STATE_NORMAL;
			_state.assignEvents();
		}
	}

	public function addEvent(e:BaseEvent) {
		_arr.push(e);
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

class EventBattle extends BaseEvent
{
	var _val:Array<Int>;
	var _state:TownState;

	public function new(Val:Array<Int>, State:TownState)
	{
		super();
		_val = Val;
		_state = State;
	}

	override public function update()
	{
		destroy();
		var sub = new BattleSubState(_val);
		_state.openSubState(sub);
		super.update();
	}
}

class EventDialog extends BaseEvent
{
	var _dialogBox:DialogClasses.DialogBox;
	var _state:TownState;

	public function new(DB:DialogClasses.DialogBox, State:TownState)
	{
		super();
		_dialogBox = DB;
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

	override public function destroy()
	{
		// if (_state != null)
		// {
		// 	_state.eventManager.addEvent(this);
		// 	Reg.STATE = Reg.STATE_CUTSCENE;
		// 	trace("did that shuffle");
		// }
		super.destroy();

	}
}


class EventWalk extends BaseEvent
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
				case -1:
				{
					popOffDirection();
					_npc.visible = false;
				}
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
