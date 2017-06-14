package;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class SoundRoomState extends FlxState
{
	var selectedSelection = 0;
	var _SPACER = 4;
	
	var _txtTwitter:FlxText;
	var _txtLD:FlxText;
	var _txtTitle:FlxText;
	var _txtFurigana:FlxText;
	var _txtControls:FlxText;
	
	var _txtSelection0:FlxText;
	var _txtSelection1:FlxText;
	var _txtSelection2:FlxText;
	var _txtSelection3:FlxText;
	var _txtSelection4:FlxText;
	var _txtSelection5:FlxText;
	var _txtSelection6:FlxText;
	var _txtSelection7:FlxText;
	var _txtSelection8:FlxText;
	var _txtSelection9:FlxText;
	var _grpSelections:FlxTypedGroup<FlxText>;

	var songTownSong:FlxSound = FlxG.sound.load("assets/music/townsong.wav");
	var songWorldMap:FlxSound = FlxG.sound.load("assets/music/za_warudo_map.wav");
	var songBattle:FlxSound = FlxG.sound.load("assets/music/battle.wav");
	var songFanfare:FlxSound = FlxG.sound.load("assets/music/victoly_fanfare.wav");
	var songLost:FlxSound = FlxG.sound.load("assets/music/lost_the_battle.wav");
	var songFinalFight:FlxSound = FlxG.sound.load("assets/music/the_final_pick_ross.wav");
	var _grpSongs:FlxTypedGroup<FlxSound> = new FlxTypedGroup<FlxSound>();

	
	public function new():Void
	{
		super();
	}
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.camera.bgColor = 0x0000000;
		
		songFinalFight.play();
		_txtTitle = new FlxText(0, 0, FlxG.width, "Sound Room", 16);
		_txtTitle.alignment = "center";
		_txtTitle.y = (0 + _txtTitle.height * 2) / 2;
		
		_txtTwitter = new FlxText(0, 0, 0, "@Bownly", 8);
		_txtTwitter.y = FlxG.height - _txtTwitter.height;
		_txtLD = new FlxText(0, _txtTwitter.y, 0, "mini Ludum Dare 63", 8);
		_txtLD.x = FlxG.width - _txtLD.width;
		
		_grpSelections = new FlxTypedGroup<FlxText>();
		_txtSelection0 = new FlxText(96, _txtTitle.y + _txtTitle.height + _SPACER, "housesong (1:01)", 8);
		_txtSelection1 = new FlxText(96, _txtSelection0.y + _txtSelection0.height + _SPACER, "frogpondsong (4:51)", 8);
		_txtSelection2 = new FlxText(96, _txtSelection1.y + _txtSelection0.height + _SPACER, "za warudo map (1:53)", 8);
		_txtSelection3 = new FlxText(96, _txtSelection2.y + _txtSelection0.height + _SPACER, "cavesong (4:20)", 8);
		_txtSelection4 = new FlxText(96, _txtSelection3.y + _txtSelection0.height + _SPACER, "trouble time (2:42)", 8);
		_txtSelection5 = new FlxText(96, _txtSelection4.y + _txtSelection0.height + _SPACER, "battle song (2:00)", 8);
		_txtSelection6 = new FlxText(96, _txtSelection5.y + _txtSelection0.height + _SPACER, "miniboss (2:59)", 8);
		_txtSelection7 = new FlxText(96, _txtSelection6.y + _txtSelection0.height + _SPACER, "victoly fanfahre (0:02)", 8);
		_txtSelection8 = new FlxText(96, _txtSelection7.y + _txtSelection0.height + _SPACER, "lost the battle (0:02)", 8);
		_txtSelection9 = new FlxText(96, _txtSelection8.y + _txtSelection0.height + _SPACER, "shadilay (3:40)", 8);
		
		_txtControls = new FlxText(0, 0, FlxG.width, "J = listen, K = not listen, WASD/Arrows = move, m =/= mute\nTHERE'S NO WAY TO SILENCE THESE AUDITORY SENSATIONS");
		_txtControls.alignment = "center";
		
		_grpSelections.add(_txtSelection0);
		_grpSelections.add(_txtSelection1);
		_grpSelections.add(_txtSelection2);
		_grpSelections.add(_txtSelection3);
		_grpSelections.add(_txtSelection4);
		_grpSelections.add(_txtSelection5);
		_grpSelections.add(_txtSelection6);
		_grpSelections.add(_txtSelection7);
		_grpSelections.add(_txtSelection8);
		_grpSelections.add(_txtSelection9);
		
		//_grpSongs.add(songTownSong);
	/*	_grpSongs.add(songWorldMap);
		_grpSongs.add(songBattle);
		_grpSongs.add(songFanfare);
		_grpSongs.add(songLost);
		_grpSongs.add(songFinalFight);*/
		
		//add(_grpSongs);
		add(_grpSelections);
		add(_txtTitle);
		add(_txtTwitter);
		// add(_txtLD);
		add(_txtControls);
		
		
		songTownSong.play();
		super.create();	
		
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
		
		if (FlxG.keys.anyJustPressed(["DOWN", "S"])) 
		{
			selectedSelection++;
		}
		else if (FlxG.keys.anyJustPressed(["UP", "W"]))
		{
			selectedSelection--;
		}
		if (selectedSelection >= 10)
			selectedSelection = 0;
		else if (selectedSelection < 0)
			selectedSelection = 9;
			
		if (FlxG.keys.anyJustPressed(["J"]))
		{
			SoundManager.stopMusic();
			switch (selectedSelection)
			{
				case (0): SoundManager.playMusic("housesong");
				case (1): SoundManager.playMusic("townsong");
				case (2): SoundManager.playMusic("worldmap");
				case (3): SoundManager.playMusic("cavesong");
				case (4): SoundManager.playMusic("badstuff");
				case (5): SoundManager.playMusic("battle");
				case (6): SoundManager.playMusic("miniboss");
				case (7): SoundManager.playMusic("victoly");
				case (8): SoundManager.playMusic("defeat");
				case (9): SoundManager.playMusic("shadilay");
			}
		}
		
		if (FlxG.keys.anyJustPressed(["K"]))
		{
			FlxG.sound.pause();
			FlxG.switchState(new MenuState());
		}
		
		super.update(elapsed);
	}		

	function colorize():Void
	{
		for (level in _grpSelections)
			level.setFormat(8, Reg.COLORDEFAULT, "center");
		switch (selectedSelection)
		{
			case (0): _txtSelection0.setFormat(8, Reg.COLORSELECTED);
			case (1): _txtSelection1.setFormat(8, Reg.COLORSELECTED);
			case (2): _txtSelection2.setFormat(8, Reg.COLORSELECTED);
			case (3): _txtSelection3.setFormat(8, Reg.COLORSELECTED);
			case (4): _txtSelection4.setFormat(8, Reg.COLORSELECTED);
			case (5): _txtSelection5.setFormat(8, Reg.COLORSELECTED);
			case (6): _txtSelection6.setFormat(8, Reg.COLORSELECTED);
			case (7): _txtSelection7.setFormat(8, Reg.COLORSELECTED);
			case (8): _txtSelection8.setFormat(8, Reg.COLORSELECTED);
			case (9): _txtSelection9.setFormat(8, Reg.COLORSELECTED);
		}
	}

}