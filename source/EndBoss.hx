// package;

// /**
//  * ...
//  * @author ...
//  */
// class EndBoss extends NPC
// {

// 	public function new(X:Float=0, Y:Float=0, Direction:Int, Species:Int, DialogLine:Int, LineCount:Int, State:TownState) 
// 	{
// 		super(X, Y, Direction, Species, DialogLine, LineCount, State);
		
// 		if (Reg.pXP == 0)
// 		{
// 			_dLine = 60;
// 			_lineCount = 27;
// 		}
		
// 	}

// 	override private function dialogBox():Void
// 	{
		
// 		if (Reg.postDialogBattleFlag)
// 		{
// 			_state.songTownsong.pause();
// 			var sub2 = new EndBossFightSubState(4);
// 			_state.openSubState(sub2);
// 		}
// 		else
// 		{
// 			var sub = new DialogSubState(_dLine, _lineCount, this, true);
// 			_state.openSubState(sub);
// 		}
		
// 		return;
// 	}

// }