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
	public var xp:Int = 3;
	public var color:Array<Int>;
	public var _grpObsBot:FlxTypedGroup<BaseObstacle>;
	public var _grpObsTop:FlxTypedGroup<BaseObstacle>;
	public var _board:PicrossBoard;
	public var timerAttack:Float = 0;
	public var attackFreq:Int = 1;
	public var fillcount:Int = 0;
	public var damage:Int = 0;
	public var sprite:FlxSprite;
	public var escapable:Bool = true;

	public function new(ID:Int, S:Array<Int>, C:Array<Int>, D:Int, M:Int, X:Int) 
	{
		id = ID;
		dimens = S;
		color = C;
		damage = D;
		maxMP = M;
		mp = maxMP;
		xp = X;

		if (Reg.flags["difficulty"] == 1)  // 1 = hard
		{
			damage *= 2;
			dimens[0] += 2;
			dimens[1] += 2;
			maxMP = Std.int((maxMP * dimens[0] * dimens[1]) / ((dimens[0]-2) * (dimens[1]-2)));
			mp = maxMP;
		}

		sprite = new FlxSprite(0, 0);
		sprite.loadGraphic("assets/images/enemies.png", true, 16, 16);
		var o:Int = 4;  // amount of tiles per enemy
		o *= id;
		sprite.animation.add("idle", [1 + o, 0 + o, 1 + o, 2 + o], 4, true);
		sprite.animation.add("dead", [3 + o]);
		sprite.animation.play("idle");
	}

	public function update(elapsed:Float) {
		// mp;
		return;
	}
	public function onSquareFilled() {
		fillcount++;
		timerAttack++;
		mp--;
	}	
	public function onSquareHurt() {}
	public function removeObstacle() {}
	public function removeAllObstacles() {}
	public function setBoard(B:PicrossBoard) {
		_board = B;
	}
	public function setGrpObs(GB:FlxTypedGroup<BaseObstacle>, GT:FlxTypedGroup<BaseObstacle>) 
	{
		_grpObsBot = GB;
		_grpObsTop = GT;
	}
	public function spawnObstacle() {}
}

class EnemyTest extends BaseEnemy
{
	public function new()
	{
		super(6, [4, 4], [11, 26], 0, 12, 3);
		escapable = false;
	}
}

class EnemyDoor extends BaseEnemy
{
	public function new(?Dimens:Array<Int>, ?MP:Int, ?XP:Int)
	{
		if (Dimens != null)
			dimens = Dimens;
		else
			dimens = [5, 4];
		if (MP > 0)
		{
			mp = MP;
			maxMP = MP;			
		}
		else
		{
			mp = 12;
			maxMP = 12;			
		}
		if (XP > 0)
			xp = XP;
		super(7, dimens, [7, 6], 3, mp, 15);
	}
}

class EnemyDummyBoss extends BaseEnemy
{
	public function new()
	{
		super(6, [12, 12], [11, 26], 15, 92, 300);
		attackFreq = 8;
	}
	
	override public function update(elapsed:Float)
	{
		timerAttack += elapsed;

		if (timerAttack >= attackFreq)
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
		// if ((maxMP - mp) % attackFreq == 0)
		// {
		// 	timerAttack = 0;
		// 	spawnObstacle();
		// }
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
			_grpObsTop.add(vial);
		}
		else
		{
			var vial = new ObsHintHider([_board.coords[0], _board.grpPicrossSquares.getRandom().y], obstacleHP, false);
			_grpObsTop.add(vial);
		}
	}

	override public function removeObstacle()
	{
		// var obs = _grpObsTop.getFirstExisting();
		for (obs in _grpObsTop)
		{
			if (obs != null && obs.tryRemove() == true)
				_grpObsTop.remove(obs);
		}
	}

	override public function removeAllObstacles()
	{
		for (obs in _grpObsTop)
		{
			_grpObsTop.remove(obs);
		}
	}
}

class EnemyMush extends BaseEnemy
{

	public function new()
	{
		super(0, [4, 4], [23, 20], 6, 9, 6);
		// attackFreq = 5;
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
		// if ((maxMP - mp) % attackFreq == 0)
		// {
		// 	timerAttack = 0;
		// 	spawnObstacle();
		// }
	}


