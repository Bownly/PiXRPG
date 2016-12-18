package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

import DialogClasses;
import EnemyClasses;
import EventClasses;
import MenuClasses;

/**
 * ...
 * @author Bownly
 */
class BattleSubState extends FlxSubState
{

	var _sprBack:FlxSprite;
	var window:Window;
	var xanchor:Int;
	var yanchor:Int;
	var w:Float = 200;
	var h:Float = 200;
    var _txtHP:FlxText;
    var _txtMessage:FlxText;
    var _txtVS:FlxText;
	var _sprPlayer:FlxSprite;
	var _sprEnemy:FlxSprite;
	var _sprPen:FlxSprite;
	var _sprPen1:FlxSprite;
	var _sprPen2:FlxSprite;
	var _sprPen3:FlxSprite;
	var _sprPen4:FlxSprite;
	var _sprPen6:FlxSprite;
	var _sprPen7:FlxSprite;
	var _sprPen8:FlxSprite;
	var _sprPen9:FlxSprite;
	
	var _grpTexts:FlxTypedGroup<FlxText>;
	var _grpSprites:FlxTypedGroup<FlxSprite>;
	var _grpObstacles:FlxTypedGroup<ObstacleClasses.BaseObstacle>;
	var _grpPicrossSquaresBoards:FlxTypedGroup<PicrossBoard>;
	var _arrPicrossBoards:Array<PicrossBoard>;
	var _grpCursor:FlxTypedGroup<FlxSprite>;

	public var eventManager:EventClasses.EventManager;

	// experimental vars for mid battle menu
	var _menu:BaseMenu;	

	var _winFlag:String;
	var _winFlagVal:Int;
	
	var _enemyNum:Int = 0;
	var _enemyID:Int;
	var _enemyIDs:Array<Int>;
	var _arrEnemies:Array<BaseEnemy>;
	var _dimens:Int;
	var _winCount:Int = 0;
	var _curCount:Int = 0;
	
	var _msgTimer:Float = 0;
	var _msgDuration:Float = 1.5;
	
	var _mcHurtTimer:Float = 0;
	var _mcHurtDuration:Float = 1.5;
	
	var battleState:Int = 0;
	var STATE_BATTLE:Int = 0;
	var STATE_VICTORY:Int = 1;
	var STATE_ESCAPE:Int = 2;
	var STATE_DEFEAT:Int = 3;
	var STATE_MENU:Int = 4;
	var STATE_CLOSE:Int = 5;
	
	var songBattle:FlxSound = FlxG.sound.load("assets/music/battle.wav");
	var songFanfare:FlxSound = FlxG.sound.load("assets/music/victoly_fanfare.wav");
	var songLost:FlxSound = FlxG.sound.load("assets/music/lost_the_battle.wav");
	
