package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

import PenClasses;
import cloner.Cloner;

/**
 * ...
 * @author Bownly
 */


class BaseMenuItem
{
	public var name:String;
	public var iconID:Int;
	public var grpRender:FlxTypedSpriteGroup<FlxSprite>;
	var _isHighlighted:Bool;

	public function new(Name:String, ?IconID:Int)
	{
		name = Name;
		iconID = IconID;
	}

	public function renderLine(Anchor:Array<Float>) 
	{
		grpRender = null;
		grpRender = new FlxTypedSpriteGroup<FlxSprite>(Anchor[0], Anchor[1]);
		var xSpacer:Float = 0;
		for (item in grpRender)
			xSpacer += item.width + 2;
		addIcon([xSpacer, grpRender.y]);
		for (item in grpRender)
			xSpacer += item.width + 2;
		addText([xSpacer, grpRender.y]);
		return grpRender;
	}

	public function getHighlighted() {
		return _isHighlighted;
	}

	public function flipHighlighted() {
		_isHighlighted = !_isHighlighted;
	}

	public function selected() {}

	private function addIcon(Anchor:Array<Float>)
	{
		var icon = new FlxSprite();
		icon.loadGraphic(AssetPaths.item_icons__png, true, 8, 8);
		icon.animation.add("idle", [iconID, iconID], 2, true);
		icon.animation.play("idle");
		icon.visible = true;
		grpRender.add(icon);
	}
	private function addText(Anchor:Array<Float>)
	{
		var item = new FlxText(Anchor[0], 0, 64, name, 8);
		grpRender.add(item);
	}	
}

class MenuItemClose extends BaseMenuItem
{
	public var menu:BaseMenu;

	public function new(Name:String, ?Menu:BaseMenu)
	{
		menu = Menu;
		super(Name, 6);  // 6 is the x icon
	}

	override function selected()
		menu.close();
}

class MenuItemDialogChoice extends MenuItemFlag
{
	public var dBox:DialogClasses.DialogBox;

	public function new(DBLine:Array<DialogClasses.DialogLine>, Menu:BaseMenu, Flag:EventClasses.EventFlag)
	{
		dBox = new DialogClasses.DialogBox(DBLine);
		super(dBox.arrLines[0].line, 0, Menu, Flag);
	}

	// override function highlighted()
	// {
	// 	if (Type.getClassName(Type.getClass(menu)) == "MenuDialogChoices")
	// 		cast(menu, MenuDialogChoices). update spr head();
	// }
}

class MenuItemFlag extends MenuItemClose
{
	var _flag:EventClasses.EventFlag;

	public function new(Name:String, IconID:Int, Menu:BaseMenu, Flag:EventClasses.EventFlag)
	{
		_flag = Flag;
		super(Name, Menu);
		iconID = IconID;
	}

	override public function selected()
	{
		_flag.update();
		super.selected();
	}
}

class MenuItemItem extends BaseMenuItem
{
	public var item:ItemClasses.BaseItem;
	var _menu:MenuInventory;

	public function new(Item:ItemClasses.BaseItem, Inv:MenuInventory)
	{
		item = Item;
		_menu = Inv;
		super(item.name, item.iconID);
	}

	override public function selected()
	{
		item.use();
		_menu.refresh(_menu.generateItems());
		super.selected();
	}
}

class MenuItemPen extends BaseMenuItem
{
	var _pen:Pen;
	var _menu:MenuPens;

	public function new(P:Pen, MP:MenuPens)
	{
		_pen = P;
		_menu = MP;
		super(_pen.name);
		iconID = _pen.id;
	}

	override public function renderLine(Anchor:Array<Float>) 
	{
		grpRender = null;
		grpRender = new FlxTypedSpriteGroup<FlxSprite>(Anchor[0], Anchor[1]);
		
		var xSpacer:Float = 0;
		// addEquipped([xSpacer, grpRender.y]);

		for (item in grpRender)
			xSpacer += item.width + 2;
		addIcon([xSpacer, grpRender.y]);

		for (item in grpRender)
			xSpacer += item.width + 2;
		addText([xSpacer, grpRender.y]);


		return grpRender;
	}

	override public function selected()
	{
		PenManager.equip(_pen);
		_menu.refresh(_menu.arrItem);
		super.selected();
	}
	
	override private function addIcon(Anchor:Array<Float>)
	{
		var id:Int = iconID;
		if (PenManager.equipped == _pen)
			id = 10;  // index for the E icon
		var icon = new FlxSprite();
		icon.loadGraphic(AssetPaths.item_icons__png, true, 8, 8);
		icon.animation.add("idle", [id, id], 2, true);
		icon.animation.play("idle");
		icon.visible = true;
		grpRender.add(icon);
	}

