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
    private var _txtGP:FlxText;
    public var _menu:BaseMenu;
	var _grpEverything:FlxTypedGroup<FlxText>;

	var _state:FlxState;
	
	
	public function new(X:Float, Y:Float, ?Menu:BaseMenu, ?BGColor:Int=FlxColor.TRANSPARENT, ?S:FlxState) 
	{
		super();

		_state = S;
		
		_grpEverything = new FlxTypedGroup<FlxText>();
		
		var winW:Int = 64;
		var winH:Int = 96;
		var xanchor = 2;
		var yanchor = Std.int(2);

		var statsWindow = new Window([xanchor, yanchor], [winW, winH]);
		xanchor += statsWindow.pad*2;
		yanchor += statsWindow.pad*2;

		_txtName = new FlxText(xanchor, yanchor, winW, Strings.stringVars["%pname%"]);
		_txtLevel = new FlxText(xanchor, _txtName.y + _txtName.height, winW, "LP: " + Player.lvl, 8);
		_txtHP = new FlxText(xanchor, _txtLevel.y + _txtLevel.height, winW, "HP: 999", 8);
		_txtMP = new FlxText(xanchor, _txtHP.y + _txtHP.height, winW, "MP: " + Player.mp, 8);
		_txtGP = new FlxText(xanchor, _txtMP.y + _txtMP.height, winW, "GP: " + Player.gp, 8);

		xanchor -= statsWindow.pad*2;
		yanchor += winH;

		if (Menu != null)
			// setMenu(Menu);
			trace("TODO: clean up this code later");
		else
		{
			// 80 and 46 are dimensions determined through trial and error
			_menu = new MenuPause([xanchor, yanchor], [80, 44], 1, [80+xanchor, 44+yanchor], _state, this);
			_menu.isAlive = true;
			add(_menu);
			// MenuManager.pushMenu(_menu);
			_menu.open();
		}

		MenuManager.setSubState(this);

		add(statsWindow);
		_grpEverything.add(_txtName);
		_grpEverything.add(_txtLevel);
		_grpEverything.add(_txtHP);
		_grpEverything.add(_txtMP);
		_grpEverything.add(_txtGP);
		add(_grpEverything);
		
		for(text in _grpEverything) 
		{
			text.scrollFactor.set();
        }

	}
	
	public override function update(elapsed:Float)
	{
		if (_menu.isAlive == false || !_menu.exists)
			this.close();
		super.update(elapsed);
	}

	public function removeMenu(Menu:BaseMenu)
	{
		remove(Menu);
	}


}