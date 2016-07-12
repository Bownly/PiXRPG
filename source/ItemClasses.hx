package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author Bownly
 */

class InventoryManager
{
	public static var _arr:Array<BaseItem> = [];

	public function new() 
	{
	}

	public static function removeItem()
	{
		for (item in 0..._arr.length) 
		{
			if (_arr[item].isUsed == true)
			{
				_arr.remove(_arr[item]);
				break;
			}
		}
	}

	public static function addItem(item:BaseItem) 
	{
		if (_arr.length >= 6)
		{
			trace("inventory too full");
		}
		else
		{
			_arr.push(item);
		}
	}
}

class BaseItem
{
	public var isUsed:Bool;
	public var name:String;
	public var desc:String;
	public var iconID:Int;

	public function new(Name:String, Desc:String, IconID:Int) 
	{
		isUsed = false;
		name = Name;
		desc = Desc;
		iconID = IconID;
	}

	public function use()
	{
		isUsed = true;
	}

}

class ItemHealing extends BaseItem
{
	public var _val:Int;

	public function new(Name:String, Desc:String, IconID:Int, Val:Int)
	{
		_val = Val;
		super(Name, Desc, IconID);
	}

	override public function use()
	{
		Reg.pMP += _val;
		super.use();
		InventoryManager.removeItem();
	}

}

