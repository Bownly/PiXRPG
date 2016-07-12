package;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class EndBossFightSubState extends BattleSubState
{

	public function new(EnemyID:Int, ?BGColor:Int=FlxColor.TRANSPARENT) 
	{
		super(EnemyID, BGColor);
		songBattle = FlxG.sound.load("assets/music/the_final_pick_ross.wav");

	}
	
	override public function close():Void 
	{
		if (!isDefeat && !isEscaped)
			FlxG.switchState(new WinState());
		super.close();
	}
	
}