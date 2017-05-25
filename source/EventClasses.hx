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

	public function update(elapsed:Float)
	{
		if (_arr.length > 0) 
		{
			Reg.STATE = Reg.STATE_CUTSCENE;
			if (_arr[0].isAlive == false)
				_arr.shift();
			else
				_arr[0].update(elapsed);
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

	public function update(elapsed:Float) {}

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

	override public function update(elapsed:Float)
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

	override public function update(elapsed:Float)
	{
		destroy();
		if (_winFlag != null) {
			var sub = new BattleSubState(_state, _enemies, _winFlag, _winFlagVal);
			_state.openSubState(sub);
		}
		else {
			var sub = new BattleSubState(_state, _enemies);			
			_state.openSubState(sub);
		}
		super.update(elapsed);
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

	override public function update(elapsed:Float)
	{
		var sub = new DialogSubState(_dialogBox);
		_state.openSubState(sub);
		destroy();
		super.update(elapsed);
	}
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

	override public function update(elapsed:Float)
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

	override public function update(elapsed:Float)
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

	override public function update(elapsed:Float)
	{
		ItemClasses.InventoryManager.arr.push(_item);
		destroy();
	}
}

class EventMusicPlay extends BaseEvent
{
	var _song:String;

	public function new(Song:String)
	{
		_song = Song;
		super();
	}

	override public function update(elapsed:Float)
	{
		SoundManager.playMusic(_song);
		destroy();
	}
}

class EventMusicStop extends BaseEvent
{
	var _song:String;

	public function new(?Song:String)
	{
		_song = Song;
		super();
	}

	override public function update(elapsed:Float)
	{
		if (_song != null)
			SoundManager.stopMusic(_song);
		else
			SoundManager.stopMusic();
		destroy();
	}
}

class EventNPCAdd extends BaseEvent
{
	var _npc:NPC;
	var _group:FlxTypedGroup<NPC>;

	public function new(Npc:NPC, Group:FlxTypedGroup<NPC>)
	{
		super();
		_npc = Npc;
		_group = Group;
	}

	override public function update(elapsed:Float)
	{
		// _group.add(_npc);
		_npc.visible = true;
		destroy();
	}
}

class EventNPCKillOrNot extends BaseEvent
{
	var _dead:Bool;
	var _npc:NPC;

	public function new(Npc:NPC, Dead:Bool)
	{
		super();
		_npc = Npc;
		_dead = Dead;
	}

	override public function update(elapsed:Float)
	{
		_npc.setDead(_dead);
		destroy();
	}	
}

class EventNPCRemove extends BaseEvent
{
	var _npc:Entity;

	public function new(Npc:Entity)
	{
		super();
		_npc = Npc;
	}

	override public function update(elapsed:Float)
	{
		_npc.visible = false;
		destroy();
	}
}

class EventNPCSetCanTurn extends BaseEvent
{
	var _npc:NPC;
	var _canTurn:Bool;

	public function new(Npc:NPC, CanTurn:Bool)
	{
		super();
		_npc = Npc;
		_canTurn = CanTurn;
	}

	override public function update(elapsed:Float)
	{
		_npc.setCanTurn(_canTurn);
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

	override public function update(elapsed:Float)
	{
		_npc.triggered(_dir);
		destroy();
	}
}

class EventNPCWalk extends BaseEvent
{
	var _npc:Entity;
	var _path:Array<Array<Int>>;
	var _animated:Bool = true;
	private static inline var MOVEMENT_SPEED:Int = 1;
	public var baseX:Float;
	public var baseY:Float;

	// public var isMoving:Bool;

	public function new(Npc:Entity, Path:Array<Array<Int>>, ?Animated:Bool)
	{
		super();
		_npc = Npc;
		_path = Path;
		if (Animated)
			_animated = Animated;
		baseX = 0;
		baseY = 0;
	}

	override public function update(elapsed:Float)
	{
		// have to reinitialize the values here to ensure that they are correct at the time of the event's activation
		if (baseX == 0)
			baseX = _npc.x;
		if (baseY == 0)
			baseY = _npc.y;

		if (_path.length > 0)
		{
			Reg.STATE = Reg.STATE_CUTSCENE;
			switch (_path[0][0])
			{
				case FlxObject.UP:
				{
					if (_animated)
						_npc.setFacing(FlxObject.UP);
					// if not done moving
					if (Std.int(Math.abs(baseY - _npc.y)) != _path[0][1] * 16)
						_npc.y -= MOVEMENT_SPEED;
					else
						popOffDirection();
				}
				case FlxObject.DOWN:
				{
					if (_animated)
						_npc.setFacing(FlxObject.DOWN);						
					if (Std.int(Math.abs(baseY - _npc.y)) != _path[0][1] * 16)
						_npc.y += MOVEMENT_SPEED;
					else
						popOffDirection();
				}
				case FlxObject.LEFT:
				{
					if (_animated)
						_npc.setFacing(FlxObject.LEFT);
					if (Std.int(Math.abs(baseX - _npc.x)) != _path[0][1] * 16)
						_npc.x -= MOVEMENT_SPEED;
					else
						popOffDirection();
				}
				case FlxObject.RIGHT:
				{
					if (_animated)
						_npc.setFacing(FlxObject.RIGHT);
					if (Std.int(Math.abs(baseX - _npc.x)) != _path[0][1] * 16)
						_npc.x += MOVEMENT_SPEED;
					else
						popOffDirection();
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
			destroy();
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

	override public function update(elapsed:Float)
	{
		Reg.saveGame(_entID, _mapName);
		destroy();
	}
}

class EventStringVarChange extends BaseEvent
{
	var _name:String;
	var _val:String;

	public function new(Name:String, Val:String)
	{
		_name = Name;
		_val = Val;
		super();
	}

	override public function update(elapsed:Float)
	{
		Strings.stringVars[_name] = _val;
		destroy();
	}
}

class EventSwitchState extends BaseEvent
{
	var _entID:Int = 0;
	var _mapName:String;

	public function new(MapName:String, ?EntID:Int)
	{
		super();
		if (EntID > 0)
			_entID = EntID;
		_mapName = MapName;
	}

	override public function update(elapsed:Float)
	{
		switch _mapName {
			case "titlescreen": FlxG.switchState(new MenuState());
		    case "credits": FlxG.switchState(new CreditsState());
		    default: Reg.goToNextLevel(_entID, _mapName);
		}

		destroy();
	}
}

class EventUnlockPen extends BaseEvent
{
	var _penID:Int;

	public function new(PenID:Int)
	{
		_penID = PenID;
		super();
	}

	override public function update(elapsed:Float)
	{
		PenClasses.PenManager.unlockPen(_penID);
		destroy();
	}
}

class EventZaWarudo extends BaseEvent
{
	var _timer:Float;

	public function new(Duration:Float)
	{
		_timer = Duration;
		super();  // 時よ止まれ
	}

	override public function update(elapsed:Float)
	{
		_timer -= elapsed;
		if (_timer <= 0)
			destroy();  // そして時は動き出す
		super.update(elapsed);
	}
}








