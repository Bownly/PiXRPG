package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author ...
 */
class WinState extends FlxState
{

	var _txtTwitter:FlxText;
	var _txtGrats:FlxText;
	var _txtGratsJr:FlxText;
	var _txtTrueEnding:FlxText;

	public function new()
		super();

	
	override public function create() 
	{
		FlxG.camera.bgColor = 0x0000000;
		
		_txtGrats = new FlxText(0, 0, FlxG.width, "Conglaturation!", 32);
		_txtGrats.alignment = "center";
		_txtGrats.y = (FlxG.height - _txtGrats.height * 2) / 2;
		
		_txtGratsJr = new FlxText(_txtGrats.x, _txtGrats.y + _txtGrats.height, 320, "You've won, but at what cost?", 16);
		_txtGratsJr.alignment = "center";
		
		_txtTrueEnding = new FlxText(_txtGratsJr.x, _txtGratsJr.y + _txtGratsJr.height, 320, "This is the canon ending.\n\n\n\n(Supported in part by funding from #trump2016)", 8); 
		_txtTrueEnding.alignment = "center";
		
		_txtTwitter = new FlxText(0, 0, 320, "@Bownly", 8);
		_txtTwitter.y = FlxG.height - _txtTwitter.height;
		
		add(_txtGrats);
		add(_txtGratsJr);
		add(_txtTwitter);
		
		if (Reg.pXP == 11)
			add(_txtTrueEnding);
		
		super.create();
	}
	
}