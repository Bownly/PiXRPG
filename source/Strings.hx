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
	public static var faces:Map<String, Int> = 
	[
		"p_normal"            => 0,
		"p_shock"             => 1,
		"p_glad"              => 2,
		"p_sad"               => 3,
		"p_mad"               => 4,
		"pfrog_normal"        => 5,
		"pfrog_shock"         => 6,
		"pfrog_glad"          => 7,
		"pfrog_sad"           => 8,
		"pfrog_mad"           => 9,

		"r_normal"            => 10,
		"r_shock"             => 11,
		"r_glad"              => 12,
		"r_sad"               => 13,
		"r_mad"               => 14,
		"rfrog_normal"        => 15,
		"rfrog_shock"         => 16,
		"rfrog_glad"          => 17,
		"rfrog_sad"           => 18,
		"rfrog_mad"           => 19,
		"rowl_normal"         => 20,
		"rowl_shock"          => 21,
		"rowl_glad"           => 22,
		"rowl_sad"            => 23,
		"rowl_mad"            => 24,

		"froggo_normal"       => 25,
		"froggo_shock"        => 26,
		"froggo_glad"         => 27,
		"froggo_sad"          => 28,
		"froggo_mad"          => 29,

		"frogcia_normal"      => 30,
		"frogcia_shock"       => 31,
		"frogcia_glad"        => 32,
		"frogcia_sad"         => 33,
		"frogcia_mad"         => 34,
		"frognpcman_normal"   => 35,
		"frognpcman_shock"    => 36,
		"frognpcman_glad"     => 37,
		"frognpcman_sad"      => 38,
		"frognpcman_mad"      => 39,
		"frognpcwoman_normal" => 40,
		"frognpcwoman_shock"  => 41,
		"frognpcwoman_glad"   => 42,
		"frognpcwoman_sad"    => 43,
		"frognpcwoman_mad"    => 44,
		"frognpckid_normal"   => 45,
		"frognpckid_shock"    => 46,
		"frognpckid_glad"     => 47,
		"frognpckid_sad"      => 48,
		"frognpckid_mad"      => 49,

		"dummy"               => 50,
		"kekdoor"             => 51,
		"gondolagirl"         => 52,
	];

	public static var stringVars:Map<String, String> =
	[
		"%pname%" => "Player",
		"%rivalname%" => "Rivalkid",
		"%item%" => ":O",
	];

	public static var stringArray:Array<Array<DialogLine>> = [

		// 0
		[new DialogLine(faces["frognpc_normal"], "%pname%, get up!\nHow could you sleep in on today of all days?"),
		 new DialogLine(faces["frognpc_normal"], "Hurry up, you don't want to be late! You\nknow how impatient Elder Froggo can get!"),
		],
		// 1
		[new DialogLine(faces["frognpc_normal"], "Hey, %pname%, you look lost.\nStill half asleep, huh?\n%rivalname% just ran through here a moment ago."),
		 new DialogLine(1, "Huh? \"Where'd he go?\""),
		 new DialogLine(faces["frognpc_normal"], "Up ahead to Elder Froggo's house, obviously!\nYou'd best follow his lead and head there yourself."),
		],
		// 2
		[new DialogLine(faces["frognpc_normal"], "Not so fast, bud. Elder Froggo is waiting for you at his house.")
		],
		// 3
		[new DialogLine(faces["froggo_normal"], "%pname%! %rivalname%!\nThe day has finally arrived for you to become full-fledged magicians."),
		 new DialogLine(faces["froggo_normal"], "You're now both of age to receive your hoods. As is tradition, you have to go through the trial cave to get them."),
		 new DialogLine(faces["froggo_normal"], "The entrance to the cave is through that exit to your left. Good luck."),
		 new DialogLine(faces["froggo_normal"], "blah blah blah blah blah blah"),
 		 new DialogLine(faces["froggo_normal"], "blah blah blah blah blah blah"),
 		 new DialogLine(faces["froggo_normal"], "Oh, and before you go, you might want to review the fundamentals of magic with my training dummy.")
		],
		// 4
		[new DialogLine(faces["dummy"], "Hi ho! This is the battle screen! Up in the\ncorner is a display of your MP (Mental\nPoints) and your opponent's MP!"),
		 new DialogLine(faces["dummy"], "The goal of a battle is to reduce your\nopponent's MP to zero! The opponent's\nmental state is represented by the puzzle in the center!"),
		 new DialogLine(faces["dummy"], "In order to reduce your opponent's MP, you must solve that puzzle!"),
		 new DialogLine(faces["dummy"], "Each square in the grid can either be ON or\nOFF! The numbers indicate how many\nconsecutive squares in each column or row\nshould turned be ON!"),
		 new DialogLine(faces["dummy"], "When you fully solve a row or column, the\ncorresponding numbers will turn grey!"),
		 new DialogLine(faces["dummy"], "Fill in squares with the \"J\" button and mark ones you suspect should remain OFF with\nthe \"K\" button!"),
		 new DialogLine(faces["dummy"], "But be careful! If you incorrectly turn ON a\nsquare, the stress will cause you to lose\nsome MP!"),
		 new DialogLine(faces["dummy"], "Also, note that some opponents may\nstruggle in an attempt to thwart your\npuzzle solving efforts! They won't all be\npushovers like I am!"),
		 new DialogLine(faces["dummy"], "Wew! That's a lot of info! Just give it a shot\nand you'll figure it out!"),
		],

		// 5
		[new DialogLine(faces["r_normal"], "Hey dude, A or B?")
		],
		// 6
		[new DialogLine(faces["r_normal"], "A? A+ Sketchless!")
		],
		// 7 
		[new DialogLine(faces["r_normal"], "B? Like Jerry Seinfeld's Bee Movie!")
		],
		// 8
		[new DialogLine(faces["frognpc_normal"], "Hey kid... wanna save?")
		],
		// 9
		[new DialogLine(faces["frognpc_normal"], "Game saved.")
		],

		// 10
		[new DialogLine(faces["dummy"], "Hi ho! I'm the practice dummy! Wanna\npractice!? C'mon, it'll be fun!")
		],

		// 11
		[new DialogLine(faces["frognpckid_shock"], "Oh! You're awake."),
		 new DialogLine(faces["frognpc_normal"], "I was wondering how long you were going to be out."),

		// Dialog branch:
		// Who are you?
		 new DialogLine(faces["frognpc_normal"], "I'm %Water Kid%, Prince of..."),
		 new DialogLine(faces["frognpckid_sad"], "Er..."),
		 new DialogLine(faces["frognpckid_glad"], "This base!"),

		// Where am I?
		 new DialogLine(faces["frognpc_normal"], "This is my secret base, located right in the\nmiddle of the Ice and Fire Kingdoms."),
 		 new DialogLine(faces["frognpc_normal"], "I found you washed up by the shore and\ncarried you here. You've been out for two\nwhole days."),

		 new DialogLine(faces["frognpc_normal"], "*You ask him about %rivalname%.*"),
 
		 new DialogLine(faces["frognpckid_sad"], "Sorry, %pname%, but you were the\nonly person that I saw in the wreckage."),
		 new DialogLine(faces["frognpc_normal"], "But I'm sure your friend is okay!\nIn fact, I bet he went to go find help for you!"),
		 new DialogLine(faces["frognpc_normal"], "Which means that he would have probably\nheaded towards one of the nearby\nkingdoms."),
		 new DialogLine(faces["frognpc_normal"], "Either the Ice Kingdom to the North, or the\nFire Kingdom to the South."),
		// note for below line: if IK is healers or whatever, mention that instead. Then, have flag for dialog after IK visit, telling MC to go try FK instead.
		 new DialogLine(faces["frognpc_normal"], "They're both equidistant from here, so your\nguess is as good as mine as to which one he went to."),
		 new DialogLine(faces["frognpckid_sad"], "No matter which one you go investigate, do\nme a favor:\nPlease don't mention me or my secret base\nto anyone."),
		 new DialogLine(faces["frognpckid_glad"], "Well, good luck finding %rivalname%!\nAnd let me know if you manage to find him!"),
		 new DialogLine(faces["frognpc_normal"], "Oh, and if you need a place to rest in the\nmeantime, you can crash here.\nYou were out for a while and might still be\nweak."),

		 new DialogLine(faces["frognpc_normal"], "Hey, bud, how goes it?"),

		// Ice Kingdom
		 new DialogLine(faces["frognpc_normal"], "Halt! The entire Ice Kingdom is in lockdown\nright now. No one gets in and no one gets\nout until we locate Prince Water Kid."),

		// Fire Kingdom
		 new DialogLine(faces["frognpc_normal"], "Hello, traveller. Welcome to the Fire\nKingdom."),

		 new DialogLine(faces["frognpc_normal"], "I've heard that the Ice Kingdom is in\nlockdown. Apparently Prince Water Kid ran\naway. I hope he's safe.")
		],

		// 12
		[new DialogLine(faces["gondolagirl"], "...")
		],
		// 13
		[new DialogLine(faces["p_normal"], "Save game")
		],		
		// 14
		[new DialogLine(faces["p_normal"], "Not now")
		],
		// 15
		[new DialogLine(faces["frognpc_normal"], "Sure")
		],
		// 16
		[new DialogLine(faces["frognpc_normal"], "No")
		],	
		// 17
		[new DialogLine(faces["dummy"], "Sweet! Let's go!")
		],
		// 18
		[new DialogLine(faces["dummy"], "Oh well! Maybe later!")
		],
		// 19
		[new DialogLine(faces["dummy"], "Too bad! Try being happy like me!")
		],

		// 20
		[new DialogLine(faces["gondolagirl"], "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		 new DialogLine(faces["dummy"], "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua."),
		],

		// 21
		[new DialogLine(faces["frogcia_normal"], "I'm CIA."),
		 new DialogLine(faces["frogcia_normal"], "If I take that hood off, will you die?"),
		 new DialogLine(faces["p_normal"], "It would be extremely painful..."),
		 new DialogLine(faces["frogcia_normal"], "You're a big guy."),
		 new DialogLine(faces["p_normal"], "...For you."),
		],

		// 22
		[new DialogLine(faces["kekdoor"], "Hello, I’m Doory, the door. You have to\nprove your skills to me if you want to pass\nthrough here. That’s how things work down\nhere in the trial dungeon.")
		],

		// 23
		[new DialogLine(faces["kekdoor"], "You’ve reached the end of the first floor.\nNice! Just pass through me and you can\nproceed to the next floor."),
		 new DialogLine(faces["kekdoor"], "By the way, watch out for wild frogs down\nthere. The lack of sunlight makes them\neasily agitated, and they might jump out at\nyou.")
		],

		// 24
		[new DialogLine(faces["kekdoor"], "Here’s a hint: you should use some healing\nitems if your MP starts to get low."),
		 new DialogLine(faces["kekdoor"], "If you can complete my trial, there may or\nmay not be a nice healing item waiting for\nyou in that chest right behind me.")
		],

		// 25
		[new DialogLine(faces["kekdoor"], "Did you know? The doors in this dungeon\nare highly unprofessional. We mostly just\nwant to shoot the breeze, not serve as a\nmakeshift tutorial to some scrubs."),
		 new DialogLine(faces["kekdoor"], "That’s supposed to be that tutorial dummy’s\njob! Between you and me, I’d much rather\nspend my time chatting up Doory. She's one\nfine dame."),
		 new DialogLine(faces["kekdoor"], "..."),
		 new DialogLine(faces["kekdoor"], "Hey, what are you still doing here? Oh right,\nyou're here for a trial. Okay, let's go!")
		],

		// 26
		[new DialogLine(faces["kekdoor"], "These basement frogs aren’t as passive as\nwe doors are. They’ll try to obstruct your\nmagic as you battle them."),
		 new DialogLine(faces["kekdoor"], "They can’t actually lower your MP, but it’s\nstill a bother.")
		],

		// 27
		[new DialogLine(faces["kekdoor"], "Don’t tell Elder Froggo, but I’m feeling under\nthe weather right now and can’t offer you a\ntrial. How about we settle for a joke\ninstead? Okay, ready?"),
		 new DialogLine(faces["kekdoor"], "When is a door not a door? When it’s a jar!\nHehehe. That one’s a real knee-slapper,\neven though I don’t have any knees!")
		],

		// 28
		[new DialogLine(faces["kekdoor"], "Don’t you think that it’s weird how there can\nbe basements floors in a lake dungeon? Or\nhow said lake dungeon is under another\nlake?"),
		 new DialogLine(faces["kekdoor"], "That’s the kind of stuff I think about\nwhenever I have any spare time in between\ntrials. Speaking of which...")
		], 

		// 29
		[new DialogLine(faces["kekdoor"], "The name’s Doorbert and I’m the final door\nin the dungeon. I’m not like the other doors.\nWell, I mean, I’m functionally the same in most objective measures..."),
		 new DialogLine(faces["kekdoor"], "...But I’m not as big a pushover as they are!")
		],

		// 30
		[new DialogLine(faces["kekdoor"], "Shadily, %pname%. Did you know that I’m\nhosting an exchange student? Her name is, uh... well, I’m not sure."),
		 new DialogLine(faces["kekdoor"], "She’s from that one tribe of mute folk. I can't remember their name, and she won't tell me. But you've heard of them, haven't you?")
		],

		// 31
		[
		 new DialogLine(faces["kekdoor"], "Like us, they’re a magical people, but their\nmagic is of a different ilk. Whereas our\nmagic stems from mentality and perception,\ntheir magic has more of a druidic leaning."),
		 new DialogLine(faces["kekdoor"], "It’s said that they often commune with\nnature and can help people \"save\",\nwhatever that means. ")
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
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),
// new DialogLine(faces["frognpc_normal"], ""),



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






