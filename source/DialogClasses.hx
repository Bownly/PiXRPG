package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author Bownly
 */

class DialogLine
{
	public var line: String;
	public var face: Int;

	public function new(Face:Int, Line:String) 
	{
		line = Line;
		face = Face;
	}
}


class DialogBox
{
	public var arrLines: Array<DialogLine>;
	public var arrChoices: Array<MenuClasses.BaseMenuItem>;

	public function new(Lines:Array<DialogLine>, ?Choices:Array<MenuClasses.BaseMenuItem>) 
	{
	    arrLines = Lines;
	    arrChoices = Choices;
	}
}

// class DialogChoices
// {
// 	public var arrChoices: Array<MenuClasses.MenuItemFlag>;

// 	public function new(Choices:Array<MenuClasses.MenuItemFlag)
// 	{
// 		arrChoices = Choices;
// 	}
// }