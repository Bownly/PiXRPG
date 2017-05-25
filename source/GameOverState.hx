package;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
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
class GameOverState extends FlxState
{
	var colorDefault = 0xffffff;
	var colorSelected = 0x0099FF;
	var selectedSelection = 0;
	
	var _txtTwitter:FlxText;
	var _txtLD:FlxText;
	var _txtTitle:FlxText;
	var _txtMessage:FlxText;


	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.camera.bgColor = 0x0000000;
		
		_txtTitle = new FlxText(0, 0, FlxG.width, "Game Over", 32);
		_txtTitle.alignment = "center";
		_txtTitle.y = (FlxG.height - _txtTitle.height * 3) / 2;
		
		_txtMessage= new FlxText(8, _txtTitle.y + _txtTitle.height + 16, FlxG.width - 8, Strings.stringVars["%pname%"] + "'s mind couldn't withstand the onslaught of mental damage. You caused a poor, innocent kid to go insane.\nWay to go.", 8);
		_txtMessage.alignment = "center";
		
		add(_txtTitle);
		add(_txtMessage);		
		
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
		
		if (FlxG.keys.anyJustPressed(Reg.keys["conf/canc"]))
		{
			FlxG.switchState(new MenuState());
		}
		super.update(elapsed);
	}	

	

}