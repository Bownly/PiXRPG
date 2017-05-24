package;

import flixel.FlxObject;
import flixel.FlxSprite;
import EventClasses;


/**
 * ...
 * @author Bownly
 */
class Chest extends NPC
{
	
	public function new(X:Float=0, Y:Float=0, State:TownState, Flag:String) 
	{
		// the first chest sprite is the 10th npc, hence the 10 value below
		var _species = 10;
		super(X, Y, FlxObject.DOWN, _species, State, Flag);
	}
	
	
	override public function triggered(Dir:Int):Void
	{
		if (events != null)
			_state.eventManager.addEvents(events);
		setAnim();
	}
	
	private function setAnim():Void
		animation.play(""+Reg.flags[name]);
	
	override private function setupGraphics():Void
	{
		var o = 10;  // number of sprites per char
		loadGraphic(AssetPaths.NPC__png, true, 16, 16);
		animation.add("0", [0 + o * _species], 3, true);
		animation.add("1", [0 + o * (_species + 1)], 3, true);
		setAnim();
	}

}