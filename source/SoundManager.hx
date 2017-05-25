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
		townsong.looped = true;
		var worldmap = FlxG.sound.load("assets/music/za_warudo_map.wav");
		worldmap.persist = true;
		worldmap.looped = true;
		var battle = FlxG.sound.load("assets/music/battle.wav");
		battle.persist = true;
		battle.looped = true;
		var victoly = FlxG.sound.load("assets/music/victoly_fanfare.wav");
		victoly.persist = true;
		var defeat = FlxG.sound.load("assets/music/lost_the_battle.wav");
		defeat.persist = true;
		var bosssong = FlxG.sound.load("assets/music/the_final_pick_ross.wav");
		bosssong.persist = true;

		songs = 
		[
			"townsong"  => townsong,
			"worldmap"  => worldmap,
			"battle"    => battle,
			"victoly"   => victoly,
			"defeat"    => defeat,
			"bosssong"  => bosssong,
		];
	}
	public static function playMusic(title:String):Void
	{
		if (songs[title].playing == false)
			songs[title].play();
	}

	public static function pauseMusic(title:String):Void
	{
		if (title != "all")
			songs[title].pause();
		else
		{
			for (song in FlxG.sound.list)
				song.pause();
		}
	}

	public static function stopMusic(?Excluded:String):Void
	{
		if (Excluded != null)
		{
			for (song in FlxG.sound.list)
			{
				if (song != songs[Excluded])
					song.stop();				
			}
		}
		else
		{
			for (song in FlxG.sound.list)
					song.stop();				
		}

	}

}