	private function addEquipped(Anchor:Array<Float>)
	{
		var item = new FlxText(Anchor[0], 0, 10, "E", 8);
		if (PenManager.equipped != _pen)
			item.setFormat(item.size, FlxColor.BLACK);
		else
			item.setFormat(item.size, FlxColor.WHITE);
		grpRender.add(item);
	}
}

class MenuItemSubMenu extends BaseMenuItem
{
	var _state:FlxState;
	var _substate:FlxSubState;
	var _menu:BaseMenu;

	public function new(Name:String, IconID:Int, State:FlxState, Sub:FlxSubState, Menu:BaseMenu)
	{
		super(Name);
		_menu = Menu;
		iconID = IconID;
		_state = State;
		_substate = Sub;
	}

	override public function selected()
	{
		var menu:BaseMenu = _menu;
		// var sub = new MenuSubState(FlxG.width/2, FlxG.height/2, menu, _substate);
		// sub.setMenu(menu);

		_substate.add(_menu);
		// MenuManager.pushMenu(_menu);
		_menu.open();
	}
}



class MenuManager
{
	public static var arrMenus:Array<BaseMenu> = [];
	public static var activeMenu:BaseMenu = null;
	public static var subState:MenuSubState = null;

	public static function popMenu()
	{
		if (arrMenus.length > 0 && subState != null)
		{
			subState.remove(arrMenus.pop());
			resetActiveMenu();
		}		
	}

	public static function pushMenu(m:BaseMenu)
	{
		for (menu in arrMenus)
			menu.isActive = false;
		arrMenus.push(m);
		resetActiveMenu();
	}

	public static function resetActiveMenu()
	{
		if (arrMenus.length > 0)
		{
			activeMenu = arrMenus[arrMenus.length-1];
			activeMenu.isActive = true;
		}
	}

	public static function setSubState(s:MenuSubState)
	{
		subState = s;
	}
}

class BaseMenu extends FlxGroup
{
	public var isAlive:Bool = true;
	public var isActive:Bool = false;

	var _sprBack:FlxSprite;
	var _sprBackBG:FlxSprite;
    public var coords:Array<Float>;
    public var dimens:Array<Float>;
    var _itemDimens:Int;
    var _xPad:Int = 8;
    var _yPad:Int = 8;
    var _iconBuffer:Int = 12;
    var ITEM_GAP:Int = 12;

	var _grpEverything:FlxTypedGroup<FlxSprite>;
	var _grpIcon:FlxTypedGroup<FlxSprite>;
	var _cursor:FlxSprite;
	var _selected:Array<Int> = [0, 0];
	var _highlighted:BaseMenuItem;
	var _arr:Array<Array<BaseMenuItem>>;
	public var arrItem:Array<BaseMenuItem>;
	var _arrSprite:Array<Array<FlxTypedSpriteGroup<FlxSprite>>>;
	var _closeString:String;
	var _closeItem:MenuItemClose;
	var _window:Window;

	var openTimerDuration:Float = 0.1;
	var openTimer:Float = 1;

	public function new(Coords:Array<Float>, Dimens:Array<Float>, ItemDimens:Int, ItemArray:Array<BaseMenuItem>, ?CloseString, ?IconBuffer) 
	{

		super();
		_arrSprite = new Array<Array<FlxTypedSpriteGroup<FlxSprite>>>();
		_grpIcon = new FlxTypedGroup<FlxSprite>();
		if (_grpEverything == null)
			_grpEverything = new FlxTypedGroup<FlxSprite>();
		coords = Coords;
		dimens = Dimens;
		_itemDimens = ItemDimens;
		_arr = new Array<Array<BaseMenuItem>>();
		arrItem = ItemArray;

		if (CloseString != null)
			_closeString = CloseString;
	
		_window = new Window(coords, dimens);
	
		_cursor = new FlxSprite(0, 0);
		_cursor.loadGraphic("assets/images/dialog_blinker.png", true, 10, 10);
		_cursor.animation.add("idle", [0, 1], 3, true);
		_cursor.animation.play("idle");
		_cursor.x = coords[0] + _window.pad;
		_cursor.y = coords[1] + _window.pad;
		_grpEverything.add(_cursor);

 		refresh(arrItem);
	
		add(_window);
		add(_grpEverything);
		
		for(item in _grpEverything) 
			item.scrollFactor.set();
	}

