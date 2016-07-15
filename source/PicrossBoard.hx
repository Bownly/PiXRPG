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
	
	public var grpTexts:FlxTypedGroup<FlxText>;
	public var grpSprites:FlxTypedGroup<FlxSprite>;
	public var grpPicrossSquares:FlxTypedGroup<PicrossSquare>;

	public var coords:Array<Int>;
	public var color:Int;

	public var isActive:Bool;
	
	public var dimens:Int;
	public var winCount:Int = 0;
	public var curCount:Int = 0;
	
	public var rowArray:Array<Int> = new Array<Int>();
	public var colArray:Array<Array<Int>> = new Array<Array<Int>>();
	public var rowHints:Array<String> = new Array<String>();
	public var colHints:Array<String> = new Array<String>();
	public var arrRowHints:Array<FlxText> = new Array<FlxText>();
	public var arrColHints:Array<FlxText> = new Array<FlxText>();
	public var gridPicrossSquares:Array<Array<PicrossSquare>> = new Array<Array<PicrossSquare>>();

	
	public function new(Size:Int, Color:Int, Coords:Array<Int>, ?Anchor:FlxSprite) 
	{
		super();
	
		// _sprBack = Anchor;
		coords = Coords;
		color = Color;
		dimens = Size;
	
		grpTexts = new FlxTypedGroup<FlxText>();
		grpSprites = new FlxTypedGroup<FlxSprite>();
		grpPicrossSquares = new FlxTypedGroup<PicrossSquare>();
		
		add(grpSprites);
		add(grpTexts);
		add(grpPicrossSquares);

		for (i in 0...dimens)
		{
			var arr = new Array<PicrossSquare>();
			for (j in 0...dimens)
				arr.push(new PicrossSquare(0, 0, 0, 0, 0, 0));
			gridPicrossSquares.push(arr);
		}

		// sets up the values of the randomized grid
		for (i in 0...dimens)
		{
			rowArray = [];
			for (j in 0...dimens)
			{
				var rand:Int = FlxG.random.int(0, 2);
				if (rand > 0)
				{
					rowArray.push(1);
					winCount++;
				}
				else
					rowArray.push(0);

			}
			rowHints.push(calcRowHints(rowArray));

			var txt:FlxText = new FlxText(coords[0], coords[1] + 46 + i * 10, 48, rowHints[i], 8);
			txt.alignment = "right";
			arrRowHints.push(txt);
			grpTexts.add(txt);
			colArray.push(rowArray);
		}
		for (i in 0...dimens)
		{
			colHints.push(calcColHints(colArray, i));

			var txt:FlxText = new FlxText(coords[0] + 48 + i * 10, coords[1] + 48, 14, colHints[i], 8);
			txt.y -= txt.height;
			arrColHints.push(txt);
			grpTexts.add(txt);
		}
		
		// sets up the actual grid of PicrossSquares
		for (X in 0...rowArray.length)
		{
			for (Y in 0...colArray.length)
			{
				var pSquare:PicrossSquare = new PicrossSquare(coords[0] + 48 + X * 10, coords[1] + 48 + Y * 10, color, X, Y, colArray[Y][X]);
				gridPicrossSquares[Y][X] = pSquare;
				grpPicrossSquares.add(pSquare);
			}
		}
		
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

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	private function calcRowHints(Row:Array<Int>):String
	{
		var count:Int = 0;
		var str:String = "";
		for (cell in Row)
		{
			if (cell == 1)
			{
				count++;
			}
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
		{
			str += " " + count;
		}
		return str;
	}
	
	private function calcColHints(Col:Array<Array<Int>>, I:Int):String
	{
		var count:Int = 0;
		var str:String = "";
		var i = I;
		
		str = "";
		for (row in Col)
		{
			if (row[i] == 1)
			{
				count++;
			}
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
		for (i in 0...dimens)
		{
			if (colArray[RowID][i] != gridPicrossSquares[RowID][i].status)
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
		for (row in 0...dimens)
		{
			if (colArray[row][ColID] != gridPicrossSquares[row][ColID].status)
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

}