	public function new(Enemies:Array<BaseEnemy>, ?WinFlag:String, ?WinFlagVal:Int) 
	{
		super();
	
		_arrEnemies = Enemies;
		_winFlag = WinFlag;
		_winFlagVal = WinFlagVal;
	
		_grpTexts = new FlxTypedGroup<FlxText>();
		_grpSprites = new FlxTypedGroup<FlxSprite>();
		_grpPicrossSquaresBoards = new FlxTypedGroup<PicrossBoard>();
		_grpCursor = new FlxTypedGroup<FlxSprite>();
		_grpObstacles = new FlxTypedGroup<ObstacleClasses.BaseObstacle>();

		// xanchor = Std.int(FlxG.width / 2 - w/2);
		// yanchor = Std.int(FlxG.height / 2 - h/2);
		xanchor = Std.int((FlxG.width-FlxG.height)/2);
		yanchor = Std.int(0);

		// window = new Window([xanchor, yanchor], [h, w]);
		window = new Window([xanchor, yanchor], [FlxG.height, FlxG.height]);
		xanchor += window.pad*2;
		yanchor += window.pad*2;
		add(window);
		
		_txtHP = new FlxText(xanchor, yanchor, 64, "MP: " + Player.mp, 8);
		
		_sprPlayer = new FlxSprite(xanchor, _txtHP.y + _txtHP.height);
		_sprPlayer.loadGraphic("assets/images/mctest.png", true, 16, 16);
		_sprPlayer.animation.add("idle_true", [2, 3], 4, true);
		_sprPlayer.animation.add("dead_true", [8, 9], 4, true);
		_sprPlayer.animation.add("idle_false", [12, 13], 4, true);
		_sprPlayer.animation.add("dead_false", [18, 19], 4, true);
		_sprPlayer.animation.play("idle_" + Reg.playerHasHood);
		
		_txtVS = new FlxText(_sprPlayer.x + _sprPlayer.width, _sprPlayer.y + 8, 16, "vs", 8);
		
		_sprPen = new FlxSprite(xanchor + 48, yanchor + 48);
		_sprPen.loadGraphic("assets/images/picross_hair.png", true, 9, 9);
		_sprPen.animation.add("idle", [0, 1], 4, true);
		_sprPen.animation.play("idle");

		if (PenClasses.PenManager.equipped.arrCursors[0] == 1)
		{
			_sprPen1 = new FlxSprite(_sprPen.x + 10, _sprPen.y);
			_grpCursor.add(_sprPen1);
		}
		if (PenClasses.PenManager.equipped.arrCursors[1] == 1)
		{
			_sprPen2 = new FlxSprite(_sprPen.x + 10, _sprPen.y);
			_grpCursor.add(_sprPen2);
		}
		if (PenClasses.PenManager.equipped.arrCursors[2] == 1)
		{
			_sprPen3 = new FlxSprite(_sprPen.x + 10, _sprPen.y);
			_grpCursor.add(_sprPen3);
		}
		if (PenClasses.PenManager.equipped.arrCursors[3] == 1)
		{
			_sprPen4 = new FlxSprite(_sprPen.x + 10, _sprPen.y);
			_grpCursor.add(_sprPen4);
		}
		if (PenClasses.PenManager.equipped.arrCursors[5] == 1)
		{
			_sprPen6 = new FlxSprite(_sprPen.x + 10, _sprPen.y);
			_grpCursor.add(_sprPen6);
		}
		if (PenClasses.PenManager.equipped.arrCursors[6] == 1)
		{
			_sprPen7 = new FlxSprite(_sprPen.x - 10, _sprPen.y + 10);
			_grpCursor.add(_sprPen7);
		}
		if (PenClasses.PenManager.equipped.arrCursors[7] == 1)
		{
			_sprPen8 = new FlxSprite(_sprPen.x, _sprPen.y + 10);
			_grpCursor.add(_sprPen8);
		}
		if (PenClasses.PenManager.equipped.arrCursors[8] == 1)
		{
			_sprPen9 = new FlxSprite(_sprPen.x + 10, _sprPen.y + 10);
			_grpCursor.add(_sprPen9);
		}

		for (pen in _grpCursor)
		{
			pen.loadGraphic("assets/images/picross_hair.png", true, 9, 9);
			pen.animation.add("idle", [0], 4, true);
			pen.animation.play("idle");
		}
		_grpCursor.add(_sprPen);  // added afterwards to avoid the previous statement

		// 14 is the height in pixels of size 8 FlxTexts		
		_txtMessage = new FlxText(xanchor, window.getHeight() - 14, w, "", 8);
		_txtMessage.alignment = "center";
	
		_arrPicrossBoards = new Array<PicrossBoard>();

		// 15 is max board dimens, 10 is size of picross squares, 14 is height of text
		// xanchor = Std.int(window.getHeight()) - 15*10 - 14;
		// yanchor = xanchor;
		xanchor += 40 - 14;
		yanchor += 40 - 14;

		for (e in _arrEnemies)
		{
			var picross = new PicrossBoard(e.dimens, e.color, [xanchor, yanchor]);
	   		_arrPicrossBoards.push(picross);
	   		e.board = picross;
	   		e.grpObs = _grpObstacles;
		}

   		for(pc in _arrPicrossBoards)
	   		_grpPicrossSquaresBoards.add(pc);
		setUpBoard();


		_grpSprites.add(_sprEnemy);	
		_grpSprites.add(_sprPlayer);	

		_grpTexts.add(_txtHP);
		_grpTexts.add(_txtVS);
		_grpTexts.add(_txtMessage);
		
		add(_grpSprites);
		add(_grpTexts);
		add(_grpPicrossSquaresBoards);
		add(_grpObstacles);
		add(_grpCursor);  
	
		// sets all of the elements to stay centered to the current camera location
		for(text in _grpTexts) 
			text.scrollFactor.set();
		for(spr in _grpSprites) 
			spr.scrollFactor.set();
		for(cursor in _grpCursor) 
			cursor.scrollFactor.set();		


		_arrPicrossBoards[_enemyNum].colRowBold(_sprPen.x, _sprPen.y);

		eventManager = new EventClasses.EventManager(this);
		if (Reg.flags["tutorial_battle"] == 0)
		{
			eventManager.addEvents([new EventFlag("tutorial_battle", 1),
									new EventDialog(Strings.stringArray[4], this)]);
		}

	}
	
	
	public override function update(elapsed:Float)
	{
		eventManager.update();

		// timer buisness
		if (_txtMessage.text != "")
			_msgTimer -= FlxG.elapsed;
		if (_msgTimer <= 0)
			_txtMessage.text = "";

		_txtHP.text = "MP: " + Math.floor(Player.mp);

		// this block is basically resolveAnimations()
		// TODO: make it resolveAnimations() if you add a 3rd animation to resolve
		if (battleState == STATE_BATTLE)
		{
			if (_mcHurtTimer > 0)
				{
					_mcHurtTimer -= FlxG.elapsed;
					_sprPlayer.animation.play("dead_" + Reg.playerHasHood);
				}
			else
				_sprPlayer.animation.play("idle_" + Reg.playerHasHood);
			
				if (!Reg.isMuted)
					songBattle.play();
				else 
					songBattle.pause();
		}

		if (!Reg.isMuted)
		{
			if (battleState == STATE_VICTORY)
			{
				songBattle.pause();
				songFanfare.play();
			}
			else if (battleState == STATE_DEFEAT)
			{
				songBattle.pause();
				songLost.play();			
			}
		}
		else
		{
			songFanfare.pause();
			songLost.pause();
		}
		
		// cursor movement and other control stuff
		if (battleState == STATE_BATTLE)
		{
			_arrEnemies[_enemyNum].update(elapsed);
			if (FlxG.keys.anyJustPressed(["UP", "W"]))
			{
				if (_sprPen.y <= yanchor + 48)
					_sprPen.y = yanchor + 48 + (_arrPicrossBoards[_enemyNum].rowArray.length - 1) * 10  // look, ma, no semicolon! 
				else
					_sprPen.y -= 10;
				_arrPicrossBoards[_enemyNum].colRowBold(_sprPen.x, _sprPen.y);
			}
			if (FlxG.keys.anyJustPressed(["DOWN", "S"]))
			{
				if (_sprPen.y >= yanchor + 48 + (_arrPicrossBoards[_enemyNum].rowArray.length - 1) * 10)
					_sprPen.y = yanchor + 48;
				else
					_sprPen.y += 10;
				_arrPicrossBoards[_enemyNum].colRowBold(_sprPen.x, _sprPen.y);
			}		
			if (FlxG.keys.anyJustPressed(["LEFT", "A"]))
			{
				if (_sprPen.x <= xanchor + 48)
					_sprPen.x = xanchor + 48 + (_arrPicrossBoards[_enemyNum].rowArray.length - 1) * 10;
				else
					_sprPen.x -= 10;
				_arrPicrossBoards[_enemyNum].colRowBold(_sprPen.x, _sprPen.y);
			}
			if (FlxG.keys.anyJustPressed(["RIGHT", "D"]))
			{
				if (_sprPen.x >= xanchor + 48 + (_arrPicrossBoards[_enemyNum].rowArray.length - 1) * 10)
					_sprPen.x = xanchor + 48;
				else
					_sprPen.x += 10;
				_arrPicrossBoards[_enemyNum].colRowBold(_sprPen.x, _sprPen.y);
			}

			if (FlxG.keys.anyJustPressed(["L"]))
				_arrEnemies[_enemyNum].spawnObstacle();
			if (FlxG.keys.anyJustPressed(["O"]))
				_arrEnemies[_enemyNum].removeObstacle();
			if (FlxG.keys.anyJustPressed(["P"]))
				camera.shake(0.005, 0.2);

			if (_sprPen1 != null) {
				_sprPen1.x = _sprPen.x - 10;
				_sprPen1.y = _sprPen.y - 10;				
			}
			if (_sprPen2 != null) {
				_sprPen2.x = _sprPen.x;
				_sprPen2.y = _sprPen.y - 10;				
			}
			if (_sprPen3 != null) {
				_sprPen3.x = _sprPen.x + 10;
				_sprPen3.y = _sprPen.y - 10;				
			}
			if (_sprPen4 != null) {
				_sprPen4.x = _sprPen.x - 10;
				_sprPen4.y = _sprPen.y;				
			}		
			if (_sprPen6 != null) {
				_sprPen6.x = _sprPen.x + 10;
				_sprPen6.y = _sprPen.y;				
			}
			if (_sprPen7 != null) {
				_sprPen7.x = _sprPen.x - 10;
				_sprPen7.y = _sprPen.y + 10;				
			}
			if (_sprPen8 != null) {
				_sprPen8.x = _sprPen.x;
				_sprPen8.y = _sprPen.y + 10;				
			}
			if (_sprPen9 != null) {
				_sprPen9.x = _sprPen.x + 10;
				_sprPen9.y = _sprPen.y + 10;				
			}

			// mark a square as good
			if (FlxG.keys.anyJustPressed(["J", "ENTER", "SPACE"]))
			{
				if (markSquare(_sprPen, PicrossSquare.ON) == 1)
				{
					_arrEnemies[_enemyNum].onSquareFilled();
					for (cursor in _grpCursor)
					{
						if (cursor != _sprPen)
							markSquare(cursor, PicrossSquare.SOLVE);
					}
				}
			}
			
			// mark a square as marked
			if (FlxG.keys.anyJustPressed(["K", "BACKSLASH"]))
				markSquare(_sprPen, PicrossSquare.MARK);
		}
		
		else if (battleState == STATE_MENU)
		{
			if (_menu.isAlive == false)
			{
				battleState = STATE_BATTLE;
				setUpBoard();
				remove(_menu);
			}
		}

		// if you die
		if (Player.mp <= 0)
		{
			Player.mp = 0;
			if (battleState != STATE_DEFEAT)
			{
				_sprPlayer.animation.play("dead_" + Reg.playerHasHood);
				_txtMessage.text = "You got stumped on, kid.";
				_msgTimer = _msgDuration;
				battleState = STATE_DEFEAT;
			}
			else if (battleState == STATE_DEFEAT && _txtMessage.text == "")
				this.close();
		}
		
		// if you win
		if (winCheck() == true)
		{
			_grpObstacles.clear();

			if (battleState != STATE_VICTORY)
			{
				_sprEnemy.animation.play("dead");
				_sprPlayer.animation.play("idle_" + Reg.playerHasHood);
				_txtMessage.text = "YOU DEFEATED";
				_msgTimer = _msgDuration;
				battleState = STATE_VICTORY;
			}
			else if (battleState == STATE_VICTORY && _txtMessage.text == "")
			{
				// Reg.AddXP(2 + 3 * _enemyID);

				if (_enemyNum == _arrPicrossBoards.length-1)
				{
					if (_winFlag != null && Reg.flags[_winFlag] != _winFlagVal)
						eventManager.addEvents([new EventFlag(_winFlag, _winFlagVal)]);
					if (eventManager.getLength() <= 0)
						this.close();
				}
				else 
				{
					_arrPicrossBoards[_enemyNum].flipActive();
					_arrEnemies[_enemyNum].removeAllObstacles();
					_grpObstacles.clear();
					_enemyNum += 1;
					setUpMenu();
					battleState = STATE_MENU;
				}
			}
		}
		
		// if you run
		if (battleState == STATE_BATTLE)
		{
			if (FlxG.keys.anyPressed(["ESCAPE"]))
			{
				if (battleState != STATE_ESCAPE)
				{
					_txtMessage.text = "Escaping...";
					_msgTimer = _msgDuration;
					battleState = STATE_ESCAPE;
				}
			}
		}
		if (battleState == STATE_ESCAPE && _txtMessage.text == "")
		{
			//Reg.AddXP(3 + 2 * _enemyID);
			this.close();
		}
		
		if (FlxG.keys.anyJustPressed(["M"]))
			Reg.muteToggle();
		
		super.update(elapsed);
	}
	
