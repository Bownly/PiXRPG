package;

import flixel.FlxSprite;

/**
 * ...
 * @author ...
 */
class PicrossSquare extends FlxSprite
{

	static public var ON:Int = 1;
	static public var OFF:Int = 0;
	static public var MARK:Int = 2;
	static public var SOLVE:Int = 3;
	
	static public var NOTHING:Int = 0;
	static public var HURT:Int = 1;
	static public var CORRECT:Int = 2;
	static public var GOODHURT:Int = 3;
	
	var _id:Int = 0;
	public var colID:Int;
	public var rowID:Int;
	public var status:Int = 0;  // 0 = off, 1 = on, 2 == marked
	public var answer:Int = 2;
	public var isActive:Bool = true;
	
	public function new(X:Float=0, Y:Float=0, ID:Int, XID:Int, YID:Int, Answer:Int) 
	{
		super(X, Y);
		
		_id = ID;
		colID = XID;
		rowID = YID;
		answer = Answer;
		
		var o = 4;  // number of colors per type
		loadGraphic(AssetPaths.picross_colors__png, true, 9, 9);
		animation.add("off",       [0 + o * _id]);
		animation.add("on",        [1 + o * _id]);
		animation.add("mark",      [2 + o * _id]);
		animation.play("off");
	}
	
	public function turnOnOrOff(Guess:Int):Int
	{			
		if (isActive)
		{
			if (Guess == ON)
			{
				if (animation.curAnim.name == "mark")
				{
					animation.play("off");
					status = OFF;
					return NOTHING;
				}
				else if (answer == ON)
				{
					isActive = false;
					animation.play("on");
					status = ON;
					return CORRECT;
				}
				else
				{
					isActive = false;
					animation.play("mark");
					return HURT;
				}
			}
			else if (Guess == MARK)
			{
				if (animation.curAnim.name == "mark")
				{
					animation.play("off");
					status = OFF;
				}
				else
				{
					animation.play("mark");
				}
				return NOTHING;
			}
			// this is for a larger cursor size, if I decide to add that
			else if (Guess == SOLVE)
			{
				if (isActive)
				{
					isActive = false;
					if (answer == ON)
					{
						animation.play("on");
						status = ON;
						return CORRECT;
					}
					else
					{
						animation.play("mark");
						return NOTHING;
					}
				}
				else
					return NOTHING;
			}
			else 
				return NOTHING;
		}
		else
			return NOTHING;
	}
	
	
	public function playAnimation():Void
	{
		if (answer == ON)
			animation.play("on");
		else
			animation.play("mark");
	}
	
}