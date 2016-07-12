package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

import PenClasses;

/**
 * ...
 * @author Bownly
 */



class BaseMenuItem
{
	public var name:String;
	public var iconID:Int;

	public function new(Name:String, ?IconID:Int)
	{
		name = Name;
		iconID = IconID;
	}

	public function selected()
	{
	}

	public function highlighted()
	{
	}
}

class MenuItemClose extends BaseMenuItem
{
	public var menu:BaseMenu;

	public function new(Name:String, ?Menu:BaseMenu)
	{
		menu = Menu;
		super(Name);
	}

	override function selected()
	{
		menu.close();
	}
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


class MenuItemPen extends MenuItemClose
{
	var _pen:Pen;
	
	public function new(P:Pen)
	{
		_pen = P;
		super(_pen.name);
		iconID = _pen.id;
	}

	override public function selected()
	{
		PenManager.equip(_pen);
		super.selected();
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
		var sub = new MenuSubState(FlxG.width/2, FlxG.height/2, _substate);
		// var menu = new MenuPause([_menu.coords[0] + 20, _menu.coords[1] + 20], [100, 100], 1, _substate, sub);

		var menu:BaseMenu = null;
		var x = _menu.coords[0] + _menu.dimens[0]/2;
		if (Type.getClassName(Type.getClass(_menu)) == "MenuPens")
		{
			menu = new MenuPens([x, _menu.coords[1]], [100, 100]);
			var castedMenu = cast(_menu, MenuPens);
			castedMenu.refresh(castedMenu.itemArray);
		}
		else if (Type.getClassName(Type.getClass(_menu)) == "MenuInventory")
			menu = new MenuInventory([x, _menu.coords[1]], 
							[100, 200], 
							1, "back");
		else if (Type.getClassName(Type.getClass(_menu)) == "MenuPause")
			menu = new MenuPause([x, _menu.coords[1]], [100, 100], 1, _substate, sub);

		sub.setMenu(menu);

		_substate.openSubState(sub);		
		super.selected();
	}

}




class BaseMenu extends FlxGroup
{
	public var isAlive:Bool = true;

	var _sprBack:FlxSprite;
	var _sprBackBG:FlxSprite;
    public var coords:Array<Float>;
    public var dimens:Array<Float>;
    var _itemDimens:Int;
    var _xPad:Int = 8;
    var _yPad:Int = 8;
    var _iconBuffer:Int = 12;


	var _grpEverything:FlxTypedGroup<FlxSprite>;
	var _grpIcon:FlxTypedGroup<FlxSprite>;
	var _cursor:FlxSprite;
	var _selected:Array<Int> = [0, 0];
	var _arr:Array<Array<BaseMenuItem>>;
	public var arrItem:Array<BaseMenuItem>;
	var _arrSprite:Array<Array<FlxText>>;
	var _closeString:String;
	var _closeItem:MenuItemClose;
	var _window:Window;

	public function new(Coords:Array<Float>, Dimens:Array<Float>, ItemDimens:Int, ItemArray:Array<BaseMenuItem>, ?CloseString, ?IconBuffer) 
	{

		super();
		_arrSprite = new Array<Array<FlxText>>();
		_grpIcon = new FlxTypedGroup<FlxSprite>();
		_grpEverything = new FlxTypedGroup<FlxSprite>();
		coords = Coords;
		dimens = Dimens;
		_itemDimens = ItemDimens;
		_arr = new Array<Array<BaseMenuItem>>();
		arrItem = ItemArray;
		// _iconBuffer = IconBuffer;

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
		super.update(elapsed);

		if (FlxG.keys.anyJustPressed(["DOWN", "S"]))
		{
			if (_selected[1]+1 < _arrSprite.length && _arrSprite[_selected[1]+1][_selected[0]] != null)
				_selected[1] += 1;
			else 
				_selected[1] = 0;
			_cursor.y = _arrSprite[_selected[1]][_selected[0]].y;
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
		}
		else if (FlxG.keys.anyJustPressed(["RIGHT", "D"]))
		{
			if (_selected[0] >= _arrSprite[0].length-1)
				_selected[0] = 0;
			else if (_arrSprite[_selected[1]][_selected[0]+1] != null)
				_selected[0] += 1;
			_cursor.x = _arrSprite[_selected[1]][_selected[0]].x - _cursor.width - _iconBuffer;
		}
		else if (FlxG.keys.anyJustPressed(["LEFT", "A"]))
		{
			trace("_arrSprite: ", _arrSprite);
			trace("_arrSprite[0].length-1", _arrSprite[0].length-1);
			if (_selected[0] <= 0 && _arrSprite[_selected[1]][_arrSprite[0].length-1] == null)
				_selected[0] += 0;
			else if (_selected[0] <= 0 && _arrSprite[_selected[1]][_arrSprite[0].length-1] != null)
				_selected[0] = _arrSprite[0].length-1;
			else 
				_selected[0] -= 1;
			_cursor.x = _arrSprite[_selected[1]][_selected[0]].x - _cursor.width - _iconBuffer;
		}

		if (FlxG.keys.anyJustPressed(["J"]))
			_arr[_selected[1]][_selected[0]].selected();
		// note: the null check is to disallow backing out of a dialog choice menu
		else if (FlxG.keys.anyJustPressed(["K"]) && _closeString != null)
			close();

	}

