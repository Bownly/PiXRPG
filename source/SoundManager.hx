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
		initializeMusic();
		initializeSFX();
	}

	public static function initializeMusic():Void
	{
		var townsong = FlxG.sound.load("assets/music/great_forest.ogg");
		townsong.persist = true;
		townsong.looped = true;
		townsong.volume = 0.2;
		var housesong = FlxG.sound.load("assets/music/village_dreaming.ogg");
		housesong.persist = true;
		housesong.looped = true;
		housesong.volume = 0.1;
		var cavesong = FlxG.sound.load("assets/music/shadilay8.ogg");
		cavesong.persist = true;
		cavesong.looped = true;
		var badstuff = FlxG.sound.load("assets/music/dark_sanctum.ogg");
		badstuff.persist = true;
		badstuff.looped = true;
		badstuff.volume = 0.4;
		var worldmap = FlxG.sound.load("assets/music/windy_bluffs.ogg");
		worldmap.persist = true;
		worldmap.looped = true;
		worldmap.volume = 0.2;
		var battle = FlxG.sound.load("assets/music/battle_loop.ogg");
		battle.persist = true;
		battle.looped = true;
		battle.volume = 0.5;
		var miniboss = FlxG.sound.load("assets/music/miniboss.ogg");
		miniboss.persist = true;
		miniboss.looped = true;
		miniboss.volume = 0.5;
		var victoly = FlxG.sound.load("assets/music/victoly_fanfare.ogg");
		victoly.persist = true;
		var defeat = FlxG.sound.load("assets/music/lost_the_battle.ogg");
		defeat.persist = true;
		var shadilay = FlxG.sound.load("assets/music/shadilay.ogg");
		shadilay.persist = true;
		shadilay.volume = 0.5;
		shadilay.looped = true;
		var hurt = FlxG.sound.load("assets/music/hurt.ogg");


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
	}

	public static function initializeSFX():Void
	{

		var talk_high = FlxG.sound.load("assets/sounds/talk_high.ogg");
		talk_high.volume = 0.1;
		var talk_normal = FlxG.sound.load("assets/sounds/talk_normal.ogg");
		talk_normal.volume = 0.1;
		var hurt = FlxG.sound.load("assets/sounds/hurt16.ogg");
		var lvl = FlxG.sound.load("assets/sounds/lvl.ogg");
		var splash = FlxG.sound.load("assets/sounds/splash.ogg");
		var menu = FlxG.sound.load("assets/sounds/menu_sound.ogg");
		menu.volume = 0.75;

		sounds = 
		[
			"talk_high"   => talk_high,
			"talk_normal" => talk_normal,
			"hurt"        => hurt,
			"lvl"         => lvl,
			"splash"      => splash,
			"menu"        => menu,
		];
	}

	public static function playMusic(title:String):Void
	{
		if (songs[title].playing == false)
			songs[title].play();
	}

	public static function playSound(title:String):Void
	{
		sounds[title].play(true);
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