	override public function spawnObstacle()
	{
		var obstacleHP:Int = 2;
		if (FlxG.random.int(0, 1) == 0)
		{
			var vial = new ObsHintHider([_board.grpPicrossSquares.getRandom(0).x, _board.coords[1]], obstacleHP, true);
			_grpObsTop.add(vial);
		}
		else
		{
			var vial = new ObsHintHider([_board.coords[0], _board.grpPicrossSquares.getRandom().y], obstacleHP, false);
			_grpObsTop.add(vial);
		}
	}

	override public function removeObstacle()
	{
		// var obs = _grpObsTop.getFirstExisting();
		for (obs in _grpObsTop)
		{
			if (obs != null && obs.tryRemove() == true)
				_grpObsTop.remove(obs);
		}
	}

	override public function removeAllObstacles()
	{
		for (obs in _grpObsTop)
		{
			_grpObsTop.remove(obs);
		}
	}
}

class EnemyBat extends BaseEnemy
{
	public function new()
	{
		super(12, [8, 8], [31, 18], 6, 11, 9);
		attackFreq = 0;
	}

	override public function update(elapsed:Float)
	{

		if (timerAttack >= attackFreq)
		{
			spawnObstacle();
			timerAttack = -1;
		}

		super.update(elapsed);
	}

	override public function onSquareFilled()
	{
		super.onSquareFilled();
	}

	override public function spawnObstacle()
	{
		var bg = new ObsBatSymbol(_board);
		_grpObsBot.add(bg);
	}
}

class EnemyBee extends BaseEnemy
{
	public function new()
	{
		super(1, [5, 5], [9, 32], 8, 12, 9);
	}
}

class EnemySnail extends BaseEnemy
{
	public function new()
	{
		super(2, [5, 5], [31, 18], 6, 11, 9);
		attackFreq = 11;
	}

	override public function update(elapsed:Float)
	{
		timerAttack += elapsed;

		if (timerAttack >= attackFreq)
		{
			spawnObstacle();
			timerAttack = 0;
		}

		super.update(elapsed);
	}

	override public function onSquareFilled()
	{
		super.onSquareFilled();
		// if ((maxMP - mp) % attackFreq == 0)
		// {
		// 	spawnObstacle();
		// 	timerAttack = 0;
		// }
	}

	override public function spawnObstacle()
	{
		var drop = new ObsEraser(_board, this);
		_grpObsTop.add(drop);
	}
}

class EnemyFlower extends BaseEnemy
{
	public function new()
	{
		super(3, [6, 6], [3, 2], 5, 18, 15);
	}
}

class EnemyKettle extends BaseEnemy
{
	public function new()
	{
		super(13, [8, 8], [33, 30], 2, 13, 3);
		attackFreq = 10;
		timerAttack = 5;
	}
	
	override public function update(elapsed:Float)
	{
		// timerAttack += elapsed;

		// if (timerAttack >= attackFreq)
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
			_grpObsTop.add(vial);
		}
		else
		{
			var vial = new ObsHintHider([_board.coords[0], _board.grpPicrossSquares.getRandom().y], obstacleHP, false);
			_grpObsTop.add(vial);
		}
	}

	override public function removeObstacle()
	{
		// var obs = _grpObsTop.getFirstExisting();
		for (obs in _grpObsTop)
		{
			if (obs != null && obs.tryRemove() == true)
				_grpObsTop.remove(obs);
		}
	}

	override public function removeAllObstacles()
	{
		for (obs in _grpObsTop)
		{
			_grpObsTop.remove(obs);
		}
	}
}

class EnemyRabbit extends BaseEnemy
{
	public function new()
	{
		super(14, [6, 5], [7, 12], 2, 13, 3);
		attackFreq = 10;
		timerAttack = 5;
	}
	
	override public function update(elapsed:Float)
	{
		timerAttack += elapsed;

		if (timerAttack >= attackFreq)
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
			_grpObsTop.add(vial);
		}
		else
		{
			var vial = new ObsHintHider([_board.coords[0], _board.grpPicrossSquares.getRandom().y], obstacleHP, false);
			_grpObsTop.add(vial);
		}
	}

	override public function removeObstacle()
	{
		// var obs = _grpObsTop.getFirstExisting();
		for (obs in _grpObsTop)
		{
			if (obs != null && obs.tryRemove() == true)
				_grpObsTop.remove(obs);
		}
	}

	override public function removeAllObstacles()
	{
		for (obs in _grpObsTop)
		{
			_grpObsTop.remove(obs);
		}
	}
}

