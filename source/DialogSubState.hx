package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author Bownly
 */
class DialogSubState extends FlxSubState
{

	var _dsGroup:DialogClasses.DialogSpriteGroup;
	
	
	public function new(DB:DialogClasses.DialogBox, ?Callback:String->Void, ?BGColor:Int=FlxColor.TRANSPARENT) 
	{
		super();

		_dsGroup = new DialogClasses.DialogSpriteGroup(DB, true);
		add(_dsGroup);
		
	}
	
	public override function update(elapsed:Float)
	{
		if (_dsGroup.lineNumber > _dsGroup.endLine)
		{
			if (_dsGroup.dBox.arrChoices != null)
			{
				var sub = new DialogChoiceSubState(30, 30, _dsGroup.dBox.arrChoices);
				hideBox();
				this.openSubState(sub);
				_dsGroup.dBox.arrChoices = null;
			}
			else
				this.close();
		}
		super.update(elapsed);
	}
	
	override public function close():Void
	{
		// var temp:Array<Array<Int>> = [[FlxObject.LEFT, 1], [FlxObject.DOWN, 2]];
		super.close();
	}

	
	public function hideBox():Void
	{
		for (spr in _dsGroup)
			spr.visible = false;
		_dsGroup.window.visible = false;
	}
}