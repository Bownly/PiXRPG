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
	public static var arrPens:Array<Pen> = [new Pen(0, "normal", true,
													[0, 0, 0, 
											    	 0, 1, 0,
													 0, 0, 0]),
											new Pen(1, "ballpoint", true, 
													[0, 0, 0, 
													 0, 1, 1,
												   	 0, 0, 0]),
											new Pen(2, "fountain", true, 
													[0, 1, 0, 
													 0, 1, 0,
												   	 0, 0, 0]),
											new Pen(3, "quill", true, 
													[0, 0, 1, 
													 0, 1, 0,
												   	 0, 0, 0]),
											new Pen(4, "picscalibur", true, 
													[0, 1, 1, 
													 0, 1, 1,
													 0, 0, 0]),
	];
	public static var equipped:Pen = arrPens[0];

	public static function equip(P:Pen)
		equipped = arrPens[P.id];
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

