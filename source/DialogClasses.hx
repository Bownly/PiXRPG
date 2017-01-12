package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author Bownly
 */

class DialogLine
{
	public var line: String;
	public var face: Int;

	public function new(Face:Int, Line:String) 
	{
		line = Line;
		face = Face;
	}
}


class DialogBox
{
	public var arrLines: Array<DialogLine>;
	public var arrChoices: Array<MenuClasses.BaseMenuItem>;

	public function new(Lines:Array<DialogLine>, ?Choices:Array<MenuClasses.BaseMenuItem>) 
	{
	    arrLines = Lines;
	    arrChoices = Choices;
	}
}

class DialogSpriteGroup extends FlxGroup
{
	public var lineNumber:Int = 0;
	public var dBox:DialogClasses.DialogBox;
	public var endLine:Int;
	public var window:Window;

	var _sprBack:FlxSprite;
    var _txtDialog:FlxText;
    var _sprBlinker:FlxSprite;
    var _sprFaceIcon:FlxSprite;
	var _curLine:String;
	var _lineTimer:Float = 0;
	var _scrollSpeed:Int = 45;
	var _canControl:Bool = true;

	// public function new(Coords:Array<Float>, Dimens:Array<Float>, DB:DialogBox) 
	public function new(DB:DialogBox, CanControl:Bool, ?ScrollSpeed:Int) 
	{
		super();
		dBox = DB;
		_canControl = CanControl;
		if (ScrollSpeed > 0)
			_scrollSpeed = ScrollSpeed;

		endLine = dBox.arrLines.length - 1;		
		setCurLine();

		var iconsize = Reg.ICONSIZE;
		var h = iconsize;
		var w = FlxG.width - iconsize;
		var xanchor:Float = 0;
		var yanchor = FlxG.height - h;

		_sprFaceIcon = new FlxSprite().makeGraphic(iconsize, iconsize, FlxColor.GREEN);
		_sprFaceIcon.x = 0;
		_sprFaceIcon.y = yanchor;
		_sprFaceIcon.loadGraphic("assets/images/heads.png", true, iconsize, iconsize);
		loadFace(dBox.arrLines[0].face);

		xanchor += _sprFaceIcon.width;  // offset for the icon

		window = new Window([xanchor, yanchor], [w, h]);

		_txtDialog = new FlxText(xanchor + window.pad*2, yanchor + window.pad*2, w - _sprFaceIcon.width, "", 8);


		_txtDialog.scrollFactor.set();
		_sprFaceIcon.scrollFactor.set();
		
		add(window);
		add(_txtDialog);
		add(_sprFaceIcon);

		if (_canControl)
		{
			_sprBlinker = new FlxSprite(0, 0);
			_sprBlinker.loadGraphic("assets/images/dialog_blinker.png", true, 10, 10);
			_sprBlinker.animation.add("idle", [0, 1], 1, true);
			_sprBlinker.animation.play("idle");
			_sprBlinker.y = yanchor + h - _sprBlinker.height * 1.5;
			_sprBlinker.x = xanchor + w - _sprBlinker.width * 1.5;
			_sprBlinker.scrollFactor.set();
			add(_sprBlinker);
		}

	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (_txtDialog.text != _curLine)
		{
			_lineTimer += elapsed * _scrollSpeed;
			_sprFaceIcon.animation.play("idle");
		}
		else
			_sprFaceIcon.animation.play("stop");

		_txtDialog.text = _curLine.substr(0, Std.int(_lineTimer));

		if (_canControl && FlxG.keys.anyJustPressed(["J", "SPACE", "W", "A", "S", "D", "UP", "DOWN", "LEFT", "RIGHT", "K"]))
		{

			if (_txtDialog.text != _curLine)
			{
				_txtDialog.text = _curLine;	
				_lineTimer = 1000;
			}
			else
			{
				lineNumber += 1;
				_lineTimer = 0;
				if (lineNumber <= endLine)
				{
					loadFace(dBox.arrLines[lineNumber].face);
					setCurLine();
				}
			}

			if (lineNumber <= endLine)
			{
				if (lineNumber == endLine)
					_sprBlinker.visible = false;
			}
		}
		super.update(elapsed);
	}

	public function loadFace(I:Int):Void
	{
		var i = I*2;
		_sprFaceIcon.animation.add("idle", [i, i+1], 3, true);
		_sprFaceIcon.animation.add("stop", [i], 3, true);
		_sprFaceIcon.animation.play("idle");
	}

	public function setCurLine():Void
	{
		_curLine = dBox.arrLines[lineNumber].line;
		for (key in Strings.stringVars.keys())
			_curLine = _curLine.split(key).join(Strings.stringVars[key]);
	}
}






















