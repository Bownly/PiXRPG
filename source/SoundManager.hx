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
	public static var sounds:Map<String, FlxSound>;

	public function new():Void
	{
		return;
	}

	public static function initialize():Void
	{
		var townsong = FlxG.sound.load("assets/music/great_forest.wav");
		townsong.persist = true;
		townsong.looped = true;
		townsong.volume = 0.3;
		var housesong = FlxG.sound.load("assets/music/village_dreaming.wav");
		housesong.persist = true;
		housesong.looped = true;
		housesong.volume = 0.125;
		var cavesong = FlxG.sound.load("assets/music/shadilay8.wav");
		cavesong.persist = true;
		cavesong.looped = true;
		var badstuff = FlxG.sound.load("assets/music/dark_sanctum.wav");
		badstuff.persist = true;
		badstuff.looped = true;
		badstuff.volume = 0.6;
		var worldmap = FlxG.sound.load("assets/music/windy_bluffs.wav");
		worldmap.persist = true;
		worldmap.looped = true;
		worldmap.volume = 0.3;
		var battle = FlxG.sound.load("assets/music/battle_loop.wav");
		battle.persist = true;
		battle.looped = true;
		battle.volume = 0.7;
		var miniboss = FlxG.sound.load("assets/music/miniboss.wav");
		miniboss.persist = true;
		miniboss.looped = true;
		miniboss.volume = 0.7;
		var victoly = FlxG.sound.load("assets/music/victoly_fanfare.wav");
		victoly.persist = true;
		var defeat = FlxG.sound.load("assets/music/lost_the_battle.wav");
		defeat.persist = true;
		var shadilay = FlxG.sound.load("assets/music/shadilay.wav");
		shadilay.persist = true;
		worldmap.looped = true;

		songs = 
		[
			"townsong"  => townsong,
			"housesong" => housesong,
			"cavesong"  => cavesong,
			"worldmap"  => worldmap,
			"badstuff"  => badstuff,
			"battle"    => battle,
			"miniboss"  => miniboss,
			"victoly"   => victoly,
			"defeat"    => defeat,
			"shadilay"  => shadilay,
		];

		var hurt = FlxG.sound.load("assets/sounds/hurt16.wav");

		sounds = 
		[
			"hurt"  => hurt,
		];


	}

	public static function playMusic(title:String):Void
	{
		if (songs[title].playing == false)
			songs[title].play();
	}

	public static function playSound(title:String):Void
	{
		sounds[title].play();
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
