package;

import flixel.FlxObject;
import flixel.FlxSprite;
import EventClasses;


/**
 * ...
 * @author Bownly
 */
class Entity extends FlxSprite
{
	private var ANIMATION_SPEED:Int = 3;
	private static inline var TILE_SIZE:Int = 16;
	private static inline var MOVEMENT_SPEED:Int = 1;
	
	var _state:TownState;

	public function new(X:Float=0, Y:Float=0, Direction:Int, State:TownState) 
	{
		super(X, Y);
		
		_state = State;
		facing = Direction;
		immovable = true;
	}
	
	public function setFacing(Dir:Int):Void
	{
		switch(Dir)
		{
			case FlxObject.DOWN:
			{
				facing = FlxObject.UP;
				animation.play("up");
			}
			case FlxObject.UP:
			{
				facing = FlxObject.DOWN;
				animation.play("dn");
			}
			case FlxObject.RIGHT:
			{
				facing = FlxObject.LEFT;
				animation.play("lf");
			}
			case FlxObject.LEFT:
			{
				facing = FlxObject.RIGHT;
				animation.play("rt");
			}
			case -1:
			{
				return;
			}
		}
	}
}