	override public function close():Void
	{
		Reg.resetEncounterCounter();
		songBattle.stop();
		songFanfare.stop();
		songLost.stop();
		super.close();
	}
	
	private function markSquare(cursor:FlxSprite, guess:Int):Int
	{
		for (cell in _arrPicrossBoards[_enemyNum].grpPicrossSquares)
		{
			if (cursor.x == cell.x && cursor.y == cell.y)
			{
				var result:Int = cell.turnOnOrOff(guess);
				switch (result)
				{
					case PicrossSquare.CORRECT:
					{
						_arrPicrossBoards[_enemyNum].curCount++;
						_arrPicrossBoards[_enemyNum].checkRowCorrect(cell.rowID);
						_arrPicrossBoards[_enemyNum].checkColCorrect(cell.colID);
						return 1;
					}
					case PicrossSquare.GOODHURT:
					{
						_arrPicrossBoards[_enemyNum].curCount++;
						takeDamage();
						_arrPicrossBoards[_enemyNum].checkRowCorrect(cell.rowID);
						_arrPicrossBoards[_enemyNum].checkColCorrect(cell.colID);
						camera.shake(0.005, 0.2);
						return 1;
					}
					case PicrossSquare.HURT:
					{
						camera.shake(0.005, 0.2);
						takeDamage();
					}
					return 0;
				}
				break;
			}
		}
		return 0;
	}

