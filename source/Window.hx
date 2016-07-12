package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;


/**
 * ...
 * @author Bownly
 */

class Window extends FlxGroup
{

	public var pad:Int = 2;
	var _sprBack:FlxSprite;
	var _sprBackBG:FlxSprite;

	public function new(Coords:Array<Float>, Dimens:Array<Float>, ?Pad:Int) 
	{
		super();

		var coords = Coords;
		var _dimens = Dimens;

		if (Pad != null)
			pad = Pad;


		_sprBackBG = new FlxSprite().makeGraphic(Std.int(_dimens[0]+pad*2), Std.int(_dimens[1]+pad*2), FlxColor.WHITE);
		_sprBackBG.x = coords[0];
		_sprBackBG.y = coords[1];
		_sprBackBG.scrollFactor.set(0, 0);

		_sprBack = new FlxSprite().makeGraphic(Std.int(_sprBackBG.width-pad*2), Std.int(_sprBackBG.height-pad*2), FlxColor.BLACK);
		_sprBack.x = _sprBackBG.x + pad;
		_sprBack.y = _sprBackBG.y + pad;
		_sprBack.scrollFactor.set(0, 0);

		add(_sprBackBG);
		add(_sprBack);
	}

}




