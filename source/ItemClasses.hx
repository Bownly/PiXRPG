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
	public static var arr:Array<BaseItem> = [];

	public function new() {}

	public static function removeItem()
	{
		for (item in 0...arr.length) 
		{
			if (arr[item].isUsed == true)
			{
				arr.remove(arr[item]);
				break;
			}
		}
	}

	public static function removeAllItems()
	{
		for (item in 0...arr.length) 
			arr.remove(arr[item]);
	}

	public static function addItem(item:BaseItem) 
	{
		if (arr.length >= 24)
		{
			trace("inventory too full");
		}
		else
		{
			arr.push(item);
		}
	}
}

class BaseItem
{
	public var isUsed:Bool;
	public var name:String;
	public var desc:String;
	public var iconID:Int;
	public var canUseOutOfBattle:Bool = false;

	public function new(Name:String, Desc:String, IconID:Int) 
	{
		isUsed = false;
		name = Name;
		desc = Desc;
		iconID = IconID;
	}

	public function use()
		isUsed = true;

	public function toss()
	{
		isUsed = true;
		InventoryManager.removeItem();
	}
}

class ItemHealing extends BaseItem
{
	public var _val:Int;

	public function new(Name:String, Desc:String, IconID:Int, Val:Int)
	{
		_val = Val;
		super(Name, Desc, IconID);
		canUseOutOfBattle = true;
	}

	override public function use()
	{
		Player.mp += _val;
		super.use();
		InventoryManager.removeItem();
	}

	

}