	private function setUpBoard():Void
	{
		// _enemyID = _enemyIDs[_enemyNum];
		_enemyID = _arrEnemies[_enemyNum].id;

		_sprPen.x = xanchor + 48;
		_sprPen.y = yanchor + 48;

		for (e in _arrEnemies)
			e.grpObs = _grpObstacles;
		if (_sprEnemy != null)
		{
			_sprEnemy.loadGraphic("assets/images/enemies.png", true, 16, 16);
			var o:Int = 4;  // amount of tiles per enemy
			o *= _enemyID;
			_sprEnemy.animation.add("idle", [1 + o, 0 + o, 1 + o, 2 + o], 4, true);
			_sprEnemy.animation.add("dead", [3 + o]);
			_sprEnemy.animation.play("idle");
		}
		else
		{
			_sprEnemy = new FlxSprite(_sprPlayer.x + _sprPlayer.width * 2, _sprPlayer.y);
			_sprEnemy.loadGraphic("assets/images/enemies.png", true, 16, 16);
			var o:Int = 4;  // amount of tiles per enemy
			o *= _enemyID;
			_sprEnemy.animation.add("idle", [1 + o, 0 + o, 1 + o, 2 + o], 4, true);
			_sprEnemy.animation.add("dead", [3 + o]);
			_sprEnemy.animation.play("idle");
		}

		_arrPicrossBoards[_enemyNum].flipActive();

	}

	private function setUpMenu():Void
	{
		var square:FlxSprite = _arrPicrossBoards[_enemyNum].grpPicrossSquares.getFirstAlive();
		var items:Array<BaseMenuItem> = new Array<BaseMenuItem>();

		_menu = new MenuInventory([xanchor-window.pad*2, square.y-window.pad*2], 
							[w, yanchor + h - square.y], 
							2, "Next Battle", [4, -12]);
		_menu.isAlive = true;
		add(_menu);
		_menu.open();
	}

	private function takeDamage():Void
	{
		Player.mp -= 10 * (_enemyID + 1);
		_txtMessage.text = " ";
		_txtMessage.text = "Suffered " + 10 * (_enemyID + 1) + " damages.";
		_msgTimer = _msgDuration;
		_mcHurtTimer = _mcHurtDuration;
	}

	private function winCheck():Bool
	{
		for (row in 0..._arrPicrossBoards[_enemyNum].dimens)
		{
			if (_arrPicrossBoards[_enemyNum].checkRowCorrect(row) == false)
			{
				return false;
			}
		}
		return true;
	}

}