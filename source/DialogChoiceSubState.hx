package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

import MenuClasses;

/**
 * ...
 * @author Bownly
 */
class DialogChoiceSubState extends FlxSubState
{

	private var _sprBack:FlxSprite;
    private var _txtLevel:FlxText;
    private var _txtHP:FlxText;
    private var _txtMP:FlxText;
    private var _txtXP:FlxText;
	public var _menu:MenuDialogChoices;
	var _grpEverything:FlxTypedGroup<FlxText>;

	var _state:FlxState;
	
	
	public function new(X:Float, Y:Float, ArrChoices:Array<BaseMenuItem>, ?Menu:MenuDialogChoices, ?BGColor:Int=FlxColor.TRANSPARENT, ?S:FlxState) 
	{
		super();

		_state = S;
		
		_grpEverything = new FlxTypedGroup<FlxText>();
		
		var iconsize = 48;
		var h = iconsize;
		var w = FlxG.width - iconsize;
		var xanchor:Float = 0;
		var yanchor = FlxG.height - h;

		// xanchor += _sprFaceIcon.width;  // offset for the icon
		xanchor += iconsize;  // offset for the icon

		if (Menu != null)
			// setMenu(Menu);
			trace("TODO: clean up this code later");
		else
		{
			var itemDimens = 1;
			if (ArrChoices.length > 3)
				itemDimens = 2;
			_menu = new MenuDialogChoices([xanchor, yanchor], [w, h], itemDimens, ArrChoices);
			_menu.isAlive = true;
			add(_menu);
			// MenuManager.pushMenu(_menu);
			_menu.open();
		}

		add(_grpEverything);
		
		for(text in _grpEverything) 
		{
			text.scrollFactor.set();
        }

	}
	
	public override function update(elapsed:Float)
	{
		if (_menu.isAlive == false)
		{
			this.close();
		}

		if (FlxG.keys.anyJustPressed(["M"]))
			FlxG.sound.toggleMuted();

		super.update(elapsed);
		Reg.playTime += elapsed;
	}

	public function setMenu(Menu:MenuDialogChoices)
	{
		remove(_menu);
		_menu = Menu;
		_menu.isAlive = true;
		trace("menyu added");
		// for (choice in _menu.arrItem)
		// {
		// 	if (Type.getClassName(Type.getClass(choice)) == "MenuItemFlag")
		// 		cast(item, MenuItemFlag).menu = _menu;
		// 	choice.menu = _menu;
		// }
		add(_menu);
	}

}