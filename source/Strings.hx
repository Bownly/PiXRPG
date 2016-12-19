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

	public static var stringVars:Map<String, String> =
	[
		"%pname%" => "bownly",
		"%item%" => ":O",
	];

	public static var stringArray:Array<Array<DialogLine>> = [

		// 0
		[new DialogLine(0, Reg.pName + ", get up!\nHow could you sleep in on today of all days?"),
		new DialogLine(0, "Hurry up, you don't want to be late! You\nknow how impatient Elder Froggo can get!"),
		],
		// 1
		[new DialogLine(0, "Hey, " + Reg.pName + ", you look lost.\nStill half asleep, huh?\n" + Reg.rivalName + " already ran ahead. He's such an eager kid."),
		new DialogLine(1, "Huh? \"Where'd he go?\""),
		new DialogLine(0, "To Elder Froggo's house across the pond, obviously!\nYou'd best follow his lead and head there yourself."),
		],
		// 2
		[new DialogLine(0, "Not so fast, bud. Elder Froggo is waiting for you.")
		],
		// 3
		[new DialogLine(25, Reg.pName + "! " + Reg.rivalName + "!\nI'm so proud of the both of you. You're about\nto embark on the final stage of your\ntraining: your pilgrimage to the capitol!"),
		new DialogLine(26, "blah blah blah blah blah blah"),
		new DialogLine(27, "blah blah blah blah blah blah"),
		new DialogLine(28, "blah blah blah blah blah blah"),
		new DialogLine(29, "blah blah blah blah blah blah"),
		new DialogLine(25, "Oh, and before you go, I suggest you\npractice your skills on my test dummy.")
		],
		// 4
		[new DialogLine(50, "Here's a tutorial on how to play!:"),
		new DialogLine(50, "Look up the rules for picross if you don't\nknow them!")
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
		[new DialogLine(50, "Hi ho! I'm the practice dummy! Wanna\npractice!? C'mon, it'll be fun!")
		],

		// 11
		[new DialogLine(1, "Oh! You're awake."),
		new DialogLine(0, "I was wondering how long you were going to be out."),

		// Dialog branch:
		// Who are you?
		new DialogLine(0, "I'm %Water Kid%, Prince of..."),
		new DialogLine(3, "Er..."),
		new DialogLine(2, "This base!"),

		// Where am I?
		new DialogLine(0, "This is my secret base, located right in the\nmiddle of the Ice and Fire Kingdoms."),
		new DialogLine(0, "I found you washed up by the shore and\ncarried you here. You've been out for two\nwhole days."),

		new DialogLine(0, "*You ask him about " + Reg.rivalName + ".*"),

		new DialogLine(3, "Sorry, %pname%, but you were the\nonly person that I saw in the wreckage."),
		new DialogLine(0, "But I'm sure your friend is okay!\nIn fact, I bet he went to go find help for you!"),
		new DialogLine(0, "Which means that he would have probably\nheaded towards one of the nearby\nkingdoms."),
		new DialogLine(0, "Either the Ice Kingdom to the North, or the\nFire Kingdom to the South."),
		// note for below line: if IK is healers or whatever, mention that instead. Then, have flag for dialog after IK visit, telling MC to go try FK instead.
		new DialogLine(0, "They're both equidistant from here, so your\nguess is as good as mine as to which one he went to."),
		new DialogLine(3, "No matter which one you go investigate, do\nme a favor:\nPlease don't mention me or my secret base\nto anyone."),
		new DialogLine(2, "Well, good luck finding " + Reg.rivalName + "!\nAnd let me know if you manage to find him!"),
		new DialogLine(0, "Oh, and if you need a place to rest in the\nmeantime, you can crash here.\nYou were out for a while and might still be\nweak."),

		new DialogLine(0, "Hey, bud, how goes it?"),

		// Ice Kingdom
		new DialogLine(0, "Halt! The entire Ice Kingdom is in lockdown\nright now. No one gets in and no one gets\nout until we locate Prince Water Kid."),

		// Fire Kingdom
		new DialogLine(0, "Hello, traveller. Welcome to the Fire\nKingdom."),

		new DialogLine(0, "I've heard that the Ice Kingdom is in\nlockdown. Apparently Prince Water Kid ran\naway. I hope he's safe.")
		],

		// 12
		[new DialogLine(0, "Normal")
		],
		// 13
		[new DialogLine(0, "Heals 20 MP.\nAnd it tastes great too!")
		],		
				// s.split(sub).join(by)
		// 14
		[new DialogLine(0, "I just got 1 %item%!")
		],
		// 15
		[new DialogLine(0, "Sure")
		],
		// 16
		[new DialogLine(0, "No")
		],	
		// 17
		[new DialogLine(50, "Sweet! Let's go!")
		],
		// 18
		[new DialogLine(50, "Oh well! Maybe later!")
		],
		// 19
		[new DialogLine(20, "Too bad! Try being happy like me!")
		],

		// 20
		[new DialogLine(0, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(1, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(2, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(3, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(4, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(5, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(6, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(7, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(8, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(9, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(10, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(11, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(12, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(13, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(14, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(15, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(16, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(17, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(18, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(19, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(20, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(21, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(22, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(23, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		new DialogLine(24, "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		],

	];

}



// "The hood is more than just a hood: it's a symbol. It proves that you're a magician. Without it, you'll just be another face in the crowd."
// "People won't care who you are until they see you put on your hood. Moreover, it enhances your magic. You should wear it always."
// "What about when you're bathing?"
// "I keep mine on. It's a good opportunity to wash it. I treat my hood as an extension of my head."
// "So then if I take off your hood, would you die?"
// "It would be extremely painful..."
// "You're an intense guy."
// "...For you."

// // Return to Water Kid
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),
// new DialogLine(0, ""),



// >Meet Water Kid
// >He tells you to goto either kingdom to find rival

// >Check Ice Kingdom
// >Ice Kingdom in lockdown

// >Check Fire Kingdom
// >No one in Fire Kingdom has seen Rival. Hinted that he's probably in the Ice Kingdom (maybe they're healers?)
// >Hear about runaway Water Kid. Ran away from IK, caused the lockdown.
// >FK people say kingdoms should use this as a chance to merge. One race: the elemental race :^)

// >Return to Water Kid
// >He tells you he's the missing prince. Son of IK princess and FK prince.
// >Tells you "As you've probably gathered", IK wants to shun water people and fire people; FK wants to merge kingdoms.
// >Water Kid was being held in IK until the 2 kingdoms reached an agreement. He escaped to flee from the drama.
// >Says he doesn't feel like he belongs in either kingdom since he's neither an ice guy or fire guy.
// >Asks for help, mentioning that he saw your pen and concluded you're a kekromancer.
// >He doesn't know what the right solution is, but trusts your judgement and suggests you go talk to both kings.
// >Joins your party to get you admittance into both royal chambers.

// BRANCHING PATH STARTS HERE






