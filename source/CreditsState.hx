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
class CreditsState extends FlxState
{
	var colorDefault = 0xffffff;
	var colorSelected = 0x0099FF;
	var selectedSelection = 0;
	
	var _txtTwitter:FlxText;
	var _txtLD:FlxText;
	var _txtTitle:FlxText;
	var _txtFurigana:FlxText;
	var _txtControls:FlxText;
	
	var _txtCredits:FlxText;


	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.camera.bgColor = 0x0000000;
		
		_txtTitle = new FlxText(0, 0, FlxG.width, "Pi X RPG", 32);
		_txtTitle.alignment = "center";
		_txtTitle.y = (FlxG.height - _txtTitle.height * 3) / 2;
		_txtTwitter = new FlxText(0, 0, 0, "* Assets that were used without permission are placeholders.", 8);
		_txtTwitter.y = FlxG.height - _txtTwitter.height;
		_txtTwitter.alignment = "center";
		
		_txtCredits = new FlxText(8, _txtTitle.y + _txtTitle.height + 16, FlxG.width - 8, "- Coding: Bownly\n- Scenario: Bownly\n- Graphics: Bownly, Mishuun, FF7 NES demake team\n- Music: Visager, \"Shadilay\" originally by P.E.P.E, covers by Katie Ross and Tuomas Heikkilä", 8);
		
		_txtControls = new FlxText(0, 0, FlxG.width, "J = care, K = not care, WASD/Arrows = stay still, m = mute");
		_txtControls.alignment = "center";
		
		add(_txtCredits);		
		add(_txtTitle);
		add(_txtTwitter);
		
		FlxG.mouse.visible = false;		
		super.create();	
		// SoundManager.playMusic("shadilay");
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
		
		if (FlxG.keys.anyJustPressed(["K"]))
			FlxG.switchState(new MenuState());
		if (FlxG.keys.anyJustPressed(["M"]))
			FlxG.sound.toggleMuted();
		super.update(elapsed);
	}	

	

}