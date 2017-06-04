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
	public function getFace():Int
	{
		var i = face;
		if (i <= 7 && Reg.flags["p_hood"] == 1)  // 7 = the index of the last mc sans hood face
			i += 8;  // 8 is the amount of faces per character
		i = i*2;  // 2 frames of animation per face
		return i;
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
    var _txtDummy:FlxText;
    var _sprBlinker:FlxSprite;
    var _sprFaceIcon:FlxSprite;
	var _curLine:String;
	var _curLineMaster:String;
	var _lineTimer:Float = 0;
	var _scrollSpeed:Float = 0.005;
	var _canControl:Bool = true;

	var _voice:String = "talk_normal";

	// public function new(Coords:Array<Float>, Dimens:Array<Float>, DB:DialogBox) 
	public function new(DB:DialogBox, CanControl:Bool, ?ScrollSpeed:Float) 
	{
		super();
		dBox = DB;
		_canControl = CanControl;
		if (ScrollSpeed > 0)
			_scrollSpeed = ScrollSpeed;

		endLine = dBox.arrLines.length - 1;	

		_voice = calculateVoice(dBox.arrLines[0].face);

		var iconsize = Reg.ICONSIZE;
		var h = iconsize;
		var w = FlxG.width - iconsize;
		var xanchor:Float = 0;
		var yanchor = FlxG.height - h;

		_sprFaceIcon = new FlxSprite().makeGraphic(iconsize, iconsize, FlxColor.GREEN);
		_sprFaceIcon.x = 0;
		_sprFaceIcon.y = yanchor;
		_sprFaceIcon.loadGraphic("assets/images/heads.png", true, iconsize, iconsize);
		loadFace(dBox.arrLines[0]);

		xanchor += _sprFaceIcon.width;  // offset for the icon

		window = new Window([xanchor, yanchor], [w, h]);

		// the 20 subtracted from the width below is an arbitrary number that looks good and accounts for the blinker
		_txtDialog = new FlxText(xanchor + window.pad*2, yanchor + window.pad*2, w - 20, "", 8);
		_txtDialog.scrollFactor.set();
		_txtDialog.wordWrap = false;
		_sprFaceIcon.scrollFactor.set();
		_txtDummy = new FlxText(xanchor + window.pad*2, yanchor + window.pad*2, w - 14, "", 8);
		_txtDummy.visible = false;
		_txtDummy.wordWrap = false;
		
		setCurLine();

		add(window);
		add(_txtDialog);
		add(_txtDummy);
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

		if (_curLine.length > 0)
		{
			_lineTimer += elapsed;
			var len = _curLine.indexOf(" ", 0) + 1;  // len = index of cur string + next word
			if (len == 0)  // aka if the indexOf returned -1 aka if there are no more spaces left in the string
				_txtDummy.text = _txtDialog.text + _curLine;
			else
				_txtDummy.text = _txtDialog.text + _curLine.substr(0, len);

			if (_curLine.length % 6 == 0)
				SoundManager.playSound(_voice);

			if (_txtDummy.textField.textWidth >= _txtDummy.width - 8)  // the 8 is the default leftside spacing on textfields
			// if (_txtDummy.textField.textWidth >= _txtDummy.width)
			{
				if (_txtDialog.text.substr(_txtDialog.text.length-1, 1) == " ")  // if a space is activating the wordwrap
				{
					_txtDialog.text = _txtDialog.text.substr(0, _txtDialog.text.length-1);  // remove the space
					_txtDialog.text += "\n";  // and replace it with a newline
				}
			}
			_sprFaceIcon.animation.play("idle");
			if (_lineTimer >= _scrollSpeed)
			{
				_txtDialog.text += _curLine.substr(0, 1);
				_curLine = _curLine.substr(1);
				_lineTimer = 0;
			}
		}
		else
			_sprFaceIcon.animation.play("stop");

		if (_canControl && FlxG.keys.anyJustPressed(["J", "SPACE", "W", "A", "S", "D", "UP", "DOWN", "LEFT", "RIGHT", "K"]))
		{
			if (_curLine.length > 0)
			{
				_txtDialog.text = _curLineMaster;	
				_txtDialog.wordWrap = true;
				_curLine = _curLine.substr(_curLine.length-1, 0);
				_lineTimer = 1000;
			}
			else
			{
				lineNumber += 1;
				_lineTimer = 0;
				if (lineNumber <= endLine)
				{
					loadFace(dBox.arrLines[lineNumber]);
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

	public function calculateVoice(F:Int):String
	{

		if (F <= 39 || F >= 88)
			return "talk_high";
		else
			return "talk_normal";
	}

	public function loadFace(DL:DialogLine):Void
	{
		var i = DL.getFace();
		_sprFaceIcon.animation.add("idle", [i, i+1], 3, true);
		_sprFaceIcon.animation.add("stop", [i], 3, true);
		_sprFaceIcon.animation.play("idle");
	}

	public function setCurLine():Void
	{
		_txtDialog.wordWrap = false;
		_curLine = dBox.arrLines[lineNumber].line;
		for (key in Strings.stringVars.keys())
			_curLine = _curLine.split(key).join(Strings.stringVars[key]);
		_curLineMaster = _curLine;
		_txtDialog.text = "";
	}
}






















