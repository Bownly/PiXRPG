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



	static public var OldOldstringArray:Array<Array<String>> = [
	// 0
	["Hello. I am half cat, half rabbit. \nBark bark bark."], 
	
	// 1
	["Hello. I am brown dog.",
	"Regrettably, I do not dispense luck. Goodbye."],
	
	// 2
	["Oh, you're on an adventure or whatever?",
	"Get some good luck from this... creature."],
	
	// 3
	["Welcome to our nation's capitol, Town 2!",
	"We placed #6 in the national puzzle solving competition."],
	
	// 4
	["Welcome, child. I am Pic' O' Ro'ss.",
	"You are 'The Player'.",
	"Only you can rival 'The Bad Guy'.",
	"...If you find yourself so inclined, that is."],
	
	// 5
	["Don't bother talking to my pet, um... animal?",
	"Even for a--whatever he is--he's a complete tool-bag."],
	
	// 6
	["I'm the biggest jerk I know. Speaking of which...",
	"Picross is for nerds! \nGet out of my house, nerd!"],
	
	// 7
	["You did well to navigate my maze.",                         // id = 15
	"To reward your cleverness, I'll tell you the game's story.",
	"'The Bad Guy' is responsible for all these picross monsters.",
	"And you must SLAY him.",
	"Because you're 'The Player'.",                 
	"...",                                                       // id = 20
	"... ...",
	"... ... ...",
	"... ... ,,, ...",
	"...",                                        
	"...What?",                                                  // id = 25
	"You expected some deep lore?",
	"Dude, this is a mini ludum dare game.",
	"Story takes a backseat to coding and art.",
	"And have you SEEN the art?",
	"... ... ... ... ...",													 // id = 30
	"You're still here? Fine, I'll tell you a secret",
	"The legendary weapon is in this dungeon.",
	"Go to the other end of my maze to find it.",
	"Use it to show 'The Bad Guy' that in this world of puzzles...",
	"...it's solve or BE solved!"],
	
	// 8
	["You found the legendary weapon, Picscalibur!",
	"...",
	"Wait... this game doesn't have any items or equpiment.",
	"You put the weapon back down, feeling cheated."],
	
	// 9
	["Greetings. I am 'The Bad Guy'.", 						     // id = 40
	"And you must be 'The Player'.",
	"I assume you have come here to fight me.",
	"Or, rather, to solve my final puzzle.",
	"Because as you've noticed, that's how fights work here.",          
	"When I began my reign as 'The Bad Guy'...",                 // id = 45             
	"I passed a decree that monsters couldn't hurt humans.",
	"Instead, they could only challenge you with fun puzzles.",
	"Now, if you solve my puzzle, you'll dethrone me...",
	"And the world will return to the old, violent, paradigm.",
	"Knowing that, do you still intend to challenge me?",        // id = 50
	"...",
	"... ...",
	"... ... ... ",
	"How foolish of me.",
	"You don't have a choice, do you?",                          // id = 55
	"You have to beat me in order to beat the game.",                     
	"In that case, stalling won't change anything.",
	"Very well.",
	"Come, 'Player'! Show me what you got!"],
		
	// 10
	["Greetings. I am 'The Bad Guy'.", 						     // id = 60
	"And you must be 'The Player'.",
	"I assume you have come here to fight me.",
	"Or, rather, to solve my final puzzle.",
	"Because as you've noticed, that's how fights work here.",          
	"When I began my reign as 'The Bad Guy'...",                 // id = 65             
	"I passed a decree that monsters couldn't hurt humans.",
	"Instead, they could only challenge you with fun puzzles.",
	"Now, if you solve my puzzle, you'll dethrone me...",
	"And the world will return to the old, violent, paradigm.",
	"Knowing that, do you still intend to challenge me?",        // id = 70
	"...\n... ...",
	"... ... ... ",
	"Pffffft! \nHahahaha!",                                           		 
	"I'm just screwing with you, dude!",                         
	"Wait, you thought this game actually had a serious plot?",  // id = 75
	"You must've spoken with that one flower guy.",
	"That guy plays too many video games.",
	"Unlike our intellectual puzzles, vidcons will rot your brain.",
	"Although I do have some bad news for you...",				 
	"Speaking with me locks you out of leveling up.",
	"Which means that you now have to fight me at level 1.",     // id = 80
	"You might feel like this is impossible, but don't give up!",
	"Try as many times as you wish.",							
	"Don't let this drain your real MP. You can do it.", 
	"Good luck, 'Player'. And if you do manage to win...",
	"Come back and play again sometime, will ya?"],
	
	// 11
	["HI! I'm hackeralias 2_2_Real!",
	"If you don't know how to play Picross, go look it up.",
	"I'm on a time budget so I can't explain the rules.",
	"Sorry, bud!"],
		
	// 12
	["Yo, champ in the making.",
	"When you encounter monsters on the field, they'll present you with a puzzle.",
	"There are three ways to end the encounter:",
	"1. Solve the puzzle and gain XP (piCROSS points).\n2. If the puzzle is too hard you can always \"ESCAPE\".\n3. If you run out of MP (Mental Points)...",
	"You'll be forced to stop working on that puzzle and take a rest.",
	"Wazzat? \"What about Hit Points\"? Who needs 'em!"]
	];


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

	
		[new DialogLine(0, "Hi! I'm hackeralias 2_2_Real!"),
		new DialogLine(0, "If you don't know how to play Picross, go look it up."),
		new DialogLine(0, "I'm on a time budget so I can't explain the rules."),
		new DialogLine(0, "Sorry, bud!")
		],
	
		[new DialogLine(0, "Yo, champ in the making."),
		new DialogLine(0, "When you encounter monsters on the field, they'll present you with a puzzle."),
		new DialogLine(0, "1. Solve the puzzle and gain XP (piCROSS points).\n2. If the puzzle is too hard you can always \"ESCAPE\".\n3. If you run out of MP (Mental Points)..."),
		new DialogLine(0, "You'll be forced to stop working on that puzzle and take a rest."),
		new DialogLine(0, "Wazzat? \"What about Hit Points\"? Who needs 'em!")
		],

		// 5
		[new DialogLine(0, "Hey dude, A or B?")
		],

		[new DialogLine(0, "A? A+ Sketchless!")
		],

		[new DialogLine(0, "B? Like Jerry Seinfeld's Bee Movie!")
		]

	];


}









