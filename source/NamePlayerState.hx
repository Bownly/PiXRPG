package;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class NamePlayerState extends FlxState
{
	var colorDefault = 0xffffff;
	var colorSelected = 0x0099FF;
	
	var _sprCharacter:FlxSprite;
	var _txtInstructions:FlxText;
	var _txtName:FlxText;
	var _txtControls:FlxText;
	var _txtDone:FlxText;
	var _doneSelected:Bool = false;
	var _selected:Array<Int>;
	var _grpLetters:FlxTypedGroup<FlxText>;
	var _arrLetters:Array<Array<FlxText>>;

	var MAX_LENGTH:Int = 8;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.camera.bgColor = 0x0000000;

		_grpLetters = new FlxTypedGroup<FlxText>();
		_arrLetters = new Array<Array<FlxText>>();
	
		var letterList = [  ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M"],
							["N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"],
							["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"], 
		                	["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"],
							["-", "~", "_", "'", "\"", "(", ")", ".", ",", "!", "?", ":", ";"], 
							[" ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "#", "+"]
						 ];
		
		var xanchor:Float = 0;
		var yanchor:Float = 48;  // arbitray spacing number determined to look good

		_txtInstructions = new FlxText(xanchor, yanchor, FlxG.width, "Enter your name:", 8);
		_txtInstructions.setFormat(8, colorDefault, "center");
		yanchor += _txtInstructions.height;

		_sprCharacter = new FlxSprite(FlxG.width / 2 - 8, _txtInstructions.y - 24);
		_sprCharacter.loadGraphic(AssetPaths.mctest__png, true, 16, 16);
		_sprCharacter.animation.add("dn_0", [12, 13], 3, true);
		_sprCharacter.animation.play("dn_0");

		_txtName = new FlxText(xanchor, yanchor, FlxG.width, "", 8);
		_txtName.setFormat(16, colorDefault, "center");

		xanchor += 56;  // arbitray spacing number determined to look good
		yanchor += _txtName.height;

		for (row in 0...letterList.length)
		{
			var rowArray = [];
			for (ltr in 0...letterList[row].length)	
			{
				var txt = new FlxText(xanchor + (16 * ltr), yanchor + (16 * row), letterList[row][ltr], 8);
				_grpLetters.add(txt);
				rowArray.push(txt);
			}
			_arrLetters.push(rowArray);
		}
		_txtDone = new FlxText(0, 0, FlxG.width, "Confirm", 8);
		_txtDone.y = _arrLetters[_arrLetters.length-1][_arrLetters[0].length-1].y + _txtDone.height;
		_grpLetters.add(_txtDone);

		_selected = [0, 0];

		_txtControls = new FlxText(0, 0, FlxG.width, "J = confirm, K = not confirm, WASD/Arrows = move");
		_txtControls.y = FlxG.height - _txtControls.height;
		_txtControls.alignment = "center";

		add(_txtInstructions);
		add(_sprCharacter);
		add(_txtName);
		add(_txtControls);
		add(_grpLetters);
				
		FlxG.mouse.visible = false;		
		super.create();	
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float):Void
	{
		colorize();
		
		// cursor movement
		if (FlxG.keys.anyJustPressed(Reg.keys["up"])) 
		{
			if (_doneSelected)
			{
				_doneSelected = false;
				_selected[0] = _arrLetters.length - 1;
			}
			else
			{
				_selected[0]--;
				if (_selected[0] < 0)
				{
					_doneSelected = true;
					_selected[0] = _arrLetters.length - 1;
				}
			}
		}
		else if (FlxG.keys.anyJustPressed(Reg.keys["down"]))
		{
			if (_doneSelected)
			{
				_doneSelected = false;
				_selected[0] = 0;
			}
			else
			{
				_selected[0]++;
				if (_selected[0] >= _arrLetters.length)
				{
					_doneSelected = true;
					_selected[0] = 0;
				}
			}
		}
		if (FlxG.keys.anyJustPressed(Reg.keys["right"])) 
		{
			_selected[1]++;
			if (_selected[1] >= _arrLetters[0].length)
				_selected[1] = 0;
		}
		else if (FlxG.keys.anyJustPressed(Reg.keys["left"]))
		{
			_selected[1]--;
			if (_selected[1] < 0)
				_selected[1] = _arrLetters[0].length-1;
		}
			
		if (FlxG.keys.anyJustPressed(Reg.keys["confirm"]))
		{
			if (!_doneSelected && _txtName.text.length < MAX_LENGTH)
				_txtName.text += _arrLetters[_selected[0]][_selected[1]].text;
			else if (!_doneSelected && _txtName.text.length == MAX_LENGTH)
				_txtName.text = _txtName.text.substr(0, MAX_LENGTH-1) + _arrLetters[_selected[0]][_selected[1]].text;
			else if (_doneSelected)
				done();
		}
		else if (FlxG.keys.anyJustPressed(Reg.keys["cancel"]))
		{
			if (_txtName.text.length > 0)
				_txtName.text = _txtName.text.substr(0, _txtName.text.length-1);
		}
		if (FlxG.keys.anyJustPressed(["ENTER"]))
			_doneSelected = true;

		super.update(elapsed);
	}		

	
	function colorize():Void
	{
		for (txt in _grpLetters)
			txt.setFormat(8, colorDefault, "center");
		
		if (!_doneSelected)
			_arrLetters[_selected[0]][_selected[1]].setFormat(8, colorSelected, "center");
		else
			_txtDone.setFormat(8, colorSelected, "center");
	}

	function done():Void
	{
		// record pname
		if (_txtName.text == "")
			Strings.stringVars["%pname%"] = "Pepe";
		else
			Strings.stringVars["%pname%"] = _txtName.text;

		// goto next state
		FlxG.switchState(new NameRivalState());


	}

}