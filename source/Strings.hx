package;

import DialogClasses.DialogBox;
import DialogClasses.DialogLine;

/**
 * ...
 * @author ...
 */

 /**
 * All strings are stored here. This will make it easier for translating
 * ...although that might be getting way ahead of myself, haha.
 * It's more of a best practicies, habit forming kinda thing.
 */
class Strings
{


	static public var stringArray:Array<Array<DialogLine>> = [

		// 0
		[new DialogLine(0, Reg.pName + ", get up!\nHow could you sleep in on today of all days?"),
		new DialogLine(0, "Hurry up, you don't want to be late! You know how impatient Elder Froggo can get!"),
		],

		[new DialogLine(0, "Hey, " + Reg.pName + ", you look lost.\nStill half asleep, huh?\n" + Reg.rivalName + " already ran ahead. He's such an eager kid."),
		new DialogLine(1, "Huh? \"Where'd he go?\""),
		new DialogLine(0, "To Elder Froggo's house across the pond, obviously!\nYou'd best follow his lead and head there yourself."),
		],

		[new DialogLine(0, "ready 4 final challenge? Talk to other NPC for tutorial, else leave the town to start journey")
		],
		// 3
		[new DialogLine(6, "Hi! I'm hackeralias 2_2_Real\naka the Guac Prince!"),
		new DialogLine(5, "Whaaat!? You don't know how to play \nPicro--Er, I mean \"PiX\"?"),
		new DialogLine(4, "I'm on a time budget so I can't explain the \nrules."),
		new DialogLine(7, "Sorry, bud! Maybe later!")
		],
		// 4
		[new DialogLine(0, "Yo, champ in the making."),
		new DialogLine(0, "When you encounter monsters in the field, \nthey'll present you with a puzzle.\nWhen that happens, your options are as\nfollows:"),
		new DialogLine(0, "1. Solve the puzzle and gain XP (piCROSS \npoints).\n2. If the puzzle is too hard you can always \n\"ESCAPE\"."),
		new DialogLine(0, "3. If you run out of MP (Mental Points)...\nYou'll be forced to stop working on that\npuzzle and take a rest."),
		new DialogLine(0, "So, XP and MP. That's all you need to know. Got it?"),
		new DialogLine(1, "Wazzat? \"What about Hit Points\"?"),
		new DialogLine(2, "Who needs 'em!"),
		new DialogLine(3, "Sad face test sample text.")
		],


		// 5
		[new DialogLine(4, "Hey dude, A or B?")
		],
		// 6
		[new DialogLine(4, "A? A+ Sketchless!")
		],
		// 7 
		[new DialogLine(4, "B? Like Jerry Seinfeld's Bee Movie!")
		],
		// 8
		[new DialogLine(0, "Hey kid... wanna save?")
		],
		// 9
		[new DialogLine(0, "Game saved.")
		],

		// 10
		[new DialogLine(0, "Hello, it is I, the rarest Pepe."),
		new DialogLine(1, "Wazzat? You claim to have Pepes rarer than\nI?"),
		new DialogLine(3, "I didn't think it was possible. My whole life is\na lie..."),
		new DialogLine(2, "Psyche! I just bought and sold all of your\nrarest Pepes! Suck it nerd!")
		],

	];


}









