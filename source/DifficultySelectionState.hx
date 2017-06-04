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
class DifficultySelectionState extends FlxState
{
	var colorDefault = 0xffffff;
	var colorSelected = 0x0099FF;
	var selectedSelection = 0;
	
	var _txtInstructions:FlxText;
	var _txtControls:FlxText;
	var _txtSelectionNormal:FlxText;
	var _txtSelectionHard:FlxText;
	var _grpSelections:FlxTypedGroup<FlxText>;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.camera.bgColor = 0x0000000;
		
		var xanchor:Float = 0;
		var yanchor:Float = 48;  // arbitray spacing number determined to look good

		_txtInstructions = new FlxText(xanchor, yanchor, FlxG.width, "Select a difficulty:", 16);
		_txtInstructions.setFormat(16, colorDefault, "center");
		yanchor += _txtInstructions.height;

		_grpSelections = new FlxTypedGroup<FlxText>();
		// lotta (somewhat) arbitrary spacing numbers below
		_txtSelectionNormal = new FlxText(xanchor + 16, _txtInstructions.y + _txtInstructions.height + 16, 128, "Normal\n\nPick this one if you're new to picross puzzles, just want to experience the story, or are a casual scrub.", 8);
		_txtSelectionHard = new FlxText(_txtInstructions.x + 32 + _txtSelectionNormal.width, _txtSelectionNormal.y, 128, "Hard\n\nFor players more experienced with picross puzzles. The puzzles are bigger and the enemies hit harder.", 8);
	
		_txtControls = new FlxText(0, 0, FlxG.width, "J = confirm, K = do nothing, WASD/Arrows = move");
		_txtControls.y = FlxG.height - _txtControls.height;
		_txtControls.alignment = "center";

		add(_txtInstructions);
		_grpSelections.add(_txtSelectionNormal);
		_grpSelections.add(_txtSelectionHard);
		add(_grpSelections);
		// add(_txtControls);
		
		FlxG.mouse.visible = false;		
		super.create();	

		SoundManager.stopMusic();
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
		
		if (FlxG.keys.anyJustPressed(Reg.keys["right"])) 
		{
			selectedSelection++;
		}
		else if (FlxG.keys.anyJustPressed(Reg.keys["left"]))
		{
			selectedSelection--;
		}
		if (selectedSelection >= 2)
			selectedSelection = 1;
		else if (selectedSelection < 0)
			selectedSelection = 0;
			
		if (FlxG.keys.anyJustPressed(["J"]))
		{
			Reg.flags["difficulty"] = selectedSelection;
			FlxG.switchState(new NamePlayerState());	
		}
		super.update(elapsed);
	}		

	function colorize():Void
	{
		for (item in _grpSelections)
			item.setFormat(8, colorDefault, "center");
		switch (selectedSelection)
		{
			case (0):
				_txtSelectionNormal.setFormat(8, colorSelected);
			case (1):
				_txtSelectionHard.setFormat(8, colorSelected);
		}
	}

}