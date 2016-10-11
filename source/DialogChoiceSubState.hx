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
		
		_sprBack = new FlxSprite().makeGraphic(64, 96, FlxColor.GREEN);
		_sprBack.x = FlxG.width / 2 - _sprBack.width / 2;
		_sprBack.y = FlxG.height / 2 - _sprBack.height / 2;
		_sprBack.scrollFactor.set(0, 0);
		add(_sprBack);


		// _menu.setMenus();
		// _menu.isAlive = true;


		if (Menu != null)
			// setMenu(Menu);
			trace("TODO: clean up this code later");
		else
		{
			_menu = new MenuDialogChoices([_sprBack.x, _sprBack.y], [100, 100], 1, ArrChoices);
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
		super.update(elapsed);
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