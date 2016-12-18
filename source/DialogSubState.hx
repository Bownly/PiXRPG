package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author Bownly
 */
class DialogSubState extends FlxSubState
{

	var _npc:NPC;
	var _sprBack:FlxSprite;
    var _txtDialog:FlxText;
    var _sprBlinker:FlxSprite;
    var _sprFaceIcon:FlxSprite;
	var _lineNumber:Int = 0;
	var _curLine:String;
	var _dialogBox:DialogClasses.DialogBox;
	var _arrLines:Array<DialogClasses.DialogLine>;
	var _endLine:Int;
	var _lineTimer:Float = 0;
	var _window:Window;
	var _grpEverything:FlxTypedGroup<FlxSprite>;
	
	
	public function new(DB:DialogClasses.DialogBox, ?Callback:String->Void, ?BGColor:Int=FlxColor.TRANSPARENT) 
	{
		super();

		_dialogBox = DB;
		_arrLines = _dialogBox.arrLines;

		_grpEverything = new FlxTypedGroup<FlxSprite>();

		_endLine = _arrLines.length - 1;		
		setCurLine();


		var iconsize = 48;
		var h = iconsize;
		var w = FlxG.width - iconsize;
		var xanchor:Float = 0;
		var yanchor = FlxG.height - h;

		_sprFaceIcon = new FlxSprite().makeGraphic(iconsize, iconsize, FlxColor.GREEN);
		_sprFaceIcon.x = 0;
		_sprFaceIcon.y = yanchor;
		_sprFaceIcon.loadGraphic("assets/images/heads.png", true, iconsize, iconsize);
		loadFace(_dialogBox.arrLines[0].face);

		xanchor += _sprFaceIcon.width;  // offset for the icon

		_window = new Window([xanchor, yanchor], [w, h]);

		_txtDialog = new FlxText(xanchor + _window.pad*2, yanchor + _window.pad*2, w - _sprFaceIcon.width, "", 8);

		_sprBlinker = new FlxSprite(0, 0);
		_sprBlinker.loadGraphic("assets/images/dialog_blinker.png", true, 10, 10);
		_sprBlinker.animation.add("idle", [0, 1], 1, true);
		_sprBlinker.animation.play("idle");
		_sprBlinker.y = yanchor + h - _sprBlinker.height * 1.5;
		_sprBlinker.x = xanchor + w - _sprBlinker.width * 1.5;

		add(_window);
		add(_txtDialog);
		add(_sprFaceIcon);
		add(_sprBlinker);

		_grpEverything.add(_txtDialog);
		_grpEverything.add(_sprFaceIcon);
		_grpEverything.add(_sprBlinker);
		add(_grpEverything);
		for(text in _grpEverything) 
		{
			text.scrollFactor.set();
        }
	}
	
	public override function update(elapsed:Float)
	{


		if (_lineNumber > _endLine)
		{
			if (_dialogBox.arrChoices != null)
			{
				var sub = new DialogChoiceSubState(30, 30, _dialogBox.arrChoices);
				hideBox();
				this.openSubState(sub);
				_dialogBox.arrChoices = null;
			}
			else
				this.close();
		}
		else
		{
			if (_txtDialog.text != _curLine)
			{
				_lineTimer += elapsed * 30;
				_sprFaceIcon.animation.play("idle");
			}
			else
				_sprFaceIcon.animation.play("stop");

			_txtDialog.text = _curLine.substr(0, Std.int(_lineTimer));

			if (FlxG.keys.anyJustPressed(["J", "SPACE", "W", "A", "S", "D", "UP", "DOWN", "LEFT", "RIGHT", "K"]))
			{

				if (_txtDialog.text != _curLine)
				{
					_txtDialog.text = _curLine;	
					_lineTimer = 1000;
				}
				else
				{
					_lineNumber += 1;
					_lineTimer = 0;
					if (_lineNumber <= _endLine)
					{
						loadFace(_arrLines[_lineNumber].face);
						setCurLine();
					}
				}

				if (_lineNumber <= _endLine)
				{
					if (_lineNumber == _endLine)
						_sprBlinker.visible = false;
				}
			}
		}
				super.update(elapsed);
	}
	
	override public function close():Void
	{
		// var temp:Array<Array<Int>> = [[FlxObject.LEFT, 1], [FlxObject.DOWN, 2]];
		super.close();
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
		_curLine = _arrLines[_lineNumber].line;
		for (key in Strings.stringVars.keys())
			_curLine = _curLine.split(key).join(Strings.stringVars[key]);
	}
	
	public function hideBox():Void
	{
		for (spr in _grpEverything)
			spr.visible = false;
		_window.visible = false;
	}
}