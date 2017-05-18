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
	public var dimens:Array<Int>;
	public var maxMP:Int;
	public var mp:Int;
	public var color:Array<Int>;
	// public var arrObstacles:Array<BaseObstacle>;
	public var _grpObs:FlxTypedGroup<BaseObstacle>;
	public var _board:PicrossBoard;
	public var timerAttack:Float = 0;
	public var attackFreq:Int = 1;
	public var squareCount:Int = 0;
	public var damage:Int = 10;


	public function new(?ID:Int, ?S:Array<Int>, ?C:Array<Int>, ?D:Int, ?M:Int) 
	{
		id = ID;
		if (S != null)
			dimens = S;
		else
			dimens = [1, 1];
		if (C != null)
			color = C;
		else
			color = [8,9];
		if (D > -1)
			damage = D;
		else
			damage = 5;
		if (M > 0)
			maxMP = M;
		else
			maxMP = 5;
		// mp = Std.int(dimens*dimens/2);
	}

	public function update(elapsed:Float) {
		mp = maxMP - _board.curCount;
	}
	public function spawnObstacle() {}
	public function removeObstacle() {}
	public function removeAllObstacles() {}

	public function setBoard(B:PicrossBoard) {
		_board = B;
	}
	public function setGrpObs(G:FlxTypedGroup<BaseObstacle>) {
		_grpObs = G;
	}

	public function onSquareFilled() {
		squareCount++;
	}

}

class EnemyTest extends BaseEnemy
{
	public function new()
	{
		super(6, [10, 15], [4, 13], 0, 80);
	}
}

class EnemyDoor extends BaseEnemy
{
	public function new(?Dimens:Array<Int>)
	{
		// id = 7;
		if (Dimens != null)
			dimens = Dimens;
		else
			dimens = [5, 4];
		// color = 2;
		super(7, dimens, [2,3], 5);
	}
}

class EnemyMush extends BaseEnemy
{

	public function new()
	{
		super();
		id = 0;
		dimens = [4, 4];
		color = [4, 5];
		attackFreq = 5;
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

	override public function onSquareFilled() 
	{
		super.onSquareFilled();
		removeObstacle();
		if (squareCount % attackFreq == 0)
		{
			timerAttack = 0;
			spawnObstacle();
		}
	}


	override public function spawnObstacle()
	{
		var obstacleHP:Int = 2;
		if (FlxG.random.int(0, 1) == 0)
		{
			var vial = new ObsHintHider([_board.grpPicrossSquares.getRandom(0).x, _board.coords[1]], obstacleHP, true);
			_grpObs.add(vial);
		}
		else
		{
			var vial = new ObsHintHider([_board.coords[0], _board.grpPicrossSquares.getRandom().y], obstacleHP, false);
			_grpObs.add(vial);
		}
	}

	override public function removeObstacle()
	{
		// var obs = _grpObs.getFirstExisting();
		for (obs in _grpObs)
		{
			if (obs != null && obs.tryRemove() == true)
				_grpObs.remove(obs);
		}
	}

	override public function removeAllObstacles()
	{
		for (obs in _grpObs)
		{
			_grpObs.remove(obs);
		}
	}
}

class EnemyBee extends BaseEnemy
{
	public function new()
	{
		super();
		id = 1;
		dimens = [5, 5];
		color = [2, 3];
	}
}


class EnemySnail extends BaseEnemy
{
	public function new()
	{
		super();
		id = 2;
		dimens = [5, 5];
		color = [6, 7];
		attackFreq = 15;
	}

	override public function update(elapsed:Float)
	{
		timerAttack += elapsed;

		if (timerAttack >= 9)
		{
			spawnObstacle();
			timerAttack = 0;
		}

		super.update(elapsed);
	}

	override public function onSquareFilled()
	{
		super.onSquareFilled();
		if (squareCount % attackFreq == 0)
		{
			spawnObstacle();
			timerAttack = 0;
		}
	}

	override public function spawnObstacle()
	{
		var drop = new ObsLily(_board, this);
		_grpObs.add(drop);
	}
}

class EnemyFlower extends BaseEnemy
{
	public function new()
	{
		super();
		id = 3;
		dimens = [6, 6];
		color = [8, 9];
	}
}

class EnemyOwl extends BaseEnemy
{
	public function new()
	{
		super();
		id = 4;
		dimens = [7, 7];
		color = [12, 9];
		attackFreq = 15;
	}

	override public function update(elapsed:Float)
	{
		timerAttack += elapsed;

		if (timerAttack >= 9)
		{
			spawnObstacle();
			timerAttack = 0;
		}

		super.update(elapsed);
	}

	override public function onSquareFilled()
	{
		super.onSquareFilled();
		if (squareCount % attackFreq == 0)
		{
			spawnObstacle();
			timerAttack = 0;
		}
	}

	override public function spawnObstacle()
	{
		var drop = new ObsLily(_board, this);
		_grpObs.add(drop);
	}
}








