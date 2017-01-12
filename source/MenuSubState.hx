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
class MenuSubState extends FlxSubState
{

	private var _sprBack:FlxSprite;
	private var _sprBackBG:FlxSprite;
    private var _txtName:FlxText;
    private var _txtLevel:FlxText;
    private var _txtHP:FlxText;
    private var _txtMP:FlxText;
    private var _txtXP:FlxText;
    private var _txtGP:FlxText;
    public var _menu:BaseMenu;
	var _grpEverything:FlxTypedGroup<FlxText>;

	var _state:FlxState;
	
	
	public function new(X:Float, Y:Float, ?Menu:BaseMenu, ?BGColor:Int=FlxColor.TRANSPARENT, ?S:FlxState) 
	{
		super();

		_state = S;
		
		_grpEverything = new FlxTypedGroup<FlxText>();
		
		var winW:Int = 76;  // mostly arbitrary number that ends up looking good
		var winH:Int = 80;  // BaseMenu.ITEM_GAP (12) * (BaseMenuItem count) + Window.pad*4
		var wpad = 16;
		// var wpad = wpad;
		// var wpad = wpad;

		var statsWindow = new Window([wpad, wpad], [winW, winH]);

		_txtName = new FlxText(wpad + statsWindow.pad*2, wpad + statsWindow.pad*2, winW, Strings.stringVars["%pname%"]);
		_txtLevel = new FlxText(_txtName.x, _txtName.y + BaseMenu.ITEM_GAP, winW, "LP: " + Player.lvl, 8);
		_txtHP = new FlxText(_txtName.x, _txtLevel.y + BaseMenu.ITEM_GAP, winW, "HP: 999/999", 8);
		_txtMP = new FlxText(_txtName.x, _txtHP.y + BaseMenu.ITEM_GAP, winW, "MP: " + Player.mp + "/" + Player.maxmp, 8);
		_txtXP = new FlxText(_txtName.x, _txtMP.y + BaseMenu.ITEM_GAP, winW, "XP: " + Player.xp, 8);
		_txtGP = new FlxText(_txtName.x, _txtXP.y + BaseMenu.ITEM_GAP, winW, "GP: " + Player.gp, 8);

		// wpad -= statsWindow.pad*2;
		// wpad += (winH + statsWindow.pad*2);
		// wpad = wpad + statsWindow.pad*2;
		// wpad = wpad + statsWindow.pad*2;

		if (Menu != null)
			// setMenu(Menu);
			trace("TODO: clean up this code later");
		else
		{
			var win2H = 44;
			_menu = new MenuPause(  [wpad, wpad + (winH + wpad)], 
									[winW, win2H], 1, 
									[wpad*2 + winW, wpad], 
									_state, this);
		// _menu = new MenuInventory([wpad, wpad + (winH + wpad)], 
		// 					[winW, win2H], 
		// 					2, [4, -12], this);
			_menu.isAlive = true;
			add(_menu);
			_menu.open();
		}

		MenuManager.setSubState(this);

		add(statsWindow);
		_grpEverything.add(_txtName);
		_grpEverything.add(_txtLevel);
		_grpEverything.add(_txtHP);
		_grpEverything.add(_txtMP);
		_grpEverything.add(_txtXP);
		_grpEverything.add(_txtGP);
		add(_grpEverything);
		
		for(text in _grpEverything) 
			text.scrollFactor.set();

	}
	
	public override function update(elapsed:Float)
	{
		_txtMP.text = "MP: " + Player.mp + "/" + Player.maxmp;

		if (_menu.isAlive == false || !_menu.exists)
			this.close();
		super.update(elapsed);
	}

	public function removeMenu(Menu:BaseMenu)
	{
		remove(Menu);
	}


}