package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;
import flixel.math.FlxPoint;

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
	var _state:TownState;

	var _sprBack:FlxSprite;
	var window:Window;
	var xanchor:Int;
	var yanchor:Int;
	var w:Float = 200;
	var h:Float = 200;
	var _txtMP:FlxText;
	var _txtEnemyMP:FlxText;
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
	var _curBoard:PicrossBoard;
	var _lastMarkedSquare:PicrossSquare;
	var _grpCursor:FlxTypedGroup<FlxSprite>;
	var _grpMenus:FlxTypedGroup<BaseMenu>;

	public var eventManager:EventClasses.EventManager;

	var _menu:BaseMenu;	

	var _winFlag:String;
	var _winFlagVal:Int;
	
	var _enemyNum:Int = 0;
	var _enemyID:Int;
	var _enemyIDs:Array<Int>;
	var _arrEnemies:Array<BaseEnemy>;
	var _dimens:Array<Int>;
	var _winCount:Int = 0;
	
	var _msgTimer:Float = 0;
	var _msgDuration:Float = 1.5;
	
	var _mcHurtTimer:Float = 0;
	var _mcHurtDuration:Float = 1.5;

	var _cursorTimerVert:Float = 0;
	var _cursorTimerHorz:Float = 0;
	var _cursorDuration:Float = 0.2;   // static friction
	var _cursorInterval:Float = 0.1;   // normal friction
	var _cursorIsMovingVert:Bool = false;
	var _cursorIsMovingHorz:Bool = false;

	var _inputsDelayTimer:Float = 0;
	var _inputsDelayDuration:Float = 0.1;
	
	var penState:Int = 0;
	static var PEN_IDLE:Int = -1;
	static var PEN_OFF:Int = 0;
	static var PEN_ON:Int = 1;
	static var PEN_MARK:Int = 2;
	static var PEN_SOLVE:Int = 3;

	var battleState:Int = 0;
	static var STATE_BATTLE:Int = 0;
	static var STATE_VICTORY:Int = 1;
	static var STATE_ESCAPE:Int = 2;
	static var STATE_DEFEAT:Int = 3;
	static var STATE_MENU:Int = 4;
	static var STATE_CLOSE:Int = 5;
	static var STATE_PAUSE:Int = 5;
	static var STATE_EXP:Int = 6;
	
	var _WINCHEAT:Bool = false;

	
	public function new(State:TownState, Enemies:Array<BaseEnemy>, ?WinFlag:String, ?WinFlagVal:Int) 
	{
		super();

		SoundManager.pauseMusic("all");
		SoundManager.playMusic("battle");

		_state = State;
		_arrEnemies = Enemies;
		_winFlag = WinFlag;
		_winFlagVal = WinFlagVal;
	
		_grpTexts = new FlxTypedGroup<FlxText>();
		_grpSprites = new FlxTypedGroup<FlxSprite>();
		_grpPicrossSquaresBoards = new FlxTypedGroup<PicrossBoard>();
		_grpCursor = new FlxTypedGroup<FlxSprite>();
		_grpObstacles = new FlxTypedGroup<ObstacleClasses.BaseObstacle>();
		_grpMenus = new FlxTypedGroup<BaseMenu>();

		xanchor = Std.int((FlxG.width-FlxG.height)/2);
		yanchor = Std.int(0);

		window = new Window([xanchor, yanchor], [FlxG.height, FlxG.height]);
		xanchor += window.pad*2;
		yanchor += window.pad*2;
		add(window);
		
		_txtMP = new FlxText(xanchor, yanchor, 64, "MP: " + Player.mp, 8);
		
		_sprPlayer = new FlxSprite(xanchor, _txtMP.y + _txtMP.height);
		_sprPlayer.loadGraphic("assets/images/mctest.png", true, 16, 16);
		_sprPlayer.animation.add("idle_1", [2, 3], 4, true);
		_sprPlayer.animation.add("dead_1", [8, 9], 4, true);
		_sprPlayer.animation.add("idle_0", [12, 13], 4, true);
		_sprPlayer.animation.add("dead_0", [18, 19], 4, true);
		_sprPlayer.animation.play("idle_" + Reg.flags["p_hood"]);
		
		_txtVS = new FlxText(_sprPlayer.x + _sprPlayer.width, _sprPlayer.y + 8, 16, "vs", 8);

		_txtEnemyMP = new FlxText(xanchor, _txtVS.y + _txtVS.height, 64, "MP: " + _arrEnemies[0].mp, 8);
		_txtEnemyMP.x += 0;  // random padding, will change whenever I fix the ui in general
		_txtEnemyMP.alignment = "right";
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
			var picross = new PicrossBoard(e.dimens, e.color, e.maxMP, [xanchor, yanchor]);
	   		_arrPicrossBoards.push(picross);
	   		e.setBoard(picross);
	   		e.setGrpObs(_grpObstacles);
		}

   		for(pc in _arrPicrossBoards)
	   		_grpPicrossSquaresBoards.add(pc);
		setUpBoard();


		_grpSprites.add(_sprEnemy);	
		_grpSprites.add(_sprPlayer);	

		_grpTexts.add(_txtMP);
		_grpTexts.add(_txtEnemyMP);
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
		if (Reg.flags["tutorial_battle"] == 1)
		{
			eventManager.addEvents([new EventFlag("tutorial_battle", 2),
									new EventDialog(Strings.frogponddunStrings[5], this)]);
		}
	}
	
	public override function update(elapsed:Float)
	{
		eventManager.update(elapsed);

		// timer buisness
		if (_txtMessage.text != "")
			_msgTimer -= FlxG.elapsed;
		if (_msgTimer <= 0)
			_txtMessage.text = "";
		_txtMP.text = "MP: " + Player.mp;
		_txtEnemyMP.text = "MP: " + _arrEnemies[_enemyNum].mp;

		// this block is basically resolveAnimations()
		if (battleState == STATE_BATTLE)
		{
			if (_mcHurtTimer > 0)
			{
				_mcHurtTimer -= FlxG.elapsed;
				_sprPlayer.animation.play("dead_" + Reg.flags["p_hood"]);
			}
			else
				_sprPlayer.animation.play("idle_" + Reg.flags["p_hood"]);
		}

		if (battleState == STATE_VICTORY)
		{
			SoundManager.pauseMusic("battle");
			SoundManager.playMusic("victoly");
		}
		else if (battleState == STATE_DEFEAT)
		{
			SoundManager.pauseMusic("battle");
			SoundManager.playMusic("defeat");		
		}

		// cursor movement and other control stuff
		else if (battleState == STATE_BATTLE)
		{
			if (_inputsDelayTimer >= _inputsDelayDuration)
				playerInputs(elapsed);
			else
				_inputsDelayTimer += elapsed;
			_arrEnemies[_enemyNum].update(elapsed);
		}
		else if (battleState == STATE_MENU)
		{
			if (_menu.isAlive == false)
			{
				battleState = STATE_BATTLE;
				setUpBoard();
				remove(_menu);
				_inputsDelayTimer = 0;
			}
		}		
		else if (battleState == STATE_PAUSE)
		{
			if (_menu.isAlive == false)
			{
				battleState = STATE_BATTLE;
				remove(_menu);
				_inputsDelayTimer = 0;
			}
		}
		else if (battleState == STATE_ESCAPE && _txtMessage.text == "")
			this.close();

		// if you die
		if (Player.mp <= 0)
		{
			Player.mp = 0;
			if (battleState != STATE_DEFEAT)
			{
				_sprPlayer.animation.play("dead_" + Reg.flags["p_hood"]);
				_txtMessage.text = "You got stumped on, kid.";
				_msgTimer = _msgDuration;
				battleState = STATE_DEFEAT;
			}
			else if (battleState == STATE_DEFEAT && _txtMessage.text == "")
				this.close();
		}
		
		// if you win
		if (winCheck() == true || _WINCHEAT == true)
		{
			_grpObstacles.clear();

			if (battleState != STATE_VICTORY && battleState != STATE_EXP)
			{
				_sprEnemy.animation.play("dead");
				_sprPlayer.animation.play("idle_" + Reg.flags["p_hood"]);
				_txtMessage.text = "YOU DEFEATED";
				_msgTimer = _msgDuration;
				battleState = STATE_VICTORY;
			}
			else if (battleState == STATE_VICTORY && _txtMessage.text == "")
			{

				if (_enemyNum == _arrPicrossBoards.length-1)
				{
					if (_winFlag != null && Reg.flags[_winFlag] != _winFlagVal)
						eventManager.addEvents([new EventFlag(_winFlag, _winFlagVal)]);

					var _sumXP = 0;  
					for (enemy in _arrEnemies)	
						_sumXP += enemy.xp;

					trace("_sumXP:  ", _sumXP);

					var tempID = FlxG.random.int(0, 3);  // 4 is the amount of unique XP strings  TODO: make it a variable imo
					tempID = tempID + 5 + (4 * Reg.flags["p_hood"]);  // 5 is the ID of the first XP string

					eventManager.addEvents([new EventStringVarChange("%xp%", ""+_sumXP),
											new EventDialog(Strings.stringArray[tempID], this),
											]);

					if (Player.addXP(_sumXP))  // if the player leveled up
					{
						eventManager.addEvents([new EventStringVarChange("%level%", ""+Player.lp),
												new EventDialog(Strings.stringArray[13+Reg.flags["p_hood"]], this),
												]);
					}

					battleState = STATE_EXP;
				}
				else 
				{
					_arrPicrossBoards[_enemyNum].flipActive();
					_arrEnemies[_enemyNum].removeAllObstacles();
					_grpObstacles.clear();
					_enemyNum += 1;
					setUpMenu("Next round");
					battleState = STATE_MENU;
				}
			}
			if (battleState == STATE_EXP)
			{
				if (eventManager.getLength() <= 0)
					this.close();
			}
		}
		super.update(elapsed);
	}
	
	override public function close():Void
	{
		Reg.resetEncounterCounter(_state.encounterLowerBound, _state.encounterUpperBound);
		_state.playSong();
		super.close();
	}

	private function markSquare(Cursor:FlxSprite, Guess:Int):Int
	{
		var tempX = Std.int((Cursor.x - _curBoard.gridPicrossSquares[0][0].x) / 10);
		var tempY = Std.int((Cursor.y - _curBoard.gridPicrossSquares[0][0].y) / 10);

		if (tempX < _curBoard.dimens[1] && tempY >= 0)
		{
			var _cell = _curBoard.gridPicrossSquares[tempY][tempX];
			if (Guess != PEN_IDLE)
				_lastMarkedSquare = _cell;
			var result:Int = _cell.turnOnOrOff(Guess);
			switch (result)
			{
				case PicrossSquare.CORRECT:
				{
					_arrEnemies[_enemyNum].onSquareFilled();
					// _arrPicrossBoards[_enemyNum].enemy.onSquareFilled();
					_arrPicrossBoards[_enemyNum].checkRowCorrect(_cell.rowID);
					_arrPicrossBoards[_enemyNum].checkColCorrect(_cell.colID);
					return 1;
				}
				case PicrossSquare.GOODHURT:
				{
					_arrEnemies[_enemyNum].onSquareFilled();
					_arrEnemies[_enemyNum].onSquareHurt();
					takeDamage();
					_arrPicrossBoards[_enemyNum].checkRowCorrect(_cell.rowID);
					_arrPicrossBoards[_enemyNum].checkColCorrect(_cell.colID);
					camera.shake(0.005, 0.2);
					return 1;
				}
				case PicrossSquare.HURT:
				{
					_arrEnemies[_enemyNum].onSquareHurt();
					camera.shake(0.005, 0.2);
					takeDamage();
				}
				return 0;
			}
			return 0;
		}
		else
			return 0;
		
	}

	private function moveCursor(Dir:Int):Void
	{
		switch (Dir)
		{
			case FlxObject.UP:
			{
				_cursorTimerVert = 0;

				if (_curBoard.selected[1] > 0)
					_curBoard.selected[1] -= 1;
				else
					_curBoard.selected[1] = _curBoard.gridPicrossSquares.length-1;
			}
			case FlxObject.DOWN:
			{
				_cursorTimerVert = 0;

				if (_curBoard.selected[1] < _curBoard.gridPicrossSquares.length-1)
					_curBoard.selected[1] += 1;
				else
					_curBoard.selected[1] = 0;
			}
			case FlxObject.LEFT:
			{
				_cursorTimerHorz = 0;

				if (_curBoard.selected[0] > 0)
					_curBoard.selected[0] -= 1;
				else
					_curBoard.selected[0] = _curBoard.gridPicrossSquares[0].length-1;
			}
			case FlxObject.RIGHT:
			{
				_cursorTimerHorz = 0;

				if (_curBoard.selected[0] < _curBoard.gridPicrossSquares[0].length-1)
					_curBoard.selected[0] += 1;
				else
					_curBoard.selected[0] = 0;
			}
		}

		var x = _curBoard.gridPicrossSquares[_curBoard.selected[1]][_curBoard.selected[0]].x;
		var y = _curBoard.gridPicrossSquares[_curBoard.selected[1]][_curBoard.selected[0]].y;
		_sprPen.x = x;
		_sprPen.y = y;
		_arrPicrossBoards[_enemyNum].colRowBold(_sprPen.x, _sprPen.y);
		refreshCursorsPos();
	}

	private function playerInputs(elapsed:Float):Void
	{
		// // cursor movement / dpad stuff
		if (FlxG.keys.anyJustReleased(Reg.keys["vert"]) && !FlxG.keys.anyPressed(Reg.keys["vert"]))
		{
			_cursorTimerVert = 0;
			_cursorIsMovingVert = false;
		}
		if (FlxG.keys.anyJustReleased(Reg.keys["horz"]) && !FlxG.keys.anyPressed(Reg.keys["horz"]))
		{
			_cursorTimerHorz = 0;
			_cursorIsMovingHorz = false;
		}

		if (FlxG.keys.anyPressed(Reg.keys["dpad"]))
		{
			if (FlxG.keys.anyPressed(Reg.keys["horz"]))
			{
				_cursorTimerHorz += elapsed;
				if (_cursorTimerHorz >= _cursorDuration || _cursorIsMovingVert)
					_cursorIsMovingHorz = true;
			}
			if (FlxG.keys.anyPressed(Reg.keys["vert"]))
			{
				_cursorTimerVert += elapsed;
				if (_cursorTimerVert >= _cursorDuration || _cursorIsMovingHorz)
					_cursorIsMovingVert = true;
			}
			// gotta do this to prevent any staggered diagonal movement
			if (FlxG.keys.anyPressed(Reg.keys["horz"]) && FlxG.keys.anyPressed(Reg.keys["vert"]))
			{
				_cursorTimerVert = Math.max(_cursorTimerVert, _cursorTimerHorz);
				_cursorTimerHorz = _cursorTimerVert;
			}
		}		


		if (FlxG.keys.anyJustPressed(Reg.keys["up"]) || (_cursorIsMovingVert && FlxG.keys.anyPressed(Reg.keys["up"])))
		{
			if (FlxG.keys.anyJustPressed(Reg.keys["up"]) || _cursorTimerVert > _cursorInterval)
			{
				if (_curBoard.state == PicrossBoard.REVERSEDVERT || _curBoard.state == PicrossBoard.REVERSEDBOTH)
					moveCursor(FlxObject.DOWN);
				else
					moveCursor(FlxObject.UP);
			}
		}
		else if (FlxG.keys.anyJustPressed(Reg.keys["down"]) || (_cursorIsMovingVert && FlxG.keys.anyPressed(Reg.keys["down"])))
		{
			if (FlxG.keys.anyJustPressed(Reg.keys["down"]) || _cursorTimerVert > _cursorInterval)
			{
				if (_curBoard.state == PicrossBoard.REVERSEDVERT || _curBoard.state == PicrossBoard.REVERSEDBOTH)
					moveCursor(FlxObject.UP);
				else
					moveCursor(FlxObject.DOWN);
			}
		}
		if (FlxG.keys.anyJustPressed(Reg.keys["left"]) || (_cursorIsMovingHorz && FlxG.keys.anyPressed(Reg.keys["left"])))
		{
			if (FlxG.keys.anyJustPressed(Reg.keys["left"]) || _cursorTimerHorz > _cursorInterval)
			{
				if (_curBoard.state == PicrossBoard.REVERSEDHORZ || _curBoard.state == PicrossBoard.REVERSEDBOTH)
					moveCursor(FlxObject.RIGHT);
				else
					moveCursor(FlxObject.LEFT);
			}
		}
		else if (FlxG.keys.anyJustPressed(Reg.keys["right"]) || (_cursorIsMovingHorz && FlxG.keys.anyPressed(Reg.keys["right"])))
		{
			if (FlxG.keys.anyJustPressed(Reg.keys["right"]) || _cursorTimerHorz > _cursorInterval)
			{
				if (_curBoard.state == PicrossBoard.REVERSEDHORZ || _curBoard.state == PicrossBoard.REVERSEDBOTH)
					moveCursor(FlxObject.LEFT);
				else
					moveCursor(FlxObject.RIGHT);
			}
		}


		// // debug stuff TODO: remove in any official builds
		if (FlxG.keys.anyJustPressed(["I"]))
			_arrEnemies[_enemyNum].spawnObstacle();
		if (FlxG.keys.anyJustPressed(["O"]))
			_arrEnemies[_enemyNum].removeObstacle();
		if (FlxG.keys.anyJustPressed(["P"]))
			camera.shake(0.005, 0.2);
	

		if (FlxG.keys.anyJustPressed(Reg.keys["menu"]))
		{
			setUpMenu("Back");
			battleState = STATE_PAUSE;
		}
		
		if (FlxG.keys.anyJustPressed(["M"]))
			FlxG.sound.toggleMuted();

		// fleeing
		if (FlxG.keys.anyPressed(["ESCAPE"]))
		{
			if (battleState != STATE_ESCAPE)
			{
				_txtMessage.text = "Escaping...";
				_msgTimer = _msgDuration;
				battleState = STATE_ESCAPE;
			}
		}

		if (FlxG.keys.anyPressed(["Y"]))
			_WINCHEAT = true;
		// marking squares
		if (FlxG.keys.anyPressed(Reg.keys["conf/canc"]))
		{
			if (FlxG.keys.anyJustPressed(Reg.keys["confirm"]))
				penState = PEN_ON;
			else if (FlxG.keys.anyJustPressed(Reg.keys["cancel"]))
			{
				var cell:PicrossSquare = _curBoard.gridPicrossSquares[_curBoard.selected[1]][_curBoard.selected[0]];
				if (cell.animation.curAnim.name == "mark")
					penState = PEN_OFF;
				else
					penState = PEN_MARK;
			}
			if (markSquare(_sprPen, penState) == 1)
			{
				for (cursor in _grpCursor)
				{
					if (cursor != _sprPen)
						markSquare(cursor, PicrossSquare.SOLVE);
				}
			}
			
		}
	}

	private function refreshCursorsPos():Void
	{
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
	}

	private function setUpBoard():Void
	{

		_enemyID = _arrEnemies[_enemyNum].id;
		_sprPen.x = xanchor + 48;
		_sprPen.y = yanchor + 48;
		refreshCursorsPos();

		for (e in _arrEnemies)
	   		e.setGrpObs(_grpObstacles);

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
		_curBoard = _arrPicrossBoards[_enemyNum];
	}

	private function setUpMenu(CloseString:String):Void
	{
		SoundManager.playMusic("battle");
	
		_cursorTimerHorz = 0;
		_cursorIsMovingHorz = false;
		_cursorTimerVert = 0;
		_cursorIsMovingVert = false;
		var square:FlxSprite = _arrPicrossBoards[_enemyNum].grpPicrossSquares.getFirstAlive();
		var items:Array<BaseMenuItem> = new Array<BaseMenuItem>();

		// lotta arbitrary numbers derived from MenuSubState's MenuPause values
		// the 14 and 28 are an attempt to match the spacing of the 2 column inv menu
		// _menu = new MenuInventory(  [108, 16], 
		// 							[FlxG.width - 108 - 16, 140], 
		// 							2, "back", [150, 5], this);
		_menu = new MenuInventory(  [14, yanchor * 1.5], 
									[FlxG.width - 28, 92], 
									3, CloseString, [150, 5], this);

		_menu.isAlive = true;
		add(_menu);
		_menu.open();
		MenuManager.setSubState(this);
	}

	private function takeDamage():Void
	{
		Player.mp -= _arrEnemies[_enemyNum].damage;
		_txtMessage.text = " ";
		_txtMessage.text = "Suffered " + _arrEnemies[_enemyNum].damage + " damages.";
		_msgTimer = _msgDuration;
		_mcHurtTimer = _mcHurtDuration;
	}

	private function winCheck():Bool
	{
		for (row in 0..._arrPicrossBoards[_enemyNum].dimens[0])
		{
			if (_arrPicrossBoards[_enemyNum].checkRowCorrect(row) == false)
			{
				return false;
			}
		}
		return true;
	}

}