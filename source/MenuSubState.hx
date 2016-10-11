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
    private var _txtLevel:FlxText;
    private var _txtHP:FlxText;
    private var _txtMP:FlxText;
    private var _txtXP:FlxText;
    public var _menu:BaseMenu;
	var _grpEverything:FlxTypedGroup<FlxText>;

	var _state:FlxState;
	
	
	public function new(X:Float, Y:Float, ?Menu:BaseMenu, ?BGColor:Int=FlxColor.TRANSPARENT, ?S:FlxState) 
	{
		super();

		_state = S;
		
		_grpEverything = new FlxTypedGroup<FlxText>();
		
		var xanchor = Std.int(FlxG.width / 2 - 64 / 2);
		var yanchor = Std.int(FlxG.height / 2 - 96 / 2);

		var statsWindow = new Window([xanchor, yanchor], [64, 96]);
		xanchor += statsWindow.pad*2;
		yanchor += statsWindow.pad*2;

		_txtLevel = new FlxText(xanchor, yanchor + 8, 64, "Stats:\n\nLvl: " + Reg.pLV, 8);
		_txtHP = new FlxText(xanchor, _txtLevel.y + _txtLevel.height, 64, "HP: 999", 8);
		_txtMP = new FlxText(xanchor, _txtHP.y + _txtHP.height, 64, "MP: " + Reg.pMP, 8);
		_txtXP = new FlxText(xanchor, _txtMP.y + _txtMP.height, 64, "XP: " + Reg.pXP, 8);
		

		if (Menu != null)
			// setMenu(Menu);
			trace("TODO: clean up this code later");
		else
		{
			_menu = new MenuPause([0, 0], [100, 100], 1, _state, this);
			_menu.isAlive = true;
			add(_menu);
			// MenuManager.pushMenu(_menu);
			_menu.open();
		}

		MenuManager.setSubState(this);

		add(statsWindow);
		_grpEverything.add(_txtLevel);
		_grpEverything.add(_txtHP);
		_grpEverything.add(_txtMP);
		_grpEverything.add(_txtXP);
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