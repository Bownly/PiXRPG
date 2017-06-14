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
	
	var _sprTitle:FlxSprite;
	var _txtTwitter:FlxText;
	var _txtControls:FlxText;
	
	var _txtCredits:FlxText;


	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.camera.bgColor = 0x0000000;
		
		_sprTitle = new FlxSprite(0, 48);
		_sprTitle.loadGraphic(AssetPaths.title_logo__png, true, 320, 32);

		_txtCredits = new FlxText(8, _sprTitle.y + _sprTitle.height + 24, FlxG.width - 8, "- Coding: Bownly\n\n- Scenario: Bownly\n\n- Graphics: Bownly, (some tiles adapted from tiles by the FF7 NES demake team)\n\n- Music: Visager, \"Shadilay\" originally by P.E.P.E, covers by Katie Ross and Tuomas Heikkilä", 8);
		
		_txtControls = new FlxText(0, 0, FlxG.width, "J = care, K = not care, WASD/Arrows = stay still, m = mute");
		_txtControls.alignment = "center";
		
		add(_txtCredits);		
		add(_sprTitle);
		
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
		
		if (FlxG.keys.anyJustPressed(Reg.keys["cancel"]))
			FlxG.switchState(new MenuState());
		if (FlxG.keys.anyJustPressed(["M"]))
			FlxG.sound.toggleMuted();
		super.update(elapsed);
	}	

	

}