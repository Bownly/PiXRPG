package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * ...
 * @author Bownly
 */

class Exit extends FlxSprite
{	
	public var id:Int;
	public var isActive:Bool = false;
	var _player:Player;
	public var nextLvl:String;
	public var nextLvlEntID:Int = 0;

	public function new(X:Float, Y:Float, ID:Int, ThePlayer:Player, NextLvl:String, NextLvlEnt:Int)
	{
		super(X, Y);
		
		id = ID;
		_player = ThePlayer;
		nextLvl = NextLvl;
		nextLvlEntID = NextLvlEnt;
		this.makeGraphic(0, 0);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);  
		
		if (!isActive)
		{
			if (_player.x != x || _player.y != y)
			{
				isActive = true;
			}
		}
	}

	
}



