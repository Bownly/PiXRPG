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


// 7 doors 15 xp
// 1 door++ 21 xp
// 1 owl 60 xp

// 105
// 126
// 186


// 2.5

// tads 3 xp
// mush 6
// bees 9 xp
// frogs 15 xp
// dummy = 3 xp


class BaseEnemy
{
	public var id:Int;
	public var dimens:Array<Int>;
	public var maxMP:Int;
	public var mp:Int;
	public var xp:Int = 3;
	public var color:Array<Int>;
	public var _grpObs:FlxTypedGroup<BaseObstacle>;
	public var _board:PicrossBoard;
	public var timerAttack:Float = 0;
	public var attackFreq:Int = 1;
	public var damage:Int = 10;


	public function new(?ID:Int, ?S:Array<Int>, ?C:Array<Int>, ?D:Int, ?M:Int, ?X:Int) 
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
		if (X > 0)
			xp = X;
		else
			xp = 3;
		// mp = Std.int(dimens*dimens/2);
	}

	public function update(elapsed:Float) {
		mp = maxMP - _board.curCount;
	}
	public function onSquareFilled() {
		mp--;
	}	
	public function onSquareHurt() {}
	public function removeObstacle() {}
	public function removeAllObstacles() {}
	public function setBoard(B:PicrossBoard) {
		_board = B;
	}
	public function setGrpObs(G:FlxTypedGroup<BaseObstacle>) {
		_grpObs = G;
	}
	public function spawnObstacle() {}
}

class EnemyTest extends BaseEnemy
{
	public function new()
	{
		super(6, [4, 4], [27, 10], 0, 12, 3);
	}
}

class EnemyDoor extends BaseEnemy
{
	public function new(?Dimens:Array<Int>, ?MP:Int, ?XP:Int)
	{
		// id = 7;
		if (Dimens != null)
			dimens = Dimens;
		else
			dimens = [5, 4];
		super(7, dimens, [6, 7], 5, 13, 15);
		if (MP > 0)
			mp = MP;
		if (XP > 0)
			mp = XP;
	}
}

class EnemyDummyBoss extends BaseEnemy
{
	public function new()
	{
		super(6, [14, 14], [27, 10], 15, 125, 300);
		// super(6, [14, 14], [4, 13], 15, 195);
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
		if ((maxMP - mp) % attackFreq == 0)
		{
			timerAttack = 0;
			spawnObstacle();
		}
	}

	override public function onSquareHurt() 
	{
		super.onSquareHurt();
		removeAllObstacles();
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

class EnemyMush extends BaseEnemy
{

	public function new()
	{
		super();
		id = 0;
		dimens = [4, 4];
		color = [20, 21];
		attackFreq = 5;
		maxMP = 11;
		xp = 6;

	}

	override public function update(elapsed:Float)
	{
		// timerAttack += elapsed;

		// if (timerAttack >= 5)
		// {
		// 	spawnObstacle();
		// 	timerAttack = 0;
		// }

		super.update(elapsed);
	}

	override public function onSquareFilled() 
	{
		super.onSquareFilled();
		removeObstacle();
		if ((maxMP - mp) % attackFreq == 0)
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
		color = [8, 9];
		maxMP = 14;
		xp = 9;
	}
}

class EnemySnail extends BaseEnemy
{
	public function new()
	{
		super();
		id = 2;
		dimens = [5, 5];
		color = [22, 23];
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
		if ((maxMP - mp) % attackFreq == 0)
		{
			spawnObstacle();
			timerAttack = 0;
		}
	}

	override public function spawnObstacle()
	{
		var drop = new ObsEraser(_board, this);
		_grpObs.add(drop);
	}
}

class EnemyFlower extends BaseEnemy
{
	public function new()
	{
		super(3, [6, 6], [8, 9], 5, 7);
	}
}

class EnemyTadpole extends BaseEnemy
{
	public function new()
	{
		super(4, [3, 4], [15, 16], 5, 7, 3);
	}
}

class EnemyFrog extends BaseEnemy
{
	public function new()
	{
		super(5, [5, 5], [12, 13], 5, 15, 15);
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
		if ((maxMP - mp) % attackFreq == 0)
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
class EnemyOwl extends BaseEnemy
{
	public function new()
	{
		super(4, [8, 8], [12, 9], 10, 42, 60);
		attackFreq = 20;
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
		if ((maxMP - mp) % attackFreq == 0)
		{
			spawnObstacle();
			timerAttack = 0;
		}
	}

	override public function spawnObstacle()
	{
		var drop = new ObsRevCursor(_board, this);
		_grpObs.add(drop);
	}
}








