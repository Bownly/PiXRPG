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
	var _colorDefault = 0xffffff;
	var _colorSelected = 0x0099FF;
	var _selectedSelection = 0;
	
	var _txtTwitter:FlxText;
	var _txtLD:FlxText;
	var _txtTitle:FlxText;
	var _txtFurigana:FlxText;
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
		
		_txtTitle = new FlxText(0, 0, FlxG.width, "Pi X RPG", 32);
		_txtTitle.alignment = "center";
		_txtTitle.y = (FlxG.height - _txtTitle.height * 3) / 2;
		
		_txtFurigana = new FlxText(0, 0, FlxG.width, "(Cross)", 8);
		_txtFurigana.setPosition(124, _txtTitle.y - _txtFurigana.height);
		
		_txtTwitter = new FlxText(0, 0, 0, "@Bownly", 8);
		_txtTwitter.y = FlxG.height - _txtTwitter.height;
		_txtLD = new FlxText(0, _txtTwitter.y, 0, "mini Ludum Dare 63", 8);
		_txtLD.x = FlxG.width - _txtLD.width;
		
		_grpSelections = new FlxTypedGroup<FlxText>();
		_txtSelection0 = new FlxText(120, _txtTitle.y + _txtTitle.height + 16, "Continue", 8);
		_txtSelection1 = new FlxText(120, _txtSelection0.y + _txtSelection0.height + 16, "New Game", 8);
		_txtSelection2 = new FlxText(120, _txtSelection1.y + _txtSelection1.height + 16, "Credits", 8);
		_txtSelection3 = new FlxText(120, _txtSelection2.y + _txtSelection2.height + 16, "Sound Room", 8);
		
		_txtControls = new FlxText(0, 0, FlxG.width, "J/Z = confirm, K/X = not confirm, WASD/Arrows = move, m = mute");
		_txtControls.alignment = "center";
		
		_grpSelections.add(_txtSelection1);
		_grpSelections.add(_txtSelection2);
		_grpSelections.add(_txtSelection3);
		
		add(_grpSelections);
		
		add(_txtTitle);
		add(_txtFurigana);
		add(_txtTwitter);
		// add(_txtLD);
		add(_txtControls);
		
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
		}
		else if (FlxG.keys.anyJustPressed(Reg.keys["up"]))
		{
			_selectedSelection--;
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
			level.setFormat(8, _colorDefault, "center");
		switch (_selectedSelection)
		{
			case (0):
				_txtSelection0.setFormat(8, _colorSelected);
			case (1):
				_txtSelection1.setFormat(8, _colorSelected);
			case (2):
				_txtSelection2.setFormat(8, _colorSelected);
			case (3):
				_txtSelection3.setFormat(8, _colorSelected);
		}
	}

}