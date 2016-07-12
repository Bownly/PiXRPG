package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * ...
 * @author Bownly
 */

class Entrance extends FlxSprite
{	
	public var id:Int;

	public function new(X:Float, Y:Float, ID:Int)
	{
		super(X, Y);
		
		id = ID;
	}
	
}



