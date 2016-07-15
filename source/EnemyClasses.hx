package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

import ObstacleClasses;

/**
 * ...
 * @author Bownly
 */


class BaseEnemy
{
	public var id:Int;
	public var dimens:Int;
	public var color:Int;
	public var arrObstacles:Array<FlxSprite>;
	public var grpObs:FlxTypedGroup<FlxSprite>;
	public var board:PicrossBoard;
	public var timerAttack:Float = 0;


	public function new(?ID:Int, ?S:Int, ?C:Int) 
	{
		id = ID;
		dimens = S;
		color = C;
		arrObstacles = [];
	}

	public function update(elapsed:Float)
	{
	}
	public function spawnObstacle()
	{
	}
	public function removeObstacle()
	{
	}
	public function removeAllObstacles()
	{
	}
}

class EnemyMush extends BaseEnemy
{

	public function new()
	{
		super();
		id = 0;
		dimens = 4;
		color = 0;
	}

	override public function update(elapsed:Float)
	{
		timerAttack += elapsed;

		if (timerAttack >= 5)
		{
			spawnObstacle();
			timerAttack = 0;
		}

		super.update(elapsed);
	}

	override public function spawnObstacle()
	{
		if (FlxG.random.int(0, 1) == 0)
		{
			var vial = new ObsHintHiderVert([board.grpPicrossSquares.getRandom(0).x, board.coords[1]]);
			grpObs.add(vial);
		}
		else
		{
			var vial = new ObsHintHiderHorz([board.coords[0], board.grpPicrossSquares.getRandom().y]);
			grpObs.add(vial);
		}
	}

	override public function removeObstacle()
	{
		grpObs.remove(grpObs.getFirstExisting());
	}

	override public function removeAllObstacles()
	{
		for (obj in grpObs)
			grpObs.remove(obj);
	}

}

class EnemyBee extends BaseEnemy
{
	public function new()
	{
		super();
		id = 1;
		dimens = 5;
		color = 0;
	}
}


class EnemySnail extends BaseEnemy
{
	public function new()
	{
		super();
		id = 2;
		dimens = 5;
		color = 1;
	}

	override public function update(elapsed:Float)
	{
		timerAttack += elapsed;

		if (timerAttack >= 3)
		{
			spawnObstacle();
			timerAttack = 0;
		}

		super.update(elapsed);
	}

	override public function spawnObstacle()
	{
		// var square = board.grpPicrossSquares.getRandom();
		// var drop = new ObsEraser([square.x, square.y], square, this);
		// var square = board.grpPicrossSquares.getRandom();
		var drop = new ObsEraser(board, this);
		grpObs.add(drop);
	}
}

class EnemyFlower extends BaseEnemy
{
	public function new()
	{
		super();
		id = 3;
		dimens = 6;
		color = 1;
	}

}









