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
	public var hp:Int = 0;

	public function new(Coords:Array<Float>) 
	{
		coords = Coords;
		super(coords[0], coords[1]);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}

	public function tryRemove():Bool {
		return false;
	}
}

// Mush
class ObsHintHider extends BaseObstacle
{
	var isVert:Bool;
	var landed:Bool = false;
	var speed:Int = 2;

	public function new(Coords:Array<Float>, HP:Int, IsVert:Bool) 
	{
		isVert = IsVert;
		if (isVert)
		{
			super([Coords[0], Coords[1]-50]);
			loadGraphic(AssetPaths.vial__png, true, 10, 50);
		}
		else
		{
			super([Coords[0]-50, Coords[1]]);
			loadGraphic(AssetPaths.vialhorz__png, true, 50, 10);
		}
		animation.add("idle", [0], 1, true);
		animation.add("hurt", [1], 1, true);
		animation.play("idle");
		scrollFactor.set();	
		hp = HP;
		coords = Coords;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (landed == false)
		{
			if (isVert)
			{
				if (y < coords[1]-speed-1)  // Stupid hack to get the gfx to line up. n needs to be speed+1, er, speed-1
					y += speed;
				else
					landed = true;				
			}
			else
			{
				if (x < coords[0]-speed-1)  // Same as above
					x += speed;
				else
					landed = true;				
			}
		}
	}

	override public function tryRemove():Bool
	{
		if (landed) 
		{
			hp -= 1;
			animation.play("hurt");
		}
		if (hp <= 0)
			return true;
		else
			return false;
	}
}

// Snail
class ObsEraser extends BaseObstacle
{
	var _coords:Array<Float>;
	var _board:PicrossBoard;
	var _square:PicrossSquare;
	var _enemy:EnemyClasses.BaseEnemy;

	public function new(Board:PicrossBoard, Enemy:EnemyClasses.BaseEnemy)
	{
		_board = Board;
		_square = _board.grpPicrossSquares.getRandom();
		_coords = [_square.x, _square.y];
		_enemy = Enemy;
		super([_coords[0], _coords[1]-50]);
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
		if (y < _coords[1]-6) 
			y+=1;
		else
		{
			if (animation.name != "splat")
			{
				animation.play("splat");
				if (_square.status == PicrossSquare.ON)
					_enemy.mp++;
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

// Frog
class ObsLily extends BaseObstacle
{
	var _coords:Array<Float>;
	var _board:PicrossBoard;
	var _square:PicrossSquare;
	var _enemy:EnemyClasses.BaseEnemy;

	public function new(Board:PicrossBoard, Enemy:EnemyClasses.BaseEnemy)
	{
		_board = Board;
		_square = _board.grpPicrossSquares.getRandom();
		_coords = [_square.x, _square.y];
		_enemy = Enemy;
		super([_coords[0], _coords[1]-50]);
		loadGraphic(AssetPaths.lilypad__png, true, 20, 20);
		x -= 5;
		animation.add("fall", [0, 1], 4, true);
		animation.add("splat", [0, 1, 0, 1, 0], 3, false);
		animation.play("fall");
		scrollFactor.set();	
	}

	override public function update(elapsed:Float)
	{

		super.update(elapsed);
		if (y < _coords[1]-6) 
			y++;
		else
		{
			if (animation.name != "splat")
			{
				animation.play("splat");
				if (_square.status == PicrossSquare.ON)
					_enemy.mp++;
				_square.status = PicrossSquare.OFF;
				_square.animation.play("mark");
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

// Owl
class ObsRevCursor extends BaseObstacle
{
	var _board:PicrossBoard;
	var _square:PicrossSquare;
	var _enemy:EnemyClasses.BaseEnemy;
	var _coords:Array<Float>;

	public function new(Board:PicrossBoard, Enemy:EnemyClasses.BaseEnemy)
	{
		_board = Board;
		_square = _board.grpPicrossSquares.getRandom();
		_enemy = Enemy;

		// find the middle square
		// _square = _board.gridPicrossSquares[Std.int(_board.dimens[1]/2)][Std.int(_board.dimens[0]/2)];
		_square = _board.gridPicrossSquares[0][0];
		// _coords = [_square.x, _square.y];
		_coords = [_square.x+Std.int(_board.dimens[1]/2)*10, _square.y+Std.int(_board.dimens[0]/2)*10];

		super([_coords[0]-15, _coords[1]-10]);
		loadGraphic(AssetPaths.owl_eyes__png, true, 40, 20);
		x -= 5;
		animation.add("opening", [0, 0, 1, 2, 3, 3], 4, false);
		scrollFactor.set();	
	}

	override public function update(elapsed:Float)
	{

		super.update(elapsed);
		if (animation.name != "opening")
		{
			animation.play("opening");
		}
		if (animation.finished == true && this.visible)
		{
			var temparr = [ PicrossBoard.REVERSEDVERT, 
							PicrossBoard.REVERSEDHORZ, 
							PicrossBoard.REVERSEDBOTH,
							PicrossBoard.NORMAL,
							PicrossBoard.NORMAL];	

			var tempState = temparr[FlxG.random.int(0, temparr.length-1)];
			while (tempState == _board.state)
				tempState = temparr[FlxG.random.int(0, temparr.length-1)];

			_board.state = tempState;
			// TODO???? Dialogbox goes here if first time: you just got confused hahaha

			this.visible = false;
			this.alive = false;
			_enemy.removeObstacle();
		}
	}
}


// some kind of obstacle that splats down on the board, and has to be "wiped" off by the cursor; also vanishes after x seconds