	override public function update(elapsed:Float)
	{
		if (this.isActive == true)
		{
			openTimer -= elapsed;
			if (openTimer <= 0)
			{
				super.update(elapsed);

				if (FlxG.keys.anyJustPressed(["DOWN", "S"]))
				{
					if (_selected[1]+1 < _arrSprite.length && _arrSprite[_selected[1]+1][_selected[0]] != null)
						_selected[1] += 1;
					else 
						_selected[1] = 0;
					_cursor.y = _arrSprite[_selected[1]][_selected[0]].y;
					// _highlighted = _arrSprite[_selected[1]][_selected[0]];
				}
				else if (FlxG.keys.anyJustPressed(["UP", "W"]))
				{
					if (_selected[1]-1 >= 0 && _arrSprite[_selected[1]-1][_selected[0]] != null)
						_selected[1] -= 1;
					else
					{
						while (_selected[1]+1 < _arrSprite.length && _arrSprite[_selected[1]+1][_selected[0]] != null)
							_selected[1] += 1;					
					}
					_cursor.y = _arrSprite[_selected[1]][_selected[0]].y;
					// _highlighted = _arrSprite[_selected[1]][_selected[0]];
				}
				else if (FlxG.keys.anyJustPressed(["RIGHT", "D"]))
				{
					if (_selected[0] >= _arrSprite[0].length-1)
						_selected[0] = 0;
					else if (_arrSprite[_selected[1]][_selected[0]+1] != null)
						_selected[0] += 1;
					_cursor.x = _arrSprite[_selected[1]][_selected[0]].x - _cursor.width;
					// _highlighted = _arrSprite[_selected[1]][_selected[0]];
				}
				else if (FlxG.keys.anyJustPressed(["LEFT", "A"]))
				{
					if (_selected[0] <= 0 && _arrSprite[_selected[1]][_arrSprite[0].length-1] == null)
						_selected[0] += 0;
					else if (_selected[0] <= 0 && _arrSprite[_selected[1]][_arrSprite[0].length-1] != null)
						_selected[0] = _arrSprite[0].length-1;
					else 
						_selected[0] -= 1;
					_cursor.x = _arrSprite[_selected[1]][_selected[0]].x - _cursor.width;
					// _highlighted = _arrSprite[_selected[1]][_selected[0]];
				}

				if (FlxG.keys.anyJustPressed(["J"]))
					_arr[_selected[1]][_selected[0]].selected();
				// note: the null check is to disallow backing out of a MenuDialogChoices
				else if (FlxG.keys.anyJustPressed(["K"]) && _closeString != null)
					close();
			}
		}
	}

	public function close()
	{
		isAlive = false;
		isActive = false;
		MenuManager.popMenu();
	}

	public function open()
	{
		openTimer = openTimerDuration;
		isAlive = true;
		 		refresh(arrItem);

		MenuManager.pushMenu(this);
	}

	public function refresh(ItemArray:Array<BaseMenuItem>)
	{
		_arr = [];
		for (i in 0...Math.ceil(ItemArray.length/_itemDimens))
		{
			var tempArr:Array<BaseMenuItem> = new Array<BaseMenuItem>();
			for (j in 0..._itemDimens)
			{
				var item:BaseMenuItem = ItemArray[j+(i*_itemDimens)];
				if (item != null)
					tempArr.push(item);
			}
			if (tempArr != null)
				_arr.push(tempArr);
		}

		// reset gwaphics
		for (sprites in _arrSprite)
		{
			for (spr in sprites)
			{
				if (spr != null)
					spr.visible = false;
			}
		}
		for (icon in _grpIcon)
		{
			icon.visible = false;
			icon.kill();
		}

		_arrSprite = [];
		for (i in 0..._arr.length)
		{
			var tempArr:Array<FlxTypedSpriteGroup<FlxSprite>> = new Array<FlxTypedSpriteGroup<FlxSprite>>();
			for (j in 0..._arr[i].length)
			{
				var grp = _arr[i][j].renderLine([coords[0] + _cursor.width + _window.pad*2 + (dimens[0] * (j/_itemDimens)),
												 coords[1] + i * ITEM_GAP + _window.pad*2]);
				tempArr.push(grp);
				_grpEverything.add(grp);
			}
			if (tempArr != null)
				_arrSprite.push(tempArr);
		}

		if (_closeString != null)
		{

			_closeItem = new MenuItemClose(_closeString, this);
			_arr.push([_closeItem, null]);

			var grp = _closeItem.renderLine([coords[0] + _cursor.width + _window.pad*2, coords[1]]);
			while (grp.y < coords[1] + dimens[1] - _yPad - ITEM_GAP)
				grp.y += ITEM_GAP;
			_arrSprite.push([grp, null]);

			_grpEverything.add(grp);


		}

		for (sprite in _grpEverything)
		{
			if (sprite != null)
				sprite.scrollFactor.set();	
		}

		_selected = [0, 0];
		// if (_selected[0] >= _arr.length)
		// 	_selected[0] = 0;
		// if (_selected[1] >= _arr[_selected[0]].length)
		// 	_selected[1] = 0;
		// trace("selectiond: ", _selected);
		// trace("_arr:       ", _arr);

		_cursor.x = _arrSprite[_selected[1]][_selected[0]].x - _cursor.width - _window.pad/2;
		_cursor.y = _arrSprite[_selected[1]][_selected[0]].y;
	}
}

