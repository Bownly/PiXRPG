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

import DialogClasses;
import ItemClasses;
import PenClasses;
import cloner.Cloner;

/**
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
		icon.y += 1;
		icon.animation.add("idle", [iconID, iconID], 2, true);
		icon.animation.play("idle");
		icon.visible = true;
		grpRender.add(icon);
	}
	private function addText(Anchor:Array<Float>)
	{
		// commented out line was the original width. I made it longer for dialog options.
		// the new value seems to not break anything, so I'll get away with being lazy for now.
		// var item = new FlxText(Anchor[0], 0, 80, name, 8);
		var item = new FlxText(Anchor[0], 0, FlxG.width - Reg.ICONSIZE*2, name, 8);
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
	public var dBox:DialogBox;

	public function new(DBLine:Array<DialogLine>, Menu:BaseMenu, Flag:EventClasses.EventFlag)
	{
		dBox = new DialogBox(DBLine);
		super(dBox.arrLines[0].line, 0, Menu, Flag);
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
		_flag.update(FlxG.elapsed);
		super.selected();
	}
}

class MenuItemItem extends BaseMenuItem
{
	public var item:BaseItem;
	var _coords:Array<Float>;
	var _dimens:Array<Float>;
	var _substate:FlxSubState;
	var _menu:MenuInventory;

	public function new(Item:BaseItem, Sub:FlxSubState, Menu:MenuInventory)
	{
		item = Item;
		_substate = Sub;
		_menu = Menu;
		// x dimen is kinda arbitrary
		// y dimen is calculated by BaseMenu.ITEM_GAP (12) * (BaseMenuItem count) + Window.pad*4
		_dimens = [FlxG.width/5*3, 20.0];
		_coords = [(FlxG.width - _dimens[0])/2, _menu.dimens[1] + _menu.coords[1] + 16];
		super(item.name, item.iconID);
	}

	override public function selected()
	{
		var menu = new MenuInvUseToss(_coords, _dimens, item, _menu);
		_substate.add(menu);
		menu.open();
	}
}

class MenuItemItemUse extends MenuItemClose
{
	var _item:BaseItem;
	var _invMenu:MenuInventory;

	public function new(Menu:BaseMenu, InvMenu:MenuInventory, Item:BaseItem)
	{
		_item = Item;
		_invMenu = InvMenu;
		super("Use", Menu);
		iconID = _item.iconID;
	}

	override public function selected()
	{
		super.selected();
		_item.use();
		if (Type.getClassName(Type.getClass(_invMenu)) == "MenuInventory")
			_invMenu.refresh(cast(_invMenu, MenuInventory).generateItems());
	}
}

class MenuItemItemToss extends MenuItemClose
{
	var _item:BaseItem;
	var _invMenu:MenuInventory;

	public function new(Menu:BaseMenu, InvMenu:MenuInventory, Item:BaseItem)
	{
		_item = Item;
		_invMenu = InvMenu;
		super("Toss", Menu);
		iconID = 12;  // 12 is the id of the trash icon
	}

	override public function selected()
	{
		super.selected();
		_item.toss();
		if (Type.getClassName(Type.getClass(_invMenu)) == "MenuInventory")
			_invMenu.refresh(cast(_invMenu, MenuInventory).generateItems());
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
	var _coords:Array<Float>;
	var _dimens:Array<Float>;
	var _itemDimens:Int;
	var _substate:FlxSubState;
	var _menuKind:String;

	public function new(Name:String, IconID:Int, Coords:Array<Float>, Dimens:Array<Float>, 
						ItemDimens:Int, Sub:FlxSubState, MenuKind:String)
	{
		super(Name);
		iconID = IconID;
		_coords = Coords;
		_dimens = Dimens;
		_itemDimens = ItemDimens;

		_substate = Sub;
		_menuKind = MenuKind;
	}

	override public function selected()
	{

		switch (_menuKind)
		{
			case "Pens":
			{
				var _menu = new MenuPens(_coords, _dimens);
				_substate.add(_menu);
				_menu.open();
			}
			case "Items":
			{
				var _menu = new MenuInventory(_coords, _dimens, 2, "back", [150, 5], _substate);
				_substate.add(_menu);
				_menu.open();
			}
		}

	}
}

class MenuManager
{
	public static var arrMenus:Array<BaseMenu> = [];
	public static var activeMenu:BaseMenu = null;
	public static var subState:FlxSubState = null;

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

	public static function setSubState(s:FlxSubState)
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

    static public var ITEM_GAP:Int = 12;

	var _grpEverything:FlxTypedGroup<FlxSprite>;
	var _grpIcon:FlxTypedGroup<FlxSprite>;
	var _cursor:FlxSprite;
	var _selected:Array<Int> = [0, 0];
	var _wasHighlighted:BaseMenuItem;
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

 		_highlighted = arrItem[0];
		_wasHighlighted = _highlighted;
 		refresh(arrItem);		

		add(_window);
		add(_grpEverything);
		
		for(item in _grpEverything) 
			item.scrollFactor.set();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (!this.isActive)
			_cursor.visible = false;	
		else if (this.isActive)
		{
			_cursor.visible = true;	
			openTimer -= elapsed;
			if (openTimer <= 0)
			{
				_wasHighlighted = _highlighted;
				if (FlxG.keys.anyJustPressed(["DOWN", "S"]))
				{
					if (_selected[1] < _arrSprite.length-1 && _arrSprite[_selected[1]+1][_selected[0]] != null)
						_selected[1] += 1;
					else
						_selected[1] = 0;
					_cursor.y = _arrSprite[_selected[1]][_selected[0]].y;
					_highlighted = _arr[_selected[1]][_selected[0]];
				}
				else if (FlxG.keys.anyJustPressed(["UP", "W"]))
				{
					if (_selected[1]-1 >= 0)
						do _selected[1] -= 1 while (_selected[1]-1 >= 0 && _arrSprite[_selected[1]-1][_selected[0]] == null);
					else
					{
						while (_selected[1]+1 < _arrSprite.length && _arrSprite[_selected[1]+1][_selected[0]] != null)
							_selected[1] += 1;	
					}
					_cursor.y = _arrSprite[_selected[1]][_selected[0]].y;
					_highlighted = _arr[_selected[1]][_selected[0]];
				}
				else if (FlxG.keys.anyJustPressed(["RIGHT", "D"]))
				{
					if (_selected[0] >= _arrSprite[_selected[1]].length-1)
						_selected[0] = 0;
					else if (_arrSprite[_selected[1]][_selected[0]+1] != null)
						_selected[0] += 1;
					_cursor.x = _arrSprite[_selected[1]][_selected[0]].x - _cursor.width;
					_highlighted = _arr[_selected[1]][_selected[0]];
				}
				else if (FlxG.keys.anyJustPressed(["LEFT", "A"]))
				{
					if (_selected[0] > 0)
						_selected[0] -= 1;
					else  // loop around to the furthest right item
					{
						while (_selected[0] < _arrSprite[_selected[1]].length-1 && _arrSprite[_selected[1]][_arrSprite[_selected[1]].length - 1 - _selected[0]] != null)
							_selected[0] += 1;
					}
					_cursor.x = _arrSprite[_selected[1]][_selected[0]].x - _cursor.width;
					_highlighted = _arr[_selected[1]][_selected[0]];
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
 		refresh(arrItem);
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

		// add sprites
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
			switch (_itemDimens) {
				case 1:
					_arr.push([_closeItem]);
					var grp = _closeItem.renderLine([coords[0] + _cursor.width + _window.pad*2, coords[1]]);
					grp.y = coords[1] + dimens[1] - ITEM_GAP - _window.pad*2;
					_arrSprite.push([grp]);
					_grpEverything.add(grp);
				case 2:
					_arr.push([_closeItem, null]);
					var grp = _closeItem.renderLine([coords[0] + _cursor.width + _window.pad*2, coords[1]]);
					grp.y = coords[1] + dimens[1] - ITEM_GAP - _window.pad*2;
					_arrSprite.push([grp, null]);
					_grpEverything.add(grp);
				case 3:
					if (Type.getClassName(Type.getClass(this)) == "MenuInvUseToss")
					{
						_arr[0].push(_closeItem);
						var grp = _closeItem.renderLine([coords[0] + _cursor.width + _window.pad*2 + (dimens[0] * ((_arr[0].length-1)/_itemDimens)), coords[1]]);
						grp.y = coords[1] + dimens[1] - ITEM_GAP - _window.pad*2;
						_arrSprite[0].push(grp);
						_grpEverything.add(grp);	
					}
					else
					{
						_arr.push([_closeItem, null, null]);
						var grp = _closeItem.renderLine([coords[0] + _cursor.width + _window.pad*2, coords[1]]);
						grp.y = coords[1] + dimens[1] - ITEM_GAP - _window.pad*2;
						_arrSprite.push([grp, null, null]);
						_grpEverything.add(grp);				
					}
				case 4:
					_arr[0].push(_closeItem);
					var grp = _closeItem.renderLine([coords[0] + _cursor.width + _window.pad*2 + (dimens[0] * ((_arr[0].length-1)/_itemDimens)), coords[1]]);
					grp.y = coords[1] + dimens[1] - ITEM_GAP - _window.pad*2;
					_arrSprite[0].push(grp);
					_grpEverything.add(grp);
			}
		}

		for (sprite in _grpEverything)
		{
			if (sprite != null)
				sprite.scrollFactor.set();	
		}

		_selected = [0, 0];
		
		_highlighted = _arr[0][0];
		
		_cursor.x = _arrSprite[_selected[1]][_selected[0]].x - _cursor.width;
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
	var _dsGroup:DialogSpriteGroup;
	var _face:Int = 0;
	var _sub:FlxSubState;

	public function new(Coords:Array<Float>, Dimens:Array<Float>, ColCount:Int, ?CloseString:String, ItemDescCoords:Array<Float>, Sub:FlxSubState)
	{	
		_sub = Sub;
		var customDimens:Array<Float> = [200, Dimens[1]];
		super(Coords, Dimens, ColCount, [], CloseString);
		arrItem = generateItems();
		_itemArray = arrItem;
		restartDSGroup();
	}

	override public function update(elapsed:Float)
	{
		if (_highlighted != _wasHighlighted)
			restartDSGroup();
		super.update(elapsed);
	}

	public function generateItems():Array<BaseMenuItem>
	{
		var items:Array<BaseMenuItem> = new Array<BaseMenuItem>();
		for (item in InventoryManager.arr)
			items.push(new MenuItemItem(item, _sub, this));
		return items;	
		_highlighted = _arr[0][0];
	}

	public function restartDSGroup():Void
	{
		remove(_dsGroup);
	
		if (Reg.flags["playerHasHood"] == 1)
			_face = 5;
		
		var item:BaseMenuItem = _arr[_selected[1]][_selected[0]];
		if (Type.getClassName(Type.getClass(item)) == "MenuItemItem")
			_dsGroup = new DialogSpriteGroup(new DialogBox([new DialogLine(_face, cast(item, MenuItemItem).item.desc)]), false, 60);
		else  // that pesky MenuItemClose isn't a MenuItemItem!
			_dsGroup = new DialogSpriteGroup(new DialogBox([new DialogLine(_face, _closeString)]), false, 60);
		add(_dsGroup);
	}
}

class MenuInvUseToss extends BaseMenu
{
	var _itemArray:Array<BaseMenuItem>;

	public function new(Coords:Array<Float>, Dimens:Array<Float>, Item:BaseItem, Menu:MenuInventory)
	{	
		// item menu's x dimen is the width from its origin to the end of the screen - MenuSubState's wpad val
		// pens menu's x dimen is kinda arbitrary
		// y dimens are calculated by BaseMenu.ITEM_GAP (12) * (BaseMenuItem count) + Window.pad*4
		_itemArray = [  new MenuItemItemUse(this, Menu, Item),
						new MenuItemItemToss(this, Menu, Item)
		];
		super(Coords, Dimens, 3, _itemArray, "Close");
	}
}

class MenuPause extends BaseMenu
{
	var _itemArray:Array<BaseMenuItem>;

	public function new(Coords:Array<Float>, Dimens:Array<Float>, ItemDimens:Int, SubMenuAnchor:Array<Float>, State:FlxState, Sub:FlxSubState)
	{	
		// item menu's x dimen is the width from its origin to the end of the screen - MenuSubState's wpad val
		// pens menu's x dimen is kinda arbitrary
		// y dimens are calculated by BaseMenu.ITEM_GAP (12) * (BaseMenuItem count) + Window.pad*4
		// item menu's + 4 is kinda arbitrary and was chosen because it looks good
		_itemArray = [  new MenuItemSubMenu("Items", 9, [SubMenuAnchor[0], SubMenuAnchor[1] + 4], [FlxG.width - SubMenuAnchor[0] - 16, 128], ItemDimens, Sub, "Items"),
						new MenuItemSubMenu("Pens", 5, SubMenuAnchor, [100, 80], ItemDimens, Sub, "Pens")
		];
		super(Coords, Dimens, ItemDimens, _itemArray, "Close");
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
				itemArray.push(menuItemPen);
			}
		}
		super(Coords, Dimens, 1, itemArray, "back", 10);
	}
}



