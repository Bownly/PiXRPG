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

	private var _npc:NPC;
	private var _sprBack:FlxSprite;
    private var _txtDialog:FlxText;
    private var _sprBlinker:FlxSprite;
    private var _sprFaceIcon:FlxSprite;
	private var _lineNumber:Int = 0;
	// private var _arrLines:Array<String>;
	private var _dialogBox:DialogClasses.DialogBox;
	private var _arrLines:Array<DialogClasses.DialogLine>;
	private var _endLine:Int;
	private var _lineTimer:Float = 0;
	private var _endBoss:Bool = false;
	var _grpEverything:FlxTypedGroup<FlxSprite>;
	
	
	// public function new(Npc:NPC, ?Callback:String->Void, ?Endboss:Bool, ?BGColor:Int=FlxColor.TRANSPARENT) 
	public function new(DB:DialogClasses.DialogBox, ?Callback:String->Void, ?Endboss:Bool, ?BGColor:Int=FlxColor.TRANSPARENT) 
	{
		super();

		// _npc = Npc;
		// _arrLines = Npc.dialogBox.arrLines;

		_dialogBox = DB;
		_arrLines = _dialogBox.arrLines;

		_grpEverything = new FlxTypedGroup<FlxSprite>();


		_endLine = _arrLines.length - 1;		
		_endBoss = Endboss;
		
		// _sprBack = new FlxSprite().makeGraphic(FlxG.width, 48, FlxColor.BLACK);
		// _sprBack.y = 192;

		
		var xanchor = 0;
		var yanchor = 192;
		var h = 44;
		var w = FlxG.width - 2*2;

		var window = new Window([xanchor, yanchor], [w, h]);

		xanchor += window.pad*2;
		yanchor += window.pad*2;
		
		var tempx:Int = Std.int(h);
		_sprFaceIcon = new FlxSprite().makeGraphic(tempx, tempx, FlxColor.GREEN);
		_sprFaceIcon.x = window.pad;
		_sprFaceIcon.y = yanchor - window.pad;


		_sprFaceIcon.loadGraphic("assets/images/heads.png", true, 44, 44);
		_sprFaceIcon.animation.add("idle", [0, 1], 3, true);
		_sprFaceIcon.animation.add("stop", [0], 3, true);
		_sprFaceIcon.animation.play("idle");

		_txtDialog = new FlxText(xanchor + _sprFaceIcon.width, yanchor, w - _sprFaceIcon.width, "", 8);

		_sprBlinker = new FlxSprite(0, 0);
		_sprBlinker.loadGraphic("assets/images/dialog_blinker.png", true, 10, 10);
		_sprBlinker.animation.add("idle", [0, 1], 3, true);
		_sprBlinker.animation.play("idle");
		_sprBlinker.y = yanchor + h - _sprBlinker.height * 1.5;
		_sprBlinker.x = xanchor + w - _sprBlinker.width * 1.5;

		add(window);
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
				this.openSubState(sub);
				_dialogBox.arrChoices = null;
			}
			else
			{
				this.close();
			}
		}
		else
		{
			if (_txtDialog.text != _arrLines[_lineNumber].line)
			{
				_lineTimer += elapsed * 30;
				_sprFaceIcon.animation.play("idle");
			}
			else
				_sprFaceIcon.animation.play("stop");

			_txtDialog.text = _arrLines[_lineNumber].line.substr(0, Std.int(_lineTimer));

			if (FlxG.keys.anyJustPressed(["J", "SPACE", "W", "A", "S", "D", "UP", "DOWN", "LEFT", "RIGHT", "K"]))
			{
				if (_txtDialog.text != _arrLines[_lineNumber].line)
				{
					_txtDialog.text = _arrLines[_lineNumber].line;	
					_lineTimer = 1000;
				}
				else
				{
					_lineNumber += 1;
					_lineTimer = 0;
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
		var temp:Array<Array<Int>> = [[FlxObject.LEFT, 1], [FlxObject.DOWN, 2]];
		super.close();
	}

	
	public function hideBox():Void
	{
		this.visible = false;
	}
}