class MenuDialogChoices extends BaseMenu
{
   	var _sprFaceIcon:FlxSprite;

	public function new(Coords:Array<Float>, Dimens:Array<Float>, ItemDimens:Int, ItemArray:Array<BaseMenuItem>)
	{
		_grpEverything = new FlxTypedGroup<FlxSprite>();

		coords = Coords;

		var iconsize = 48;
		_sprFaceIcon = new FlxSprite();	
		_sprFaceIcon.x = 0;
		_sprFaceIcon.y = coords[1];
		_sprFaceIcon.loadGraphic("assets/images/heads.png", true, iconsize, iconsize);

		for (choice in 0...ItemArray.length)
		{
			if (Type.getClassName(Type.getClass(ItemArray[choice])) == "MenuItemDialogChoice")
			{
				var i = cast(ItemArray[choice], MenuItemDialogChoice).dBox.arrLines[0].face;
				_sprFaceIcon.animation.add(""+choice, [i*2, i*2+1], 4, false);
			}
		}
		_grpEverything.add(_sprFaceIcon);

		super(coords, Dimens, ItemDimens, ItemArray);
		setMenus();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		_sprFaceIcon.animation.play(""+(_selected[0] + _selected[1] * _itemDimens));
	}

	public function setMenus()
	{
		for (item in arrItem)
		{
			if (Type.getClassName(Type.getClass(item)) == "MenuItemDialogChoice")
				cast(item, MenuItemDialogChoice).menu = this;
		}
	}

	override public function close()
	{
		super.close();
		Reg.STATE = Reg.STATE_CUTSCENE;
	}
}

class MenuInventory extends BaseMenu
{
	var _itemArray:Array<BaseMenuItem>;
	var _descText:FlxText;

	public function new(Coords:Array<Float>, Dimens:Array<Float>, ColCount:Int, ?CloseString:String, ItemDescCoords:Array<Float>)
	{	
		var customDimens:Array<Float> = [200, Dimens[1]];

		_itemArray = generateItems();
		super(Coords, customDimens, ColCount, _itemArray, CloseString);
		var idc = ItemDescCoords;
		_descText = new FlxText(coords[0] + idc[0], coords[1] + idc[1], dimens[0], "Text", 8);
		add(_descText);
		_descText.scrollFactor.set();

		// +4, -12
	}

	public function generateItems():Array<BaseMenuItem>
	{
		var items:Array<BaseMenuItem> = new Array<BaseMenuItem>();
		for (item in ItemClasses.InventoryManager.arr)
		{
			items.push(new MenuItemItem(item, this));
		}
		return items;		
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		var item:BaseMenuItem = _arr[_selected[1]][_selected[0]];

		if (Type.getClassName(Type.getClass(item)) == "MenuItemItem")
			_descText.text = cast(item, MenuItemItem).item.desc;
		else  // that pesky MenuItemClose isn't a MenuItemItem!
			// _descText.text = "Next battle!";
			_descText.text = _closeString;
	}
}

class MenuPause extends BaseMenu
{
	var _itemArray:Array<BaseMenuItem>;

	public function new(Coords:Array<Float>, Dimens:Array<Float>, ItemDimens:Int, State:FlxState, Sub:FlxSubState)
	{	
		_itemArray = [  
						new MenuItemSubMenu("Pens", 5, State, Sub, new MenuPens([Coords[0] + 50 + Dimens[0]/2, Coords[1]], Dimens)),
						new MenuItemSubMenu("Items", 9, State, Sub, new MenuInventory([Coords[0] + Dimens[0]/2, Coords[1]], Dimens, 2, "back", [150, 5]))
		];

		super(Coords, Dimens, ItemDimens, _itemArray, "close");
	}
}

class MenuPens extends BaseMenu
{
	public var itemArray:Array<BaseMenuItem> = [];

	public function new(Coords:Array<Float>, Dimens:Array<Float>)
	{
		for (pen in PenClasses.PenManager.arrPens)
		{
			if (pen.isUnlocked == true)
			{
				var menuItemPen = new MenuItemPen(pen, this);
				// menuItemPen.menu = this;
				itemArray.push(menuItemPen);

			}
		}
		super(Coords, Dimens, 1, itemArray, "back", 10);
	}
}



