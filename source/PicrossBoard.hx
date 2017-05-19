package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author ... @Bownly
 */
class PicrossBoard extends FlxGroup
{
	static public var NORMAL:Int = 0;
	static public var REVERSEDVERT:Int = 1;
	static public var REVERSEDHORZ:Int = 2;
	static public var REVERSEDBOTH:Int = 3;
	public var state:Int = 0;

	public var grpTexts:FlxTypedGroup<FlxText>;
	public var grpSprites:FlxTypedGroup<FlxSprite>;
	public var grpPicrossSquares:FlxTypedGroup<PicrossSquare>;

	public var coords:Array<Int>;
	public var color:Array<Int>;

	public var isActive:Bool;
	
	public var dimens:Array<Int>;
	public var squareCount:Int;
	public var winCount:Int = 0;
	public var curCount:Int = 0;
	
	public var rowArray:Array<Int> = new Array<Int>();
	public var colArray:Array<Array<Int>> = new Array<Array<Int>>();
	public var rowHintStrings:Array<String> = new Array<String>();
	public var colHintStrings:Array<String> = new Array<String>();
	public var arrRowHints:Array<FlxText> = new Array<FlxText>();
	public var arrColHints:Array<FlxText> = new Array<FlxText>();
	public var gridPicrossSquares:Array<Array<PicrossSquare>> = new Array<Array<PicrossSquare>>();
	public var selected:Array<Int> = [0,0];

	
	public function new(Dimens:Array<Int>, Color:Array<Int>, SquareCount:Int, Coords:Array<Int>, ?Anchor:FlxSprite) 
	{
		super();
	
		dimens = Dimens;
		color = Color;
		squareCount = SquareCount;
		coords = Coords;
	
		grpTexts = new FlxTypedGroup<FlxText>();
		grpSprites = new FlxTypedGroup<FlxSprite>();
		grpPicrossSquares = new FlxTypedGroup<PicrossSquare>();
		
		add(grpSprites);
		add(grpTexts);
		add(grpPicrossSquares);

		// creates a grid of empty PicrossSquares
		for (j in 0...dimens[0])
		{
			var arr = new Array<PicrossSquare>();
			for (i in 0...dimens[1])
			{
				var tempColor = color[0];
				if (((i%10 >= 5) && (j%10 >= 5)) || ((i%10 <= 4) && (j%10 <= 4)))
					tempColor = color[1];
				var pSquare = new PicrossSquare(coords[0] + 48 + i * 10, coords[1] + 48 + j * 10, tempColor, i, j, 0);
				arr.push(pSquare);
				grpPicrossSquares.add(pSquare);
			}
			gridPicrossSquares.push(arr);
		}

		// fills up the grid with "ON" squares
		var tempCount:Int = 0;
		while (tempCount < squareCount)
		{
			var x:Int = FlxG.random.int(0, dimens[1]-1);
			var y:Int = FlxG.random.int(0, dimens[0]-1);
			if (gridPicrossSquares[y][x].answer == PicrossSquare.OFF)
			{
				tempCount++;
				gridPicrossSquares[y][x].switchAnswer(PicrossSquare.ON);
			}
		}

		// sets up the hint Strings and FlxTexts
		setUpHintTexts();

		// sets all of the elements to stay centered to the current camera location
		for(text in grpTexts) 
		{
			text.scrollFactor.set();
			text.visible = false;
		}
		for(spr in grpSprites) 
		{
			spr.scrollFactor.set();
			spr.visible = false;
		}
		for(pX in grpPicrossSquares) 
		{
			pX.scrollFactor.set();
			pX.visible = false;
		}
		
		active = false;
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}

	private function calcRowHintStrings(Row:Array<PicrossSquare>):String
	{
		var count:Int = 0;
		var str:String = "";
		for (cell in Row)
		{
			if (cell.answer == 1)
				count++;
			else
			{
				if (count != 0)
				{
					str += " " + count;
					count = 0;
				}
			}
		}
		if (count != 0)  // have to do this one more time because it won't otherwise check after the last cell
			str += " " + count;
		return str;
	}
	
	private function calcColHintStrings(Col:Array<Array<PicrossSquare>>, I:Int):String
	{
		var count:Int = 0;
		var str:String = "";
		var i = I;
		
		str = "";
		for (row in Col)
		{
			if (row[i].answer == 1)
				count++;
			else
			{
				if (count != 0)
				{
					str += "\n" + count;
					count = 0;
				}
			}
		}
		if (count != 0)  // have to do this one more time because it won't otherwise check after the last cell
		{
			str += "\n" + count;
			count = 0;
		}
		return str;
	}

	public function colRowBold(X:Float, Y:Float):Void
	{
		for (row in arrRowHints)
			row.bold = false;
		for (col in arrColHints)
			col.bold = false;

		for (cell in grpPicrossSquares)
		{
			if (X == cell.x && Y == cell.y)
			{
				arrRowHints[cell.rowID].bold = true;
				arrColHints[cell.colID].bold = true;
			}
		}
	}

	public function checkRowCorrect(RowID:Int):Bool
	{
		for (i in 0...dimens[1])
		{
			if (gridPicrossSquares[RowID][i].answer != gridPicrossSquares[RowID][i].status)
			{
				arrRowHints[RowID].setFormat(arrRowHints[RowID].size, FlxColor.WHITE);
				return false;
			}
		}
		arrRowHints[RowID].setFormat(arrRowHints[RowID].size, FlxColor.GRAY);
		return true;
	}

	public function checkColCorrect(ColID:Int):Bool
	{
		for (row in 0...dimens[0])
		{
			if (gridPicrossSquares[row][ColID].answer != gridPicrossSquares[row][ColID].status)
			{
				arrColHints[ColID].setFormat(arrColHints[ColID].size, FlxColor.WHITE);
				return false;
			}
		}
		arrColHints[ColID].setFormat(arrColHints[ColID].size, FlxColor.GRAY);
		return true;
	}

	public function flipActive():Void
	{
		if (isActive == true)
		{
			isActive = false;
			for(text in grpTexts) 
				text.visible = false;
			for(spr in grpSprites) 
				spr.visible = false;
			for(pX in grpPicrossSquares) 
				pX.visible = false;
		}
		else
		{
			isActive = true;
			for(text in grpTexts) 
				text.visible = true;
			for(spr in grpSprites) 
				spr.visible = true;
			for(pX in grpPicrossSquares) 
				pX.visible = true;
		}
	}

	public function setUpHintTexts():Void
	{
		arrRowHints = new Array<FlxText>();
		for (i in 0...dimens[0])
		{
			rowHintStrings.push(calcRowHintStrings(gridPicrossSquares[i]));

			// 70 is a rough estimate of the offset between the battle window edge and the leftmost picross square
			// yeah, it's lazy, but it works
			var txt:FlxText = new FlxText(coords[0] - 70, coords[1] + 46 + i * 10, 48 + 70, rowHintStrings[i], 8);
			txt.alignment = "right";
			arrRowHints.push(txt);
			grpTexts.add(txt);
		}
		arrColHints = new Array<FlxText>();
		for (i in 0...dimens[1])
		{
			colHintStrings.push(calcColHintStrings(gridPicrossSquares, i));

			var txt:FlxText = new FlxText(coords[0] + 48 + i * 10, coords[1] + 48, 14, colHintStrings[i], 8);
			txt.y -= txt.height;
			arrColHints.push(txt);
			grpTexts.add(txt);
		}
	}
}