package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;

/**
 * ...
 * @author Bownly
 */

class Player extends FlxSprite
{
	private static inline var TILE_SIZE:Int = 16;
	private static inline var MOVEMENT_SPEED:Int = 2;

	public static var lvl:Int = 1;
	public static var mp:Int = 60;
	public static var maxmp:Int = 60;
	public static var xp:Int = 0;
	public static var MAXXP:Int = 100;	

	public var isMoving:Bool;	
	public var canMove:Bool = true;
	
	var _state:TownState;

	public function new(X:Float, Y:Float, Facing:Int, State:TownState)
	{
		super(X, Y);
		
		_state = State;
		facing = Facing;
		
		loadGraphic(AssetPaths.mctest__png, true, 16, 16);
		animation.add("up", [0, 1], 4, true);
		animation.add("dn", [2, 3], 4, true);
		animation.add("lf", [4, 5], 4, true);
		animation.add("rt", [6, 7], 4, true);
		
		setFacing(facing);
	}
	
	override public function update(elapsed:Float):Void
	{

		if (FlxG.keys.anyJustPressed(["Z"]))
		{
			Reg.STATE = 0;
			trace("Reg.STATE", Reg.STATE);
		}
		if (FlxG.keys.anyJustPressed(["X"]))
		{
			Reg.STATE = 1;
			trace("Reg.STATE", Reg.STATE);
		}

		if (Reg.STATE == Reg.STATE_NORMAL)
		{
			super.update(elapsed);  
		
			// Move the player to the next block
			if (isMoving)
			{
				switch (facing)
				{
					case FlxObject.UP:
						y -= MOVEMENT_SPEED;
					case FlxObject.DOWN:
						y += MOVEMENT_SPEED;
					case FlxObject.LEFT:
						x -= MOVEMENT_SPEED;
					case FlxObject.RIGHT:
						x += MOVEMENT_SPEED;
				}
			}
			
			
			// Check if the player has now reached the next block
			if ((x % TILE_SIZE == 0) && (y % TILE_SIZE == 0))
			{
				isMoving = false;
			}
		
			
			// Check for WASD or arrow key presses and move accordingly
			if (!isMoving)
			{
				if (FlxG.keys.anyPressed(["UP", "W"]))
				{
					facing = FlxObject.UP;
					canMove = collisionCheck(facing);
					if (canMove)
						moveTo(FlxObject.UP);
					animation.play("up");
				}
				else if (FlxG.keys.anyPressed(["DOWN", "S"]))
				{
					facing = FlxObject.DOWN;
					canMove = collisionCheck(facing);
					if (canMove)
						moveTo(FlxObject.DOWN);
					animation.play("dn");
				}
				else if (FlxG.keys.anyPressed(["LEFT", "A"]))
				{
					facing = FlxObject.LEFT;
					canMove = collisionCheck(facing);
					if (canMove)
						moveTo(FlxObject.LEFT);
					animation.play("lf");
				}
				else if (FlxG.keys.anyPressed(["RIGHT", "D"]))
				{
					facing = FlxObject.RIGHT;
					canMove = collisionCheck(facing);
					if (canMove)
						moveTo(FlxObject.RIGHT);
					animation.play("rt");
				}
				
				// interaction
				if (FlxG.keys.anyJustPressed(["J", "SPACE"]))
				{
					interactionCheck(facing);
				}

				if (FlxG.keys.anyJustPressed(["P"]))
				{
					FlxG.switchState(new MenuState());
				}
				

			}
		}
	}

	public static function AddXP(Val:Int):Void
	{
		xp += Val;
		if (xp > MAXXP)
			xp = MAXXP;
		
		if (xp >= 100)
		{
			lvl = 5;
		}
		else if (xp >= 55)
		{
			lvl = 4;
		}
		else if (xp >= 25)
		{
			lvl = 3;
		}
		else if (xp >= 10)
		{
			lvl = 2;
		}
		mp = 30 + (lvl) * 30;
	}

	public static function setStats(LVL:Int, MP:Int, XP:Int):Void
	{
		lvl = LVL;
		mp = MP;
		xp = XP;
	}

	public static function resetStats():Void
	{

		setStats(1, 30, 0);
	}
	
	public function setFacing(Dir:Int):Void
	{
		switch (Dir)
		{
			case FlxObject.UP:
			{
				facing = FlxObject.UP;
				animation.play("up");
			}
			case FlxObject.DOWN:
			{
				facing = FlxObject.DOWN;
				animation.play("dn");
			}
			case FlxObject.LEFT:
			{
				facing = FlxObject.LEFT;
				animation.play("lf");
			}
			case FlxObject.RIGHT:
			{
				facing = FlxObject.RIGHT;
				animation.play("rt");
			}
		}
	}
	
	public function moveTo(Direction:Int):Void
	{
		// Only change direction if not already moving
		if (!isMoving)
		{
			facing = Direction;
			isMoving = true;
		}
	}
	
	public function collisionCheck(Direction:Int):Bool
	{
		var xx:Int = 0;
		var yy:Int = 0;
		
		switch (facing)
		{
			case FlxObject.UP:
				yy = -16;
			case FlxObject.DOWN:
				yy = 16;
			case FlxObject.LEFT:
				xx = -16;
			case FlxObject.RIGHT:
				xx = 16;
		}
		var map = _state.tileMap;
		if (map.getTile(Math.floor((x + xx) / TILE_SIZE ), Math.floor((y + yy) / TILE_SIZE )) > 9)
			return false;

		
		for (npc in _state.grpNPCs)
		{
			if (npc.visible == true && npc.y == y + yy && npc.x == x + xx)
				return false;				
		}

		if (!Reg.postDialogBattleFlag)
			Reg.encounterCounter -= _state.encounterDecrementer;

		return true;
	}
	
	public function interactionCheck(Direction:Int):Void
	{
		var xx:Int = 0;
		var yy:Int = 0;
		
		
		switch (facing)
		{
			case FlxObject.UP:
				yy = -16;
			case FlxObject.DOWN:
				yy = 16;
			case FlxObject.LEFT:
				xx = -16;
			case FlxObject.RIGHT:
				xx = 16;
		}
		
		for (item in _state.grpNPCs)
		{
			
			if (item.y == y + yy && item.x == x + xx)
			{
				item.triggered(facing);
				return;
			}
		}
		return;
	}
	
}