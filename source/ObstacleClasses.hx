package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Bownly
 */


class BaseObstacle extends FlxSprite
{
	public var coords:Array<Float>;

	public function new(Coords:Array<Float>) 
	{
		coords = Coords;
		super(coords[0], coords[1]);
	}

}



class ObsHintHiderHorz extends FlxSprite
{
	public var coords:Array<Float>;

	public function new(Coords:Array<Float>) 
	{
		coords = Coords;
		super(coords[0]-50, coords[1]);
		loadGraphic(AssetPaths.vialhorz__png, true, 50, 10);
		animation.add("idle", [0], 1, true);
		animation.play("idle");
		scrollFactor.set();	
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (x < coords[0]-3)  // Stupid hack to get the gfx to line up. n needs to be speed+1
			x+=2;
	}
}



class ObsHintHiderVert extends FlxSprite
{
	public var coords:Array<Float>;

	public function new(Coords:Array<Float>) 
	{
		coords = Coords;
		super(coords[0], coords[1]-50);
		loadGraphic(AssetPaths.vial__png, true, 10, 50);
		animation.add("idle", [0], 1, true);
		animation.play("idle");
		scrollFactor.set();	
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (y < coords[1]-3)  // Stupid hack to get the gfx to line up. n needs to be speed+1
			y+=2;
	}
}



class ObsEraser extends FlxSprite
{
	var _coords:Array<Float>;
	var _board:PicrossBoard;
	var _square:PicrossSquare;
	var _enemy:EnemyClasses.BaseEnemy;

	// public function new(Coords:Array<Float>, Square:PicrossSquare, Enemy:EnemyClasses.BaseEnemy)
	public function new(Board:PicrossBoard, Enemy:EnemyClasses.BaseEnemy)
	{
		_board = Board;
		_square = _board.grpPicrossSquares.getRandom();
		_coords = [_square.x, _square.y];
		_enemy = Enemy;
		super(_coords[0], _coords[1]-50);
		loadGraphic(AssetPaths.drop__png, true, 20, 20);
		x -= 5;
		animation.add("fall", [0, 1], 4, true);
		animation.add("splat", [2, 3, 2, 3, 2], 3, false);
		animation.play("fall");
		scrollFactor.set();	
	}

	override public function update(elapsed:Float)
	{

		super.update(elapsed);
		if (y < _coords[1]-6)  // Stupid hack to get the gfx to line up. n needs to be speed+1
			y+=2;
		else
		{
			if (animation.name != "splat")
			{
				animation.play("splat");
				_square.status = PicrossSquare.OFF;
				_square.animation.play("off");
				_square.isActive = true;
				_board.checkColCorrect(_square.colID);
				_board.checkRowCorrect(_square.rowID);
			}
			if (animation.finished == true)
			{
				this.visible = false;
				this.alive = false;
				_enemy.removeObstacle();
			}
		}
	}
}












