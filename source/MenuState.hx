package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	var colorDefault = 0xffffff;
	var colorSelected = 0x0099FF;
	var selectedSelection = 0;
	
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
		_txtSelection0 = new FlxText(96, _txtTitle.y + _txtTitle.height + 16, "New Game", 8);
		_txtSelection1 = new FlxText(96, _txtSelection0.y + _txtSelection0.height + 16, "Continue", 8);
		_txtSelection2 = new FlxText(96, _txtSelection1.y + _txtSelection1.height + 16, "Credits", 8);
		_txtSelection3 = new FlxText(96, _txtSelection2.y + _txtSelection2.height + 16, "Sound Room", 8);
		
		_txtControls = new FlxText(0, 0, FlxG.width, "J = confirm, K = not confirm, WASD/Arrows = move, m = mute");
		_txtControls.alignment = "center";
		
		_grpSelections.add(_txtSelection0);
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
		super.create();	}
	
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
		
		if (FlxG.keys.anyJustPressed(["DOWN", "S"])) 
		{
			selectedSelection++;
		}
		else if (FlxG.keys.anyJustPressed(["UP", "W"]))
		{
			selectedSelection--;
		}
		if (selectedSelection >= 4)
			selectedSelection = 0;
		else if (selectedSelection < 0)
			selectedSelection = 3;
			
		if (FlxG.keys.anyJustPressed(["J"]))
		{
			switch (selectedSelection)
			{
				case (0):
					// FlxG.switchState(new Town1());
					Reg.newGame();
				case (1):
					// FlxG.switchState(new FrogPond1(1, "frogpond-1.tmx"));
					// todo: delete previous line and replace with a continue() call
					Reg.loadGame();
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
			level.setFormat(8, colorDefault, "center");
		switch (selectedSelection)
		{
			case (0):
				_txtSelection0.setFormat(8, colorSelected);
			case (1):
				_txtSelection1.setFormat(8, colorSelected);
			case (2):
				_txtSelection2.setFormat(8, colorSelected);
		}
	}

}