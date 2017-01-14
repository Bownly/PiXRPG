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
	public var coords:Array<Float>;
	public var dimens:Array<Float>;
	var _sprBack:FlxSprite;
	var _sprBackBG:FlxSprite;

	public function new(Coords:Array<Float>, Dimens:Array<Float>, ?Pad:Int) 
	{
		super();

		coords = Coords;
		dimens = Dimens;

		if (Pad != null)
			pad = Pad;


		_sprBackBG = new FlxSprite().makeGraphic(Std.int(dimens[0]), Std.int(dimens[1]), FlxColor.WHITE);
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

	public function getHeight():Float
	{
		return _sprBackBG.height;
	}

}