	public function close()
	{
		isAlive = false;
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
			var tempArr:Array<FlxText> = new Array<FlxText>();
			for (j in 0..._arr[i].length)
			{
				var iconBuffer = 0;
				// if (_arr[i][j].iconID != 0)
				// 	iconBuffer = 8 + _window.pad;  // note: the 8 is the width of the icon
				var item = new FlxText(coords[0] + _cursor.width + _iconBuffer, coords[1], 64, _arr[i][j].name, 8);
				item.x += (dimens[0] * (j/_itemDimens)) + _window.pad*2;
				item.y += i * item.height + _window.pad*2 + 1;
				if (item != null)
					tempArr.push(item);
				_grpEverything.add(item);

				var icon = new FlxSprite(item.x - _iconBuffer + _window.pad, item.y);
			// icon.y += i * 18 + _window.pad*2;
			// icon.x += (dimens[0] * (j/_itemDimens)) + _window.pad*2;
				icon.loadGraphic(AssetPaths.item_icons__png, true, 8, 8);
				icon.animation.add("idle", [_arr[i][j].iconID, _arr[i][j].iconID], 2, true);
				icon.animation.play("idle");
				icon.visible = true;
				_grpIcon.add(icon);
				_grpEverything.add(icon);
				trace("added icon");

			}
			if (tempArr != null)
				_arrSprite.push(tempArr);
		}

		if (_closeString != null)
		{
			_closeItem = new MenuItemClose(_closeString, this);
			_arr.push([_closeItem, null]);
			var item = new FlxText(coords[0] + _cursor.width + _iconBuffer, coords[1], 64, _arr[_arr.length-1][0].name, 8);
			item.x += _window.pad*2;
			while (item.y < coords[1] + dimens[1] - _yPad - item.height)
			{
				item.y += item.height;
			}
	
			var icon = new FlxSprite(item.x - _iconBuffer + _window.pad, item.y +1);
			icon.loadGraphic(AssetPaths.item_icons__png, true, 8, 8);
			icon.animation.add("idle", [6], 3, true);
			icon.animation.play("idle");
			_grpIcon.add(icon);
			_grpEverything.add(icon);

			_arrSprite.push([item, null]);

			_grpEverything.add(item);
		}

		for (sprite in _grpEverything)
		{

				if (sprite != null)
					sprite.scrollFactor.set();
			
		}

		_selected = [0, 0];
		_cursor.x = _arrSprite[_selected[1]][_selected[0]].x - _cursor.width - _iconBuffer;
		_cursor.y = _arrSprite[_selected[1]][_selected[0]].y;

	}

}


class MenuDialogChoices extends BaseMenu
{
	public function new(Coords:Array<Float>, Dimens:Array<Float>, ItemDimens:Int, ItemArray:Array<BaseMenuItem>)
	{
		super(Coords, Dimens, ItemDimens, ItemArray);
		setMenus();
	}

	public function setMenus()
	{
		for (item in arrItem)
		{
				if (Type.getClassName(Type.getClass(item)) == "MenuItemFlag")
					cast(item, MenuItemFlag).menu = this;
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

	public function new(Coords:Array<Float>, Dimens:Array<Float>, ColCount:Int, ?CloseString:String)
	{	
		_itemArray = generateItems();
		super(Coords, Dimens, ColCount, _itemArray, CloseString);
		_descText = new FlxText(coords[0] + 4, coords[1] - 12, dimens[0], "Text", 8);
		add(_descText);
		_descText.scrollFactor.set();
	}

	public function generateItems():Array<BaseMenuItem>
	{
		var items:Array<BaseMenuItem> = new Array<BaseMenuItem>();
		for (item in ItemClasses.InventoryManager._arr)
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
			_descText.text = "Next battle!";


	}

}


class MenuPause extends BaseMenu
{
	var _itemArray:Array<BaseMenuItem>;

	public function new(Coords:Array<Float>, Dimens:Array<Float>, ItemDimens:Int, State:FlxState, Sub:FlxSubState)
	{	
		_itemArray = [  new MenuItemSubMenu("Pens", 5, State, Sub, new MenuPens(Coords, Dimens)),
						new MenuItemSubMenu("Items", 9, State, Sub, new MenuInventory(Coords, Dimens, 1, "back"))
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
				var menuItemPen = new MenuItemPen(pen);
				menuItemPen.menu = this;
				itemArray.push(menuItemPen);

			}
		}
		super(Coords, Dimens, 1, itemArray, "back", 10);
	}

	// override public function refresh(_itemArray)
	// {
	// 	super.refresh(_itemArray);
	// }
}



