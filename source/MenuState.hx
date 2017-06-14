package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxSave;


/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	var _selectedSelection = 0;
	
	var _sprTitle:FlxSprite;
	var _txtTwitter:FlxText;
	var _txtControls:FlxText;
	
	var _txtSelection0:FlxText;
	var _txtSelection1:FlxText;
	var _txtSelection2:FlxText;
	var _txtSelection3:FlxText;
	var _grpSelections:FlxTypedGroup<FlxText>;

	var _save:FlxSave;
	var _continue:Bool;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.camera.bgColor = 0x0000000;
		_sprTitle = new FlxSprite(0, 48);
		_sprTitle.loadGraphic(AssetPaths.title_logo__png, true, 320, 32);

		_txtTwitter = new FlxText(0, 0, 0, "@Bownly", 8);
		_txtTwitter.y = FlxG.height - _txtTwitter.height;
		
		_grpSelections = new FlxTypedGroup<FlxText>();
		_txtSelection0 = new FlxText(0, _sprTitle.y + _sprTitle.height + 24, FlxG.width, "Continue", 8);
		_txtSelection1 = new FlxText(0, _txtSelection0.y + _txtSelection0.height + 16, FlxG.width, "New Game", 8);
		_txtSelection2 = new FlxText(0, _txtSelection1.y + _txtSelection1.height + 16, FlxG.width, "Credits", 8);
		_txtSelection3 = new FlxText(0, _txtSelection2.y + _txtSelection2.height + 16, FlxG.width, "Sound Room", 8);
		
		_txtControls = new FlxText(0, 0, FlxG.width, "J/Z = confirm, K/X = not confirm, WASD/Arrows = move, m = mute");
		_txtControls.alignment = "center";
		
		_grpSelections.add(_txtSelection1);
		_grpSelections.add(_txtSelection2);
		_grpSelections.add(_txtSelection3);
		
		add(_grpSelections);
		
		add(_sprTitle);
		
		FlxG.mouse.visible = false;		
		super.create();	

		SoundManager.initialize();
		SoundManager.stopMusic();

		_save = new FlxSave();
		_save.bind(Reg.SAVE_NAME);
		if (_save.data.maxmp == null)
		{
			_continue = false;
			_selectedSelection = 1;		
			_txtSelection1.y -= (_txtSelection1.height + 8);	
			_txtSelection2.y -= (_txtSelection2.height + 8);	
			_txtSelection3.y -= (_txtSelection3.height + 8);	
			add(_txtControls);
		}
		else
		{
			_continue = true;
			_selectedSelection = 0;			
			_grpSelections.add(_txtSelection0);
		}
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float):Void
	{
		colorize();
		
		// if (FlxG.keys.anyJustPressed(["N"])) 
		// {
		// 	_save.erase();
		// 	_save.bind(Reg.SAVE_NAME);
		// }

		if (FlxG.keys.anyJustPressed(Reg.keys["down"])) 
		{
			_selectedSelection++;
			SoundManager.playSound("menu");
		}
		else if (FlxG.keys.anyJustPressed(Reg.keys["up"]))
		{
			_selectedSelection--;
			SoundManager.playSound("menu");
		}
		var temp = 0;
		if (_continue == false)
			temp = 1;
		if (_selectedSelection >= 4)
			_selectedSelection = 0 + temp;
		else if (_selectedSelection < 0 + temp)
			_selectedSelection = 3;
			
		if (FlxG.keys.anyJustPressed(Reg.keys["confirm"]) || FlxG.keys.anyJustPressed(["ENTER"]))
		{
			// SoundManager.playSound("menu");
			switch (_selectedSelection)
			{
				case (0):
					Reg.loadGame();
				case (1):
					Reg.newGame();
				case (2):
					FlxG.switchState(new CreditsState());
				case (3):
					FlxG.switchState(new SoundRoomState());

			}
		}
		super.update(elapsed);
	}		

	function colorize():Void
	{
		for (level in _grpSelections)
			level.setFormat(8, Reg.COLORDEFAULT, "center");
		switch (_selectedSelection)
		{
			case (0):
				_txtSelection0.setFormat(8, Reg.COLORSELECTED);
			case (1):
				_txtSelection1.setFormat(8, Reg.COLORSELECTED);
			case (2):
				_txtSelection2.setFormat(8, Reg.COLORSELECTED);
			case (3):
				_txtSelection3.setFormat(8, Reg.COLORSELECTED);
		}
	}

}