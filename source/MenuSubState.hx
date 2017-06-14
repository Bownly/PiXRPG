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
    private var _sprMonshouFrog:FlxSprite;
    private var _sprMonshouIce:FlxSprite;
    private var _sprMonshouFire:FlxSprite;
    private var _sprMonshouGondola:FlxSprite;
    private var _MONSHOU_GAP:Int = 2;

    public var _menu:BaseMenu;
	var _grpEverything:FlxTypedGroup<FlxSprite>;

	var _state:FlxState;
	
	
	public function new(X:Float, Y:Float, ?Menu:BaseMenu, ?BGColor:Int=FlxColor.TRANSPARENT, ?S:FlxState) 
	{
		super();

		_state = S;
		
		_grpEverything = new FlxTypedGroup<FlxSprite>();
		
		var winW:Int = 76;  // mostly arbitrary number that ends up looking good
		var winH:Int = 80;  // BaseMenu.ITEM_GAP (12) * (BaseMenuItem count) + Window.pad*4
		var wpad = 16;
		// var wpad = wpad;
		// var wpad = wpad;

		var statsWindow = new Window([wpad, wpad], [winW, winH]);

		_txtName = new FlxText(wpad + statsWindow.pad*2, wpad + statsWindow.pad*2, winW, Strings.stringVars["%pname%"]);
		_txtLevel = new FlxText(_txtName.x, _txtName.y + BaseMenu.ITEM_GAP, winW, "LP: " + Player.lp, 8);
		_txtHP = new FlxText(_txtName.x, _txtLevel.y + BaseMenu.ITEM_GAP, winW, "HP: 999/999", 8);
		_txtMP = new FlxText(_txtName.x, _txtHP.y + BaseMenu.ITEM_GAP, winW, "MP: " + Player.mp + "/" + Player.maxmp, 8);
		_txtXP = new FlxText(_txtName.x, _txtMP.y + BaseMenu.ITEM_GAP, winW, "XP: " + Player.xp, 8);

		if (Reg.flags["monshou_frog"] == 1)
		{
			_sprMonshouFrog = new FlxSprite(_txtName.x + _MONSHOU_GAP, _txtXP.y + BaseMenu.ITEM_GAP + _MONSHOU_GAP);
			_sprMonshouFrog.loadGraphic(AssetPaths.seals__png, true, 8, 8);
			_sprMonshouFrog.animation.add("idle", [0]);
			_sprMonshouFrog.animation.play("idle");
			_grpEverything.add(_sprMonshouFrog);
		}
		if (Reg.flags["monshou_ice"] == 1)
		{
			_sprMonshouIce = new FlxSprite(_txtName.x + 8 + _MONSHOU_GAP * 2, _txtXP.y + BaseMenu.ITEM_GAP + _MONSHOU_GAP);
			_sprMonshouIce.loadGraphic(AssetPaths.seals__png, true, 8, 8);
			_sprMonshouIce.animation.add("idle", [1]);
			_sprMonshouIce.animation.play("idle");
			_grpEverything.add(_sprMonshouIce);
		}
		if (Reg.flags["monshou_fire"] == 1)
		{
			_sprMonshouFire = new FlxSprite(_txtName.x + _MONSHOU_GAP + (8 + _MONSHOU_GAP) * 2, _txtXP.y + BaseMenu.ITEM_GAP + _MONSHOU_GAP);
			_sprMonshouFire.loadGraphic(AssetPaths.seals__png, true, 8, 8);
			_sprMonshouFire.animation.add("idle", [2]);
			_sprMonshouFire.animation.play("idle");
			_grpEverything.add(_sprMonshouFire);
		}	
		if (Reg.flags["monshou_gondola"] == 1)
		{
			_sprMonshouGondola = new FlxSprite(_txtName.x + _MONSHOU_GAP + (8 + _MONSHOU_GAP) * 3, _txtXP.y + BaseMenu.ITEM_GAP + _MONSHOU_GAP);
			_sprMonshouGondola.loadGraphic(AssetPaths.seals__png, true, 8, 8);
			_sprMonshouGondola.animation.add("idle", [3]);
			_sprMonshouGondola.animation.play("idle");
			_grpEverything.add(_sprMonshouGondola);
		}

		if (Menu != null)
			trace("TODO: clean up this code later");
		else
		{
			var win2H = 44;
			_menu = new MenuPause(  [wpad, wpad + (winH + wpad)], 
									[winW, win2H], 1, 
									[wpad*2 + winW, wpad], 
									_state, this);
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
		// _grpEverything.add(_txtGP);
		add(_grpEverything);
		
		for(spr in _grpEverything) 
			spr.scrollFactor.set();
		SoundManager.playSound("menu");					

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