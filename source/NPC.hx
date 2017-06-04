package;

import flixel.FlxObject;
import flixel.FlxSprite;
import EventClasses;


/**
 * ...
 * @author Bownly
 */
class NPC extends Entity
{
	var _canTurn:Bool = true;
	var _dead:Bool = false;
	var _species:Int;

	public var name:String;
	public var baseX:Float;
	public var baseY:Float;
	public var events:Array<BaseEvent>;
	
	public function new(X:Float=0, Y:Float=0, Direction:Int, Species:Int, State:TownState, Name:String, ?Dead:Bool) 
	{
		super(X, Y, Direction, State);
		
		_species = Species;
		name = Name;
		if (Dead != null)
			_dead = Dead;

		setupGraphics();
	}

	public function setCanTurn(val:Bool):Void
		_canTurn = val;

	public function setDead(Dead:Bool):Void
	{
		_dead = Dead;
		setFacing(FlxObject.DOWN);
	}

	override public function setFacing(Dir:Int):Void
	{
		if (!_dead)
		{
			switch(Dir)
			{
				case FlxObject.UP:
				{
					facing = FlxObject.UP;
					animation.play("up");
				}
				case FlxObject.DOWN:
				{
					facing = FlxObject.DOWN;
					animation.play("dn");
				}
				case FlxObject.LEFT:
				{
					facing = FlxObject.LEFT;
					animation.play("lf");
				}
				case FlxObject.RIGHT:
				{
					facing = FlxObject.RIGHT;
					animation.play("rt");
				}
			}
		}
		else
			animation.play("dead");
	}

	public function triggered(Dir:Int):Void
	{
		if (_canTurn)
			setFacing(Dir);
		if (events != null)
			_state.eventManager.addEvents(events);
	}
		
	private function setupGraphics():Void
	{
		var o = 10;  // number of sprites per char
		loadGraphic(AssetPaths.NPC__png, true, 16, 16);
		animation.add("up", [0 + o * _species, 1 + o * _species], ANIMATION_SPEED, true);
		animation.add("dn", [2 + o * _species, 3 + o * _species], ANIMATION_SPEED, true);
		animation.add("lf", [4 + o * _species, 5 + o * _species], ANIMATION_SPEED, true);
		animation.add("rt", [6 + o * _species, 7 + o * _species], ANIMATION_SPEED, true);
		animation.add("dead", [8 + o * _species, 9 + o * _species], ANIMATION_SPEED, true);
		
		setFacing(facing);
	}
}