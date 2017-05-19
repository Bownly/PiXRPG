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

class Player extends Entity
{
	private static inline var TILE_SIZE:Int = 16;
	private static inline var MOVEMENT_SPEED:Float = 2;

	public static var lvl:Int = 1;
	public static var mp:Int = 60;
	public static var maxmp:Int = 60;
	public static var xp:Int = 0;
	public static var gp:Int = 0;
	public static var MAXXP:Int = 100;	

	public var isMoving:Bool;	
	public var canMove:Bool = true;

	var hasHood:Int = 0;
	
	// var _state:TownState;

	public function new(X:Float, Y:Float, Facing:Int, State:TownState)
	{
		super(X, Y, Facing, State);
		
		hasHood = Reg.flags["p_hood"];

		_state = State;
		facing = Facing;
		
		loadGraphic(AssetPaths.mctest__png, true, 16, 16);
		animation.add("up_0", [10, 11], 3, true);
		animation.add("dn_0", [12, 13], 3, true);
		animation.add("lf_0", [14, 15], 3, true);
		animation.add("rt_0", [16, 17], 3, true);
		animation.add("up_1", [0, 1], 3, true);
		animation.add("dn_1", [2, 3], 3, true);
		animation.add("lf_1", [4, 5], 3, true);
		animation.add("rt_1", [6, 7], 3, true);
		
		setFacing(facing);
	}
	
	override public function update(elapsed:Float):Void
	{

		if (FlxG.keys.anyJustPressed(["Z"]))
			Reg.STATE = 0;
		if (FlxG.keys.anyJustPressed(["X"]))
			Reg.STATE = 1;

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
			if (((Math.ceil(x) % TILE_SIZE == 0) || (Math.floor(x) % TILE_SIZE == 0)) &&
				((Math.ceil(y) % TILE_SIZE == 0) || (Math.floor(y) % TILE_SIZE == 0)))
			{
				isMoving = false;
				x = Math.round(x);
				y = Math.round(y);
			}
		
			// Check for WASD or arrow key presses and move accordingly
			if (!isMoving)
			{
				if (FlxG.keys.anyPressed(Reg.keys["up"]))
				{
					facing = FlxObject.UP;
					canMove = collisionCheck(facing);
					if (canMove)
						moveTo(FlxObject.UP);
					animation.play("up_" + hasHood);
				}
				else if (FlxG.keys.anyPressed(Reg.keys["down"]))
				{
					facing = FlxObject.DOWN;
					canMove = collisionCheck(facing);
					if (canMove)
						moveTo(FlxObject.DOWN);
					animation.play("dn_" + hasHood);
				}
				else if (FlxG.keys.anyPressed(Reg.keys["left"]))
				{
					facing = FlxObject.LEFT;
					canMove = collisionCheck(facing);
					if (canMove)
						moveTo(FlxObject.LEFT);
					animation.play("lf_" + hasHood);
				}
				else if (FlxG.keys.anyPressed(Reg.keys["right"]))
				{
					facing = FlxObject.RIGHT;
					canMove = collisionCheck(facing);
					if (canMove)
						moveTo(FlxObject.RIGHT);
					animation.play("rt_" + hasHood);
				}
				
				// interaction
				if (FlxG.keys.anyJustPressed(Reg.keys["confirm"]))
					interactionCheck(facing);

				// todo: debug stuff, remove before shipping
				if (FlxG.keys.anyJustPressed(["P"]))
				{
					FlxG.switchState(new MenuState());
				}
				if (FlxG.keys.anyJustPressed(["H"]))
				{
					if (Reg.flags["p_hood"] == 0)
						Reg.flags["p_hood"] = 1;
					else
						Reg.flags["p_hood"] = 0;
					hasHood = Reg.flags["p_hood"];
				}
				if (FlxG.keys.anyJustPressed(["Q"]))
				{
					Reg.flags["owl_clan_attack"] += 1;
					trace("flag incremented: " + Reg.flags["owl_clan_attack"]);
				}
				if (FlxG.keys.anyJustPressed(["E"]))
				{
					Reg.flags["frogponddun"] = 1;
					trace("dun done ");
				}
				if (FlxG.keys.anyJustPressed(["R"]))
				{
					if (Reg.flags["monshou_fire"] == 1)
						Reg.flags["monshou_gondola"] = 1;
					if (Reg.flags["monshou_ice"] == 1)
						Reg.flags["monshou_fire"] = 1;
					if (Reg.flags["monshou_frog"] == 1)
						Reg.flags["monshou_ice"] = 1;
					Reg.flags["monshou_frog"] = 1;
					trace("monshou++ ");
				}
				


			}
		}
		else if (Reg.STATE == Reg.STATE_CUTSCENE)
			super.update(elapsed);  

	}

	public static function addXP(Val:Int):Void
	{
		xp += Val;
		if (xp > MAXXP)
			xp = MAXXP;
		
		if (xp >= 100)
			lvl = 5;
		else if (xp >= 55)
			lvl = 4;
		else if (xp >= 25)
			lvl = 3;
		else if (xp >= 10)
			lvl = 2;
		mp = 30 + (lvl) * 30;
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

		var map = _state.level;
		if (map.collidableTileMap.getTile(Math.floor((x + xx) / TILE_SIZE), Math.floor((y + yy) / TILE_SIZE)) > 0)
			return false;

		
		for (npc in _state.grpNPCs)
		{
			if (npc.visible == true && npc.y == y + yy && npc.x == x + xx)
				return false;				
		}
		Reg.encounterCounter -= _state.encounterDecrementer;
		return true;
	}

	public static function healMP(Val:Int):Void
	{
		mp += Val;
		if (mp > maxmp)
			mp = maxmp;
	}

	override public function setFacing(Dir:Int):Void
	{
		switch (Dir)
		{
			case FlxObject.UP:
			{
				facing = FlxObject.UP;
				animation.play("up_" + hasHood);
			}
			case FlxObject.DOWN:
			{
				facing = FlxObject.DOWN;
				animation.play("dn_" + hasHood);
			}
			case FlxObject.LEFT:
			{
				facing = FlxObject.LEFT;
				animation.play("lf_" + hasHood);
			}
			case FlxObject.RIGHT:
			{
				facing = FlxObject.RIGHT;
				animation.play("rt_" + hasHood);
			}
		}
	}
	
	public static function setStats(LVL:Int, MP:Int, XP:Int):Void
	{
		lvl = LVL;
		mp = MP;
		xp = XP;
	}

	public static function resetStats():Void
		setStats(1, 30, 0);
	

	public function moveTo(Direction:Int):Void
	{
		// Only change direction if not already moving
		if (!isMoving)
		{
			facing = Direction;
			isMoving = true;
		}
	}
	public function interactionCheck(Direction:Int):Void
	{
		var xx:Int = 0;
		var yy:Int = 0;
		
		var tempFace:Int = 0;
		switch (facing)
		{
			case FlxObject.UP:
			{
				yy = -16;
				tempFace = FlxObject.DOWN;
			}
			case FlxObject.DOWN:
			{
				yy = 16;
				tempFace = FlxObject.UP;
			}	
			case FlxObject.LEFT:
			{
				xx = -16;
				tempFace = FlxObject.RIGHT;
			}
			case FlxObject.RIGHT:
			{
				xx = 16;
				tempFace = FlxObject.LEFT;
			}
		}
		
		for (item in _state.grpNPCs)
		{
			if (item.y == y + yy && item.x == x + xx)
			{
				item.triggered(tempFace);
				return;
			}
		}
		return;
	}
	
}