class EnemyReindeer extends BaseEnemy
{
	public function new()
	{
		super(16, [8, 5], [27, 30], 2, 21, 3);
		attackFreq = 1000;
		timerAttack = 9000;
	}
	
	override public function update(elapsed:Float)
	{
		if (timerAttack >= attackFreq)
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
	}

	override public function onSquareHurt() 
	{
		super.onSquareHurt();
		removeAllObstacles();
	}

	override public function spawnObstacle()
	{
		var xmas = new ChristmasLights(_board);
		_grpObsTop.add(xmas);	
	}

	override public function removeObstacle()
	{
		for (obs in _grpObsTop)
		{
			if (obs != null && obs.tryRemove() == true)
				_grpObsTop.remove(obs);
		}
	}

	override public function removeAllObstacles()
	{
		for (obs in _grpObsTop)
		{
			_grpObsTop.remove(obs);
		}
	}
}

class EnemyTadpole extends BaseEnemy
{
	public function new()
	{
		super(14, [3, 4], [17, 32], 2, 7, 3);
	}
}

class EnemyFrog extends BaseEnemy
{
	public function new()
	{
		super(5, [5, 5], [13, 14], 5, 13, 15);
		attackFreq = 12;
	}

	override public function update(elapsed:Float)
	{
		timerAttack += elapsed;

		if (timerAttack >= attackFreq)
		{
			spawnObstacle();
			timerAttack = 0;
		}

		super.update(elapsed);
	}

	override public function onSquareFilled()
	{
		super.onSquareFilled();
	}

	override public function spawnObstacle()
	{
		var drop = new ObsLily(_board, this);
		_grpObsTop.add(drop);
	}
}

class EnemyFroggo extends BaseEnemy
{
	public function new()
	{
		super(9, [8, 8], [13, 14], 10, 32, 60);
		attackFreq = 11;
		escapable = false;
	
		var o:Int = 4;  // amount of tiles per enemy
		o *= id;
		sprite.animation.add("idle", [0 + o, 1 + o], 4, true);
	}

	override public function update(elapsed:Float)
	{
		timerAttack += elapsed;

		if (timerAttack >= attackFreq)
		{
			spawnObstacle();
			timerAttack = 0;
		}

		super.update(elapsed);
	}

	override public function onSquareFilled()
	{
		super.onSquareFilled();
	}

	override public function spawnObstacle()
	{
		var drop = new ObsLily(_board, this);
		_grpObsTop.add(drop);
	}
}

class EnemyFrostKing extends BaseEnemy
{
	public function new()
	{
		super(9, [8, 8], [13, 14], 10, 32, 60);
		attackFreq = 11;
		escapable = false;
	
		var o:Int = 4;  // amount of tiles per enemy
		o *= id;
		sprite.animation.add("idle", [0 + o, 1 + o], 4, true);
	}

	override public function update(elapsed:Float)
	{
		timerAttack += elapsed;

		if (timerAttack >= attackFreq)
		{
			spawnObstacle();
			timerAttack = 0;
		}

		super.update(elapsed);
	}

	override public function onSquareFilled()
	{
		super.onSquareFilled();
	}

	override public function spawnObstacle()
	{
		var drop = new ObsLily(_board, this);
		_grpObsTop.add(drop);
	}
}

class EnemyOwl extends BaseEnemy
{
	public function new()
	{
		super(8, [8, 8], [25, 24], 10, 36, 60);
		attackFreq = 20;
		escapable = false;

		var o:Int = 4;  // amount of tiles per enemy
		o *= id;
		sprite.animation.add("idle", [0 + o, 1 + o], 4, true);
	}

	override public function update(elapsed:Float)
	{
		timerAttack += elapsed;

		if (timerAttack >= attackFreq)
		{
			spawnObstacle();
			timerAttack = 0;
		}

		super.update(elapsed);
	}

	override public function onSquareFilled()
	{
		super.onSquareFilled();
	}

	override public function spawnObstacle()
	{
		var drop = new ObsRevCursor(_board, this);
		_grpObsTop.add(drop);
	}
}








