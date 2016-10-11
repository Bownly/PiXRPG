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
	// public var arrObstacles:Array<BaseObstacle>;
	public var grpObs:FlxTypedGroup<BaseObstacle>;
	public var board:PicrossBoard;
	public var timerAttack:Float = 0;


	public function new(?ID:Int, ?S:Int, ?C:Int) 
	{
		id = ID;
		dimens = S;
		color = C;
		// arrObstacles = [];
	}

	public function update(elapsed:Float) {}
	public function spawnObstacle() {}
	public function removeObstacle() {}
	public function removeAllObstacles() {}
}

class EnemyTest extends BaseEnemy
{
	public function new()
	{
		super();
		id = 0;
		dimens = 15;
		color = 10;
	}
}


class EnemyMush extends BaseEnemy
{

	public function new()
	{
		super();
		id = 0;
		dimens = 4;
		color = 4;
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
		var obstacleHP:Int = 2;
		if (FlxG.random.int(0, 1) == 0)
		{
			var vial = new ObsHintHider([board.grpPicrossSquares.getRandom(0).x, board.coords[1]], obstacleHP, true);
			grpObs.add(vial);
		}
		else
		{
			var vial = new ObsHintHider([board.coords[0], board.grpPicrossSquares.getRandom().y], obstacleHP, false);
			grpObs.add(vial);
		}
	}

	override public function removeObstacle()
	{
		// var obs = grpObs.getFirstExisting();
		for (obs in grpObs)
		{
			if (obs != null && obs.tryRemove() == true)
				grpObs.remove(obs);
		}
	}

	override public function removeAllObstacles()
	{
		for (obs in grpObs)
		{
			grpObs.remove(obs);
		}
	}
}

class EnemyBee extends BaseEnemy
{
	public function new()
	{
		super();
		id = 1;
		dimens = 5;
		color = 2;
	}
}


class EnemySnail extends BaseEnemy
{
	public function new()
	{
		super();
		id = 2;
		dimens = 5;
		color = 6;
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
		color = 8;
	}
}









