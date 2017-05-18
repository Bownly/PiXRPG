package;

import flixel.FlxG;
import flixel.system.FlxSound;

/**
 * ...
 * @author Bownly
 */

class SoundManager
{
	public static var songs:Map<String, FlxSound>;
	public var songTownsong:FlxSound;

	public function new():Void
	{
		return;
	}

	public static function initialize():Void
	{
		var townsong = FlxG.sound.load("assets/music/townsong.wav");
		townsong.persist = true;
		var worldmap = FlxG.sound.load("assets/music/za_warudo_map.wav");
		worldmap.persist = true;
		var battle = FlxG.sound.load("assets/music/battle.wav");
		battle.persist = true;

		songs = 
		[
			"townsong"  => townsong,
			"worldmap"  => worldmap,
			"battle"    => battle,
		];
	}
	public static function play(title:String):Void
	{
		if (songs[title].playing == false)
		{
			for (song in FlxG.sound.list)
				song.stop();
			songs[title].play();
		}
	}


}
