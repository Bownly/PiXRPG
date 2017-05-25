package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Bownly
 */

class PenManager
{
	public static var arrPens:Array<Pen> = [ new Pen(0, "Dad's pen", true,
													[0, 0, 0, 
													 0, 1, 0,
													 0, 0, 0]),
											new Pen(1, "Ballpoint", false, 
													[0, 0, 0, 
													 0, 1, 1,
													 0, 0, 0]),
											new Pen(2, "Fountain", false, 
													[0, 1, 0, 
													 0, 1, 0,
													 0, 0, 0]),
											new Pen(3, "Quill", false, 
													[0, 0, 1, 
													 0, 1, 0,
													 0, 0, 0]),
											new Pen(4, "Pixcalibur", false, 
													[0, 1, 1, 
													 0, 1, 1,
													 0, 0, 0])
											];
	public static var equipped:Pen = arrPens[0];

	public static function equip(P:Pen):Void
		equipped = arrPens[P.id];

	public static function resetPens():Void
	{
		arrPens = [ new Pen(0, "Dad's pen", false,
							[0, 0, 0, 
							 0, 1, 0,
							 0, 0, 0]),
					new Pen(1, "Ballpoint", false, 
							[0, 0, 0, 
							 0, 1, 1,
							 0, 0, 0]),
					new Pen(2, "Fountain", false, 
							[0, 1, 0, 
							 0, 1, 0,
							 0, 0, 0]),
					new Pen(3, "Quill", false, 
							[0, 0, 1, 
							 0, 1, 0,
							 0, 0, 0]),
					new Pen(4, "Pixcalibur", false, 
							[0, 1, 1, 
							 0, 1, 1,
							 0, 0, 0])
					];
		equipped = arrPens[0];
	}

	public static function unlockPen(ID:Int):Void
	arrPens[ID].isUnlocked = true;
}

class Pen
{
	public var id:Int;
	public var name:String;
	public var isUnlocked:Bool;
	public var arrCursors:Array<Int>;

	public function new(ID:Int, N:String, U:Bool, C:Array<Int>) 
	{
		id = ID;
		name = N;
		isUnlocked = U;
		arrCursors = C;
	}
}

