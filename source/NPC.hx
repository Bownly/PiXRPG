package;

import flixel.FlxObject;
import flixel.FlxSprite;
import EventClasses;


/**
 * ...
 * @author Bownly
 */
class NPC extends FlxSprite
{
	private static inline var TILE_SIZE:Int = 16;
	private static inline var MOVEMENT_SPEED:Int = 1;
	
	public var name:String;
	var _species:Int;
	var _state:TownState;
	public var baseX:Float;
	public var baseY:Float;
	public var events:Array<BaseEvent>;

	
	public function new(X:Float=0, Y:Float=0, Direction:Int, Species:Int, State:TownState, Name:String) 
	{
		super(X, Y);
		
		name = Name;
		_state = State;
		_species = Species;
		facing = Direction;

		immovable = true;

		setGraphics();

	}
	
	
	public function triggered(Dir:Int):Void
	{
		setFacing(Dir);
		if (events != null)
			_state.eventManager.addEvents(events);
	}
	
	private function setFacing(Dir:Int):Void
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
	
	private function setGraphics():Void
	{
		var o = 8;  // number of sprites per char
		loadGraphic(AssetPaths.NPC__png, true, 16, 16);
		animation.add("up", [0 + o * _species, 1 + o * _species], 3, true);
		animation.add("dn", [2 + o * _species, 3 + o * _species], 3, true);
		animation.add("lf", [4 + o * _species, 5 + o * _species], 3, true);
		animation.add("rt", [6 + o * _species, 7 + o * _species], 3, true);
		switch(facing)
		{
			case FlxObject.UP:
			{
				animation.play("up");
			}
			case FlxObject.DOWN:
			{
				animation.play("dn");
			}
			case FlxObject.LEFT:
			{
				animation.play("lf");
			}
			case FlxObject.RIGHT:
			{
				animation.play("rt");
			}
		}	
